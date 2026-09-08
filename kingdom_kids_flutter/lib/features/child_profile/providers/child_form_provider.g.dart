// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'child_form_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ChildFormNotifier)
final childFormProvider = ChildFormNotifierProvider._();

final class ChildFormNotifierProvider
    extends $NotifierProvider<ChildFormNotifier, ChildFormState> {
  ChildFormNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'childFormProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$childFormNotifierHash();

  @$internal
  @override
  ChildFormNotifier create() => ChildFormNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChildFormState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChildFormState>(value),
    );
  }
}

String _$childFormNotifierHash() => r'7c865b6fbcdc69a08036adaf79cd0d5055d964fb';

abstract class _$ChildFormNotifier extends $Notifier<ChildFormState> {
  ChildFormState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ChildFormState, ChildFormState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ChildFormState, ChildFormState>,
              ChildFormState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
