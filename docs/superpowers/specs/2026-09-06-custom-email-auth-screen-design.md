# Custom email/password sign-in screen — design spec

## Context and goal

`AuthScreen` (`kingdom_kids_flutter/lib/features/auth/screens/auth_screen.dart`)
currently wraps `serverpod_auth_idp_flutter`'s bundled `SignInWidget`, which renders
its own generic styling. The team has decided to replace it with a fully
custom-branded screen matching `kingdomkidsdesignmockupui/images/parent_login_screen.png`
and `family_signup_screen.png`, without touching the server or reimplementing any
auth logic.

This is the first of four sub-projects identified for the login/signup area — this
spec covers **email/password only**. Google Sign-In, Apple Sign-In, and biometric
quick-unlock are deliberately out of scope here and will each get their own design
pass once their external prerequisites exist (an OAuth client for Google, a "Sign in
with Apple" entitlement for Apple, and a `local_auth` integration for biometric —
none of which are needed for this piece).

## Decisions already made (from brainstorming)

- **Scope for this pass**: email + password login, sign-up (with email
  verification), and forgot-password. No name field, no "how many kids" tier
  picker — the backend's `AppUser`/`completeProfile` has no field for a parent
  name, and child count is already handled by the existing repeatable "Add Child
  Profile" flow (`/profiles/add`). If a name field is wanted later, that's a
  separate backend change (new `users` column + `completeProfile` parameter), not
  part of this spec.
- **Consent ordering**: `ConsentScreen` and the router's consent enforcement stay
  exactly as they are today. The `family_signup_screen.png` mockup's Terms/Privacy
  checkbox is informational only (links out to the policies) — it is **not** the
  parental-consent record. Per `docs/03_technical_spec.md` §5, consent must remain
  its own explicit step, not a checkbox in a signup form.
