# Sprint 1 — Auth & Profils : répartition des tâches

*L'état actuel, pas un redémarrage du Sprint 0 — le Sprint 0 est terminé (le serveur, le client et le package Flutter existent tous les trois et compilent ; les modèles de base de données pour tout le schéma de la Phase 1 existent déjà ; le Postgres local tourne via `serverpod start` ; le projet Supabase de production est en ligne et la RLS vient d'être fermée). Ce document reprend exactement là où le repo en est aujourd'hui. Les issues GitHub correspondantes sont liées pour chaque tâche — voir `07_team_playbook.md` pour les commandes et concepts référencés ci-dessous.*

---

## Sterelle — Base de données & traitement des données

### Tâche 1 : corriger les deux écarts de type modèle/schéma (voir l'issue GitHub assignée)

**Contexte :** la base de données de production a été initialisée en appliquant `db/schema.sql` directement, pas en faisant tourner les propres migrations de Serverpod pour les tables de l'app. Deux colonnes sont sorties correctes selon `db/schema.sql`, mais ne correspondent pas à ce que les `.spy.yaml` déclarent actuellement :

| Table.colonne | Type réel en base | Ce que dit `.spy.yaml` actuellement |
|---|---|---|
| `badges.trigger_rule` | `jsonb` | `String` (`badge.spy.yaml`) |
| `devotionals.date` | `date` | `DateTime` (`devotional.spy.yaml`) |

C'est important car l'historique de migrations de Serverpod ne sait pas que le schéma réel correspond déjà à `db/schema.sql` — si quelqu'un lance `create_migration` avant que ce soit corrigé, Serverpod va comparer les (mauvais) types `String`/`DateTime` du modèle avec ce qu'il *pense* que la base devrait être, et pourrait générer un `ALTER COLUMN` destructeur en essayant de « corriger » des colonnes `jsonb`/`date` qui sont en fait déjà correctes.

**Étape 1 :** dans `kingdom_kids_server/lib/src/models/badge.spy.yaml`, change `triggerRule: String` vers le type de colonne JSON actuel de Serverpod pour ta version installée — vérifie `serverpod --version` face à la documentation Serverpod pour le scalaire supporté (ça a changé entre les versions de Serverpod, donc vérifie plutôt que de supposer). Si aucun type JSON natif n'est disponible dans cette version, la solution de repli est de garder `String` et de mettre à jour à la place le commentaire dans `db/schema.sql` pour noter que la colonne est traitée comme du texte JSON opaque au niveau applicatif — indique cette décision dans la PR dans les deux cas, pour que Daniel sache laquelle a été retenue, car ça change comment il lit/écrit `triggerRule` dans le code.

**Étape 2 :** dans `kingdom_kids_server/lib/src/models/devotional.spy.yaml`, vérifie si ta version installée de Serverpod a un scalaire « date seule » distinct de `DateTime`. Si oui, utilise-le. Sinon, même chose que ci-dessus — documente la décision plutôt que de laisser un écart silencieux.

