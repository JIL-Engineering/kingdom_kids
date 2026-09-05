# Guide d'architecture Flutter — comment construire un écran ici

*Pour quand tu ne sais pas par où commencer. Ce document explique comment ce projet est structuré, comment parler au serveur, comment gérer l'état avec Riverpod, et comment rendre un écran responsive — avec un exemple complet et réel à la fin (appeler `LibraryEndpoint` et afficher des livres). Basé sur le vrai code du projet après la migration Riverpod (PR #47), pas sur une théorie générique.*

---

## 1. La structure du projet, et pourquoi elle est comme ça

```
lib/
  core/                    <- ce qui traverse TOUTES les fonctionnalités
    auth/                  <- état de session (qui est connecté, etc.)
    routing/               <- go_router, un seul fichier de routes
    theme/                 <- AppColors, AppTextStyles, AppTheme
    widgets/               <- boutons/composants réutilisables partout
  features/                <- une fonctionnalité = un dossier
    auth/screens/
    child_profile/screens/
    settings/screens/
    settings/widgets/
    reader/screens/
```

Ce n'est **pas** de l'architecture "clean" au sens manuel scolaire (pas de couches `domain`/`data`/`presentation` séparées, pas de `repository`/`use case` abstraits). C'est une architecture **par fonctionnalité**, volontairement plus légère : chaque dossier sous `features/` contient tout ce qui concerne CETTE fonctionnalité (écrans, widgets propres à elle), et `core/` contient uniquement ce qui est vraiment partagé par tout le monde.

**Pourquoi ce choix, pas l'autre :** avec une équipe de 3 devs sur un MVP, des couches `domain`/`repository`/`use case` séparées pour chaque fonctionnalité ajoutent des fichiers et de l'indirection avant même d'avoir un vrai besoin de les découpler. Le client Serverpod généré (`client.<endpoint>.<methode>()`) joue déjà le rôle de "couche data" — il n'y a pas de base de données locale complexe à abstraire derrière un repository. Le jour où ce sera vraiment nécessaire (ex: support hors-ligne complet, Sprint 4), ce sera un refactor ciblé, pas une réécriture, parce que la logique métier est déjà isolée dans les providers Riverpod (section 4) plutôt que dispersée dans les widgets.

**La règle pratique :** si un fichier ne sert qu'à UN écran, il va dans `features/<cette-fonctionnalité>/`. S'il sert à PLUSIEURS fonctionnalités (un bouton, une couleur, l'état de connexion), il va dans `core/`.

---

## 2. Parler au serveur : le client Serverpod généré

Il n'y a jamais de `http.get(...)`, jamais de `jsonDecode(...)` à écrire à la main dans ce projet. Chaque `Endpoint` écrit côté serveur (dans `kingdom_kids_server/lib/src/endpoints/`) génère automatiquement une méthode correspondante sur `client`, entièrement typée.

```dart
// Le serveur définit (kingdom_kids_server/lib/src/endpoints/library_endpoint.dart) :
Future<List<BookSummary>> browseBooks(Session session, {...}) async { ... }

// Le client généré donne accès à exactement ça, côté Flutter :
final books = await client.library.browseBooks(ageBracket: AgeBracket.preschool);
```

`client` est la variable globale définie dans `main.dart` — visible partout dans l'app en important `main.dart`. Si le serveur ajoute/change une méthode, il suffit de relancer `serverpod generate` côté serveur (Daniel s'en occupe) — le code du client se met à jour tout seul, avec les vraies erreurs de compilation si tu appelles mal la méthode. Pas de faute de frappe silencieuse possible.