- **State management**: reuse `serverpod_auth_idp_flutter`'s exported
  `EmailAuthController` (a `ChangeNotifier` the package explicitly documents as
  usable "with any UI implementation" / "integrating with state management
  solutions") wrapped in a `@riverpod` Notifier, so this screen follows the same
  Riverpod pattern as the rest of the app (`docs/11_flutter_architecture_guide.md`
  §3) instead of introducing a second reactive-state system. Rejected alternatives:
  using the `ChangeNotifier` directly via `ListenableBuilder` (works, but is a
  second pattern other contributors would need to learn just for this screen), and
  reimplementing the flow against the raw `EndpointEmailIdpBase` methods directly
  (throws away the package's already-built email validation, password
  requirements, and error-message mapping for no benefit).
- **Screen/route shape**: one `/auth` route, not one route per step. The package's
  own `EmailSignInWidget` internally swaps sub-forms based on
  `controller.currentScreen` rather than navigating between routes — we follow the
  same shape, driven by Riverpod state instead of the controller's own
  `ChangeNotifier` state.
- **Post-auth navigation**: none needed in the new screen. `SessionNotifier`
  (`lib/core/auth/session_state.dart`) already listens to
  `client.auth.authInfoListenable` and updates session state as soon as
  `client.auth.updateSignedInUser(...)` is called; `app_router.dart`'s
  `_RouterRefreshNotifier` listens to that session state and re-runs the redirect
  logic automatically. The current `AuthScreen`'s
  `onAuthenticated: () => context.go('/consent')` becomes unnecessary and should be
  removed rather than carried over.

## File layout

All new files under `kingdom_kids_flutter/lib/features/auth/`:

```
state/
  auth_flow_notifier.dart      <- @riverpod class wrapping EmailAuthController
screens/
  auth_screen.dart              <- replaces the current file; switches on
                                    currentScreen to pick which form to show
widgets/
  login_form.dart
  signup_start_form.dart        <- email entry, triggers startRegistration()
  verification_code_form.dart   <- shared by registration + password reset
  set_password_form.dart        <- shared by completeRegistration +
                                    completePasswordReset
  forgot_password_form.dart
```

No changes to `kingdom_kids_client` or the server — this is Flutter-only.

## `AuthFlowNotifier` design

```dart
@riverpod
class AuthFlowNotifier extends _$AuthFlowNotifier {
  late final EmailAuthController _controller;

  @override
  AuthFlowState build() {
    _controller = EmailAuthController(client: client);
    _controller.addListener(_onControllerChanged);
    ref.onDispose(() {
      _controller.removeListener(_onControllerChanged);
      _controller.dispose();
    });
    return AuthFlowState.fromController(_controller);
  }

  void _onControllerChanged() {
    state = AuthFlowState.fromController(_controller);
  }

  // Thin pass-throughs -- no business logic duplicated here.
  Future<void> login() => _controller.login();
  Future<void> startRegistration() => _controller.startRegistration();
  Future<void> verifyRegistrationCode() =>
      _controller.verifyRegistrationCode();
  Future<void> finishRegistration() => _controller.finishRegistration();
  Future<void> startPasswordReset() => _controller.startPasswordReset();
  Future<void> verifyPasswordResetCode() =>
      _controller.verifyPasswordResetCode();
  Future<void> finishPasswordReset() => _controller.finishPasswordReset();
  Future<void> resendVerificationCode() =>
      _controller.resendVerificationCode();
  void navigateTo(EmailFlowScreen screen) => _controller.navigateTo(screen);
  bool navigateBack() => _controller.navigateBack();

  TextEditingController get emailController => _controller.emailController;
  TextEditingController get passwordController =>
      _controller.passwordController;
  TextEditingController get verificationCodeController =>
      _controller.verificationCodeController;
}

@immutable
class AuthFlowState {
  const AuthFlowState({
    required this.currentScreen,
    required this.isLoading,
    required this.errorMessage,
  });

  factory AuthFlowState.fromController(EmailAuthController c) =>
      AuthFlowState(
        currentScreen: c.currentScreen,
        isLoading: c.isLoading,
        errorMessage: c.errorMessage,
      );

  final EmailFlowScreen currentScreen;
  final bool isLoading;
  final String? errorMessage;
}
```

The `TextEditingController`s stay owned by the package's `EmailAuthController`
(not recreated here) — the notifier just exposes them so the widgets can attach
them to `TextField`s, exactly as the package's own forms do internally.

## `AuthScreen` design

```dart
class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flow = ref.watch(authFlowNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.cream,
      body: SafeArea(
        child: switch (flow.currentScreen) {
          EmailFlowScreen.login => const LoginForm(),
          EmailFlowScreen.startRegistration => const SignupStartForm(),
          EmailFlowScreen.verifyRegistration ||
          EmailFlowScreen.verifyPasswordReset => const VerificationCodeForm(),
          EmailFlowScreen.completeRegistration ||
          EmailFlowScreen.completePasswordReset => const SetPasswordForm(),
          EmailFlowScreen.requestPasswordReset => const ForgotPasswordForm(),
        },
      ),
    );
  }
}
```

Each form widget is a `ConsumerWidget` that:
1. Reads `ref.watch(authFlowNotifierProvider)` for `isLoading`/`errorMessage`.
2. Attaches `ref.read(authFlowNotifierProvider.notifier).emailController` (etc.)
   to its `TextField`s.
3. Calls the matching action method (`login()`, `startRegistration()`, ...) from
   its submit button's `onPressed`, guarded by `isLoading` to disable the button
   mid-request (same UX as the button already has via the package widget today).
4. Shows `errorMessage` via `ScaffoldMessenger` `SnackBar`, matching the current
   `AuthScreen`'s existing error-display pattern.

`VerificationCodeForm` and `SetPasswordForm` are each shared between two
`EmailFlowScreen` values (registration vs. password-reset), so each reads
`flow.currentScreen` itself to decide which action to call: `verifyRegistrationCode()`
vs. `verifyPasswordResetCode()` for the former, `finishRegistration()` vs.
`finishPasswordReset()` for the latter. The label text ("Verify your email" vs.
"Reset your password") switches the same way.

`login_form.dart` and `signup_start_form.dart` are the two screens with mockups
already (`parent_login_screen.png`, `family_signup_screen.png` — minus the name
field and kid-count picker per the scope decision above). The other three
(`verification_code_form.dart`, `set_password_form.dart`,
`forgot_password_form.dart`) have no mockup yet; they should follow the same
visual language (cream background, amber CTA, navy text, crown logo header) but
don't need a designer pass before implementation — they're simple single-field
forms.

## Routing change

In `app_router.dart`, the `/auth` route's builder is unchanged
(`AuthScreen()`), but `AuthScreen` no longer takes an `onAuthenticated` callback —
remove it from the constructor entirely, since `AuthFlowNotifier`'s
`EmailAuthController` already calls `client.auth.updateSignedInUser(...)` on
success, and the router's existing redirect logic takes it from there.

## Error handling

No new error-handling pattern. `AuthFlowState.errorMessage` surfaces whatever
`EmailAuthController.errorMessage` already produced (the package's
`convertToUserFacingException` already maps exceptions like invalid credentials,
too-many-attempts, and expired verification codes to human-readable strings) —
forms just display it via `SnackBar`, matching today's `AuthScreen`.

## Testing

Widget tests per form file (`flutter_test`, already a dev dependency), each
pumping the widget with a `ProviderScope` override supplying a fake
`AuthFlowNotifier` state, and asserting: the right fields render for that
`EmailFlowScreen` value, the submit button disables while `isLoading`, and the
error message renders when `errorMessage` is non-null. No integration/driver test
changes needed — `flutter_driver`-based tests exercise whatever screen is
currently mounted at `/auth`, which continues to be `AuthScreen` regardless of
its internal implementation.

## Explicitly out of scope (separate future specs)

- Google Sign-In (needs a Google Cloud OAuth client + Android/iOS config).
- Apple Sign-In (needs the "Sign in with Apple" capability + Xcode entitlement).
- Biometric quick-unlock (needs the `local_auth` package + a secure-storage
  design for replaying a stored session — unrelated to `serverpod_auth_idp`).
- A parent name field (needs a backend `users` column + `completeProfile`
  parameter change).
- Any pricing/tier concept (needs a product decision; nothing in the current
  docs establishes paid tiers).