**Étape 3 :** une fois le serveur lancé (demande à Emmanuel ou à qui l'a déjà en local, ou coordonnez un moment pour lancer `serverpod start` ensemble), cherche la commande de **réparation de migration** dans la CLI Serverpod plutôt que la commande normale `serverpod create-migration` — lance `serverpod --help` et `serverpod create-migration --help` pour trouver le nom exact dans ta version installée (ça a bougé entre les versions de Serverpod). C'est fait spécifiquement pour « la base réelle et mon historique de migrations ne sont pas d'accord, réconcilie-les sans générer un diff destructeur », contrairement à `create-migration` normal qui, ici, générerait le mauvais diff. Lis la migration générée avant de confirmer.

**Étape 4 :** vérifie dans le tableau de bord Supabase (Table Editor sur les tables `badges` et `devotionals`) que les deux colonnes montrent toujours les bons types réels après l'exécution de la migration de réparation.

### Tâche 2 : auditer le reste des modèles face à `db/schema.sql`

Maintenant que tu as une visibilité directe sur la base via le tableau de bord Supabase, parcours le Table Editor table par table et confirme que chaque colonne, type, nullabilité et contrainte unique correspond à la fois à `db/schema.sql` et au `.spy.yaml` correspondant. Tu as déjà deux écarts confirmés ci-dessus — il y en a peut-être d'autres qu'on n'a pas encore trouvés. Poste tes découvertes en commentaire sur ton issue GitHub plutôt que de tout corriger silencieusement d'un coup, car certaines corrections (comme la Tâche 1) nécessitent une migration coordonnée, pas juste une modification de yaml.

### Note sur `AppUser` (à lire avant que Daniel commence sa Tâche 1 ci-dessous)

`app_user.spy.yaml` stocke actuellement `email` et `passwordHash` directement. Ça duplique ce que le fournisseur email de `serverpod_auth_idp` gère déjà en interne (sa propre table `serverpod_auth_idp_email_account`, déjà présente en base). La Tâche 1 de Daniel ci-dessous retravaille `AppUser` pour référencer l'utilisateur du module d'authentification par son ID, au lieu de dupliquer email/mot de passe. C'est une tâche partagée — coordonne la modification du `.spy.yaml` avec Daniel plutôt que de le modifier chacun de votre côté.

---

## Daniel — Backend

### Tâche 1 : réconcilier `AppUser` avec `serverpod_auth_idp` (à faire avant d'écrire la logique de `AuthEndpoint`)

**Contexte :** actuellement, `AppUser` (`app_user.spy.yaml`) a ses propres champs `email`/`passwordHash`, comme si on gérait notre propre authentification maison. Mais ce projet utilise `serverpod_auth_idp`, qui gère déjà le stockage email/mot de passe, le hachage, et les jetons de session en interne — c'est tout l'intérêt d'utiliser ce module plutôt que de coder l'authentification à la main. `AppUser` devrait plutôt ne contenir que les champs *propres à l'app* que le module d'authentification ne connaît pas : `country`, `timezone`, `preferredLanguage`, `consentGivenAt`.

**Étape 1 :** modifie `app_user.spy.yaml` pour retirer `email` et `passwordHash`, et ajoute une référence vers l'enregistrement utilisateur du module d'authentification :

```yaml
class: AppUser
table: users
fields:
  authUser: module:serverpod_auth_core:AuthUser?, relation(onDelete=Cascade)
  country: String?
  timezone: String
  preferredLanguage: String
  consentGivenAt: DateTime?
  createdAt: DateTime
indexes:
  users_auth_user_idx:
    fields: authUserId
    unique: true
```

Vérifie cette syntaxe exacte de champ/relation face à la documentation de ta version installée de Serverpod avant de l'exécuter — la syntaxe de relation vers un module peut changer entre les versions.

**Étape 2 :** lance `serverpod generate`, puis `serverpod create-migration` (celui-ci est un changement de schéma normal, non destructeur, donc la commande normale suffit ici — seule la Tâche 1 de Sterelle a besoin de la commande de réparation).

**Étape 3 :** dans `kingdom_kids_server/lib/src/endpoints/auth_endpoints.dart` (actuellement vide), le vrai flux d'« inscription » est : le client s'inscrit d'abord via le propre endpoint email de `serverpod_auth_idp` (déjà branché via `email_idp_endpoint.dart`) — c'est ça qui crée l'`AuthUser` et la session. Ton `AuthEndpoint` a alors besoin d'une seule méthode, par exemple `completeProfile`, appelée juste après l'inscription, qui :
  1. Lit `session.authenticated?.authUserId` pour récupérer l'ID de l'utilisateur qui vient d'être créé.
  2. Crée la ligne `AppUser` correspondante avec `country`, `timezone`, `preferredLanguage`, et `consentGivenAt` (renseigné uniquement quand `consentAccepted == true` est passé en paramètre — ne jamais permettre la création d'un profil enfant tant que ce champ est nul, conformément à l'exigence de conformité de la spec).

**Étape 4 :** crée `kingdom_kids_server/lib/src/business/auth_service.dart` avec la vraie logique (création de la ligne `AppUser`, validation que `preferredLanguage` vaut bien `'en'`/`'fr'` puisque le modèle n'impose pas cette contrainte CHECK, contrairement à `db/schema.sql`). `AuthEndpoint.completeProfile` doit appeler ce service, pas contenir la logique lui-même.

**Étape 5 :** vérifie le verrou de consentement : aucun `ChildProfile` ne doit pouvoir être créé tant que `consentGivenAt` est nul. C'est une exigence de conformité stricte (`docs/03_technical_spec.md` §6), pas un simple confort — écris un test pour ça.

### Tâche 2 : `ChildEndpoint` (partie backend de l'issue GitHub #4)

Selon `docs/03_technical_spec.md` §4 :

```
ChildEndpoint
  listChildren() -> List<ChildProfile>
  createChild(displayName, birthYear, preferredLanguage, avatarId) -> ChildProfile
  updateChild(childId, ...) -> ChildProfile
```

**Étape 1 :** crée `kingdom_kids_server/lib/src/endpoints/child_endpoints.dart`. Chaque méthode a besoin de `session.authenticated?.authUserId` pour retrouver l'`AppUser` du parent qui appelle, et chaque requête doit filtrer `child_profiles` par ce parent — un parent ne doit jamais pouvoir lister ou modifier les enfants d'un autre parent. C'est la première vraie logique d'autorisation de l'app ; demande une relecture spécifique à Emmanuel sur ce point avant de fusionner.

**Étape 2 :** `ageBracket` doit être déduit côté serveur à partir de `birthYear`, pas fait confiance depuis l'entrée du client (le client ne devrait pas pouvoir juste prétendre une tranche d'âge différente de ce qu'implique son année de naissance) — mets cette déduction dans `lib/src/business/child_profile_service.dart`.

**Étape 3 :** valide que `preferredLanguage` vaut `'en'`/`'fr'` et que `avatarId` n'est pas vide au niveau du service — même écart de contrainte CHECK que noté plus haut.

Coordonne-toi directement avec Josué une fois que c'est fusionné — il a besoin des méthodes générées `client.child.*` pour construire les écrans de sélection de profil et « Ajouter un enfant » (partie frontend de l'issue GitHub #4).

---

## Josué — Frontend

### Tâche 1 : remplacer l'écran d'accueil provisoire par un vrai routage

`kingdom_kids_flutter/lib/main.dart` utilise maintenant le vrai `AppTheme`, mais `MyHomePage` affiche encore le `GreetingsScreen` du template Serverpod. `go_router` et `provider` sont déjà dans `pubspec.yaml` (pas encore utilisés) — c'est ici qu'ils sont enfin branchés pour de vrai.

**Étape 1 :** crée `kingdom_kids_flutter/lib/core/routing/app_router.dart` avec `go_router`. Fais d'abord de chaque écran pertinent pour le Sprint 1 un simple `Scaffold(body: Center(child: Text('<NomEcran>')))`, pour que toute la structure de navigation fonctionne avant qu'un seul écran ait un vrai contenu :

```
lib/features/auth/screens/onboarding_screen.dart
lib/features/auth/screens/consent_screen.dart
lib/features/auth/screens/login_screen.dart
lib/features/child_profile/screens/profile_picker_screen.dart
lib/features/child_profile/screens/add_child_screen.dart
```

**Étape 2 :** remplace le `home:` de `MyApp` dans `main.dart` par `MaterialApp.router(routerConfig: ...)`.

**Étape 3 :** construis pour de vrai les écrans d'onboarding et de consentement, en suivant `kingdomkidsdesignmockupui/images/screen11.png` (onboarding) et `screen12.png` (consentement) — ces deux-là n'ont besoin d'aucun appel backend pour l'instant, donc c'est le point de départ le plus sûr. Utilise `AppColors`/`AppTextStyles`/`AppTheme` de `lib/core/theme/` pour chaque couleur et style de texte ; jamais de valeur codée en dur.

**Étape 4 :** le bouton « I Consent and Continue » de l'écran de consentement doit appeler le backend une fois la Tâche 1 de Daniel (`AuthEndpoint.completeProfile`) fusionnée — en attendant, mets un `onPressed` provisoire avec un commentaire `// TODO(daniel-tache-1)` et navigue simplement vers l'écran suivant, pour ne pas être bloqué en attendant le backend.

**Étape 5 :** construis `profile_picker_screen.dart` en suivant `screen12.png` (le sélecteur d'avatars « Qui lit aujourd'hui ? ») une fois que `ChildEndpoint.listChildren()` de Daniel (Tâche 2 ci-dessus) est disponible. Même logique pour ne pas être bloqué : commence avec des enfants d'exemple codés en dur, puis remplace par le vrai appel `client.child.listChildren()` une fois qu'il existe.

### Tâche 2 : verrou PIN pour les réglages parent (issue GitHub #5)

Correspond à `screen9.png` (écran Réglages, « Manage Parental PIN »). Remarque : le schéma actuel modélise `pinProtected` comme un booléen **par profil enfant** (`child_profiles.pin_protected`), pas comme un seul PIN au niveau du parent. Avant de construire cet écran, confirme avec Emmanuel/l'équipe si l'intention est vraiment « un PIN par enfant » ou « un seul PIN qui verrouille tout le Mode Parent » (la maquette ressemble plutôt à la deuxième option) — ça change si tu as besoin d'un nouveau champ sur `AppUser` à la place. Signale cette question en commentaire sur l'issue GitHub plutôt que de deviner dans un sens ou dans l'autre ; c'est une conversation de cinq minutes qui évite de construire la mauvaise chose.

---

## Attribution des issues GitHub

| Issue | Titre | Assignée à |
|---|---|---|
| [#3](../../issues/3) | Parent signup/login (JWT) + parental consent step | Daniel (`bec971`) |
| [#4](../../issues/4) | Child profile CRUD + profile picker UI | Daniel (`bec971`) + Josué (`aangejosue-boop`) — répartition backend/frontend selon ce document |
| [#5](../../issues/5) | PIN-protected parent settings gate | Josué (`aangejosue-boop`) |
| [#24](../../issues/24) | Fix badge/devotional model-schema type drift + repair migration | Sterelle (`Sterelle`) |
| [#25](../../issues/25) | Audit all .spy.yaml models against live database | Sterelle (`Sterelle`) |

L'issue #2 (scaffolding du Sprint 0) est fermée — c'est terminé ; le serveur, le client, et le package Flutter existent tous les trois et compilent.