**Ce qui peut aller mal :** un appel réseau peut échouer (pas de connexion, session expirée, erreur serveur). `await client.xxx.yyy()` peut lever une exception — toujours entouré d'un `try/catch` si l'utilisateur doit voir un message d'erreur plutôt qu'un crash (voir l'exemple section 5).

---

## 3. Riverpod : gérer l'état qui change avec le temps

Riverpod répond à une seule question : **où vit une donnée qui doit survivre au-delà d'un seul widget, et comment un widget est notifié quand elle change ?**

Deux formes, selon si la donnée est *calculée une fois puis figée* ou *modifiable par des actions utilisateur*.

### 3.1 — Donnée qui se calcule et se met en cache : une fonction `@riverpod`

Pour "va chercher quelque chose côté serveur, garde le résultat en cache, redemande si besoin" :

```dart
@riverpod
Future<List<BookSummary>> libraryBooks(Ref ref) async {
  return client.library.browseBooks();
}
```

Ça génère automatiquement `libraryBooksProvider`. Un widget qui fait `ref.watch(libraryBooksProvider)` reçoit un `AsyncValue<List<BookSummary>>` — jamais directement la liste, parce que l'appel réseau a trois états possibles (en cours, réussi, échoué) et `AsyncValue` t'oblige à gérer les trois (section 5).

### 3.2 — Donnée modifiable par l'utilisateur : une classe `@riverpod`

Pour "il y a un état, et des actions qui le changent" — l'exemple réel du projet est `SessionNotifier` (`lib/core/auth/session_state.dart`) :

```dart
@Riverpod(keepAlive: true)
class SessionNotifier extends _$SessionNotifier {
  @override
  SessionData build() {
    // appelé une fois, construit l'état initial
    return const SessionData(...);
  }

  void unlockParentMode() {
    // une action : remplace l'état par un nouveau, immuable
    state = SessionData(..., isParentModeUnlocked: true);
  }
}
```

Point important, différent d'un `ChangeNotifier` classique : **on ne modifie jamais l'état en place, on le remplace entièrement** (`state = ...`, pas `state.champ = ...`). C'est pour ça que `SessionData` est une classe avec des champs `final` — impossible de la muter par erreur depuis un autre fichier.

### 3.3 — `ref.watch` vs `ref.read` : l'erreur la plus commune

- **`ref.watch(monProvider)`** — "je veux que ce widget se reconstruise quand cette donnée change." Utilisé dans `build()`.
- **`ref.read(monProvider.notifier).maMethode()`** — "je veux déclencher une action une seule fois, maintenant" (un clic de bouton, une soumission de formulaire). Utilisé dans un `onPressed`, jamais dans `build()`.

Utiliser `ref.watch` dans un `onPressed` ou `ref.read` dans `build()` compile très bien et casse silencieusement (widget qui ne se met jamais à jour, ou action déclenchée à chaque reconstruction) — l'erreur ne montre aucun message clair, donc vaut le coup de vérifier ces deux-là en particulier si un écran "ne réagit pas".

### 3.4 — Brancher un widget sur Riverpod

```dart
class MonEcran extends ConsumerWidget {           // pas StatelessWidget
  const MonEcran({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {  // ref en plus
    final session = ref.watch(sessionProvider);
    return Text(session.isAuthenticated ? 'Connecté' : 'Pas connecté');
  }
}
```

Pour un écran avec état local en plus (un `TextEditingController`, un `bool _isSubmitting`) : `ConsumerStatefulWidget` + `ConsumerState<MonEcran>` au lieu de `StatefulWidget`/`State<MonEcran>` — même chose, avec `ref` disponible partout dans la classe. Exemple réel : `pin_gate_screen.dart`.

**Après avoir modifié un provider `@riverpod` :** il faut régénérer le code, comme pour Serverpod mais avec un outil différent :

```
dart run build_runner build
```

(ou `dart run build_runner watch` pendant que tu développes, pour que ça se refasse tout seul à chaque sauvegarde). Le fichier généré s'appelle `<nom_du_fichier>.g.dart` — ne jamais le modifier à la main, comme les fichiers générés par Serverpod.

---

## 4. Responsive : que l'écran marche sur téléphone ET tablette

La spec (`03_technical_spec.md`) demande un support tablette. Les outils Flutter à connaître, du plus simple au plus complet :

**`MediaQuery`** — pour lire la taille de l'écran actuel :
```dart
final largeur = MediaQuery.sizeOf(context).width;
```

**`LayoutBuilder`** — pour changer de mise en page selon l'espace *disponible pour ce widget précis* (pas tout l'écran — utile dans un widget qui peut être petit ou grand selon où il est placé) :
```dart
LayoutBuilder(
  builder: (context, constraints) {
    if (constraints.maxWidth > 600) {
      return _GrilleTablette();
    }
    return _ListeTelephone();
  },
)
```

**La règle pratique pour ce projet :** ne jamais coder en dur une largeur/hauteur en pixels pour quelque chose qui doit s'adapter (`SizedBox(width: 400)` est un piège sur petit écran). Préférer `Expanded`, `Flexible`, `MainAxisSize`, ou un `GridView` avec `crossAxisCount` calculé depuis la largeur disponible plutôt qu'une valeur fixe. Le seuil `600` ci-dessus est la convention Material courante pour distinguer téléphone/tablette — pas une règle stricte, juste un point de départ raisonnable.

---

## 5. Exemple complet : afficher les livres de la bibliothèque

Ceci est un exemple de référence, pas un fichier à copier tel quel dans le projet — le vrai écran bibliothèque (issue #9, pas encore assignée) doit suivre la maquette et être construit par la personne à qui c'est confié. Mais le *pattern* ci-dessous — appel serveur + Riverpod + `AsyncValue.when` — est exactement celui à réutiliser.

```dart
// 1. Le provider : appelle le serveur, Riverpod gère le cache et les
//    trois états (chargement / erreur / données) automatiquement.
@riverpod
Future<List<BookSummary>> libraryBooks(Ref ref) {
  return client.library.browseBooks();
}

// 2. Le widget : consomme le provider, gère les trois états explicitement.
class LibraryScreen extends ConsumerWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final booksAsync = ref.watch(libraryBooksProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Library')),
      body: booksAsync.when(
        // Cas 1 : la requête est en cours.
        loading: () => const Center(child: CircularProgressIndicator()),

        // Cas 2 : la requête a échoué (réseau, serveur, session expirée...).
        error: (error, stackTrace) => Center(
          child: Text('Could not load books: $error'),
        ),

        // Cas 3 : succès, on a la vraie liste de BookSummary.
        data: (books) => GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            // Responsive : plus de colonnes sur un écran large (tablette).
            crossAxisCount: MediaQuery.sizeOf(context).width > 600 ? 4 : 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemCount: books.length,
          itemBuilder: (context, index) {
            final book = books[index];
            return Column(
              children: [
                Expanded(
                  child: book.coverImageAsset != null
                      ? Image.network(book.coverImageAsset!, fit: BoxFit.cover)
                      : const Icon(Icons.book, size: 48),
                ),
                Text(book.title, textAlign: TextAlign.center),
              ],
            );
          },
        ),
      ),
    );
  }
}
```

**Ce qui se passe, dans l'ordre :**
1. `ref.watch(libraryBooksProvider)` déclenche l'appel `client.library.browseBooks()` la première fois que ce widget existe, et met le résultat en cache — un deuxième widget qui regarde le même provider ne redéclenche pas l'appel réseau.
2. `.when(...)` force à gérer explicitement les trois issues possibles d'un appel réseau — impossible d'oublier le cas d'erreur, contrairement à un simple `try/catch` qu'on peut négliger.
3. `book.coverImageAsset` est déjà une URL utilisable directement dans `Image.network(...)` — le serveur a fait le travail de résoudre le nom de fichier en URL réelle (voir `03_technical_spec.md` §4 pour pourquoi c'est une URL publique temporaire, pas encore signée).

**Pour aller plus loin toi-même** (ne le fais pas juste en copiant-collant, comprends pourquoi) : que se passe-t-il si l'utilisateur tire vers le bas pour rafraîchir ? Indice : `ref.invalidate(libraryBooksProvider)` force le provider à relancer l'appel serveur au lieu de servir le cache.

---

## 6. En résumé — la checklist pour construire un nouvel écran

1. Le dossier : `lib/features/<fonctionnalite>/screens/`, pas ailleurs.
2. Toutes les couleurs/tailles de texte : `AppColors`/`AppTextStyles`, jamais en dur (`07_team_playbook.md` §2).
3. Une donnée qui vient du serveur et ne change pas par action utilisateur : fonction `@riverpod` + `AsyncValue.when`.
4. Une donnée modifiable par l'utilisateur (formulaire, toggle, état de session) : classe `@riverpod` (`Notifier`).
5. Après avoir touché un provider : `dart run build_runner build`.
6. Widget qui lit un provider : `ConsumerWidget`/`ConsumerStatefulWidget`, jamais `StatelessWidget`/`StatefulWidget`.
7. Layout : pas de largeur/hauteur fixe pour ce qui doit s'adapter — `LayoutBuilder`/`MediaQuery` avec le seuil ~600px téléphone/tablette.
