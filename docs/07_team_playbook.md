# Kingdom Kids — Guide de l'équipe

*Une référence vivante pour toute l'équipe : les commandes, comment chaque partie de la stack fonctionne, et comment on travaille ensemble sur GitHub. Ce fichier ne change pas à chaque sprint — pour « qu'est-ce que je construis en ce moment », voir `09_sprint2_plan.md` (le sprint précédent reste dans `08_sprint1_assignments.md`).*

Équipe :

| Personne | Rôle | GitHub |
|---|---|---|
| Sterelle | Base de données & traitement des données | [@Sterelle](https://github.com/Sterelle) |
| Daniel | Backend (Serverpod) | [@bec971](https://github.com/bec971) |
| Josué | Frontend (Flutter) | [@aangejosue-boop](https://github.com/aangejosue-boop) |
| Emmanuel | Coordination / lead | [@cgeelectropro](https://github.com/cgeelectropro) |

Personne n'a besoin de connaître toute la stack pour contribuer. Il faut bien connaître **sa** partie, et en savoir assez sur les deux autres pour savoir quoi demander. C'est le but de ce document.

---

## 1. Commandes utiles

### Pour tout le monde

| Commande | Ce qu'elle fait | Quand l'utiliser |
|---|---|---|
| `git checkout -b <nom>/<tache-courte>` | Crée ta branche de travail | Au début de chaque tâche |
| `git status` | Montre ce que tu as modifié | Avant chaque commit |
| `git add <fichier>` | Met en préparation un fichier précis | Jamais `git add .` à l'aveugle — voir §4 |
| `git commit -m "..."` | Enregistre un instantané de ton travail | Après un morceau de travail qui fonctionne et qui est relisable |
| `git push -u origin <branche>` | Envoie ta branche sur GitHub | Quand tu es prêt à ouvrir une pull request |
| `gh pr create` | Ouvre une pull request | Une fois ta branche poussée et prête pour la CI |
| `dart pub get` (depuis la racine du repo) | Installe/résout les dépendances des 3 packages en même temps | Après avoir récupéré des changements qui touchent un `pubspec.yaml` |

Le `pubspec.yaml` à la racine du repo est un **workspace** — il relie `kingdom_kids_client`, `kingdom_kids_server` et `kingdom_kids_flutter` entre eux. Lance toujours `dart pub get` depuis la racine, jamais depuis un sous-dossier, pour que les trois restent synchronisés.

### Backend (Daniel)

| Commande | Ce qu'elle fait |
|---|---|
| `serverpod start` (dans `kingdom_kids_server/`) | Démarre le serveur **et** l'app Flutter compagnon ensemble, avec hot reload automatique pour les deux dès qu'un fichier change. C'est la commande que tu laisses tourner dans un terminal pendant que tu codes |
| `dart analyze` (dans `kingdom_kids_server/`) | Vérifications statiques — attrape les fautes de frappe/erreurs de type avant même d'exécuter quoi que ce soit |
| `dart format .` (dans `kingdom_kids_server/`) | Formate automatiquement le code pour correspondre à la vérification de formatage de la CI |
| `dart test` (dans `kingdom_kids_server/`) | Lance la suite de tests du serveur |
| `serverpod generate` | Régénère les classes Dart côté serveur **et** le client partagé (`kingdom_kids_client`) à partir de tes fichiers `.spy.yaml` — à lancer après chaque modification de modèle |
| `serverpod create-migration` | Compare tes modèles `.spy.yaml` avec la dernière migration et écrit le SQL correspondant à la différence dans `kingdom_kids_server/migrations/`. **Lis toujours le fichier généré avant de l'appliquer** |
| `dart run bin/main.dart --apply-migrations` | Applique les migrations en attente à la base de données configurée dans `config/development.yaml` |

Les flags exacts peuvent changer d'une version de Serverpod à l'autre (`kingdom_kids_server/pubspec.yaml` fixe la version installée) — lance `serverpod --help` et `serverpod create-migration --help` pour confirmer la syntaxe réelle plutôt que de faire confiance à ce tableau les yeux fermés.

**Pour lire les logs du serveur :** ils s'affichent directement dans le terminal où `serverpod start` tourne (`config/development.yaml` a `consoleEnabled: true`) — pas besoin d'outil séparé, il suffit de regarder le terminal.

**Pour un redémarrage complet** (nécessaire après certains changements que le hot reload ne gère pas, par exemple une nouvelle méthode d'endpoint) : arrête `serverpod start` (Ctrl+C) et relance-le.

### Frontend (Josué)

| Commande | Ce qu'elle fait |
|---|---|
| `flutter analyze` (dans `kingdom_kids_flutter/`) | Vérifications statiques pour l'app Flutter |
| `flutter test` (dans `kingdom_kids_flutter/`) | Lance les tests widgets/unitaires |
| `dart format .` | Formate le code Dart (même outil que le backend, fonctionne aussi sur le code Flutter) |
| `r` / `R` dans le terminal où `serverpod start` tourne | `r` = hot reload (garde l'état de l'app), `R` = redémarrage complet — les mêmes raccourcis que `flutter run` |

**Pour déboguer l'app en cours d'exécution :** dès que `serverpod start` lance l'app, le terminal affiche un lien **Flutter DevTools** (`http://127.0.0.1:.../`) — ouvre-le dans un navigateur. Il contient l'inspecteur de widgets, les erreurs de l'app, les performances, tout au même endroit. C'est l'outil standard de l'écosystème Flutter, pas quelque chose de spécifique à ce projet.

### Base de données (Sterelle)

Tu vas passer la majorité de ton temps à éditer des fichiers `.spy.yaml` dans `kingdom_kids_server/lib/src/models/`, **pas** à écrire du SQL directement. `db/schema.sql` est la référence à partir de laquelle tu traduis ; les fichiers `.spy.yaml` sont ce qui génère réellement la base de données.

Pour voir ce qui est *réellement* déployé sur la base de production (pas juste ce que le yaml prétend) : connecte-toi au [tableau de bord Supabase](https://supabase.com/dashboard) du projet Kingdom Kids.

| Où | À quoi ça sert |
|---|---|
| **Table Editor** | Voir chaque table réelle, ses colonnes, ses types, ses contraintes — la vérité terrain |
| **Database → Advisors** | Signale les vrais problèmes de sécurité (par exemple la faille RLS qu'on vient de corriger) — à consulter après chaque changement de schéma |
| **Database → Migrations** | L'historique de migrations propre à Supabase (séparé de celui de Serverpod — voir la note dans `08_sprint1_assignments.md` sur pourquoi ces deux historiques ne sont pas d'accord actuellement) |
| **SQL Editor** | Pour des requêtes de lecture ponctuelles (vérifier des données). Pour les changements de *schéma*, passe toujours par le flux modèle `.spy.yaml` + migration Serverpod, jamais du SQL écrit à la main dans cet éditeur — sinon les deux historiques divergent encore plus |

---

## 2. « Ce n'est pas si effrayant » — conseils par rôle

### Pour Daniel (Backend)

- Un **endpoint** est juste une classe Dart avec des méthodes `async`. Le premier paramètre de chaque méthode est toujours `Session session` — c'est une convention de Serverpod, pas quelque chose que tu configures. Tu écris des fonctions Dart normales ; Serverpod gère le réseau, la sérialisation, et la vérification d'authentification autour.
- Tu n'écriras jamais un appel `fetch()` à la main ni ne parseras du JSON. Dès que tu définis une méthode sur le serveur, `serverpod generate` écrit automatiquement la méthode client correspondante pour Josué — `client.auth.login(...)` est du code généré, pas quelque chose que quelqu'un tape deux fois.
- Garde les endpoints minces : une méthode d'endpoint appelle `lib/src/business/`, elle ne contient pas la logique elle-même. Ce n'est pas de la bureaucratie — ça veut dire que Sterelle ou Josué peuvent lire un fichier d'endpoint et comprendre *ce qu'il fait* sans avoir à comprendre *comment*.
- Le système de migrations paraît intimidant de l'extérieur, mais ton vrai travail est : éditer un fichier `.spy.yaml` → lancer `serverpod create-migration` → **lire le SQL généré** dans `kingdom_kids_server/migrations/` avant de l'appliquer. Tu relis toujours un diff, tu n'écris jamais de `ALTER TABLE` brut à la main.
- Quand quelque chose casse, le terminal où `serverpod start` tourne te dit presque toujours exactement quelle ligne a échoué et pourquoi. Lis le message d'erreur en entier avant de deviner — les erreurs de Dart sont exceptionnellement précises.

### Pour Josué (Frontend)

- Appeler le backend ressemble exactement à appeler une fonction locale : `await client.auth.login(email, password)`. Il n'y a pas de « couche API » séparée à apprendre — le client généré *est* la couche API, et elle est entièrement vérifiée par les types, donc une faute de frappe est un soulignement rouge dans ton éditeur, pas une mauvaise surprise trois écrans plus tard.
- Le système de design est centralisé exprès : `AppColors`, `AppTextStyles`, `AppTheme` dans `lib/core/theme/`. Si jamais tu tapes une couleur hex brute ou un `fontSize:` brut dans un fichier d'écran, arrête-toi — ça doit aller dans un de ces trois fichiers à la place, pour qu'un futur changement de palette soit une modification d'un seul fichier, pas une chasse dans quinze écrans.
- `serverpod start` te donne le hot reload automatiquement. Tu n'as pas besoin de redémarrer manuellement quoi que ce soit pour la plupart des changements — sauvegarde le fichier, regarde-le se mettre à jour.
- Le fait que chaque écran dans `lib/features/*/` soit actuellement vide n'est pas un bug — c'est le plan. Construis un écran, connecte-le au routeur, confirme qu'il est accessible, passe au suivant. Tu n'es jamais bloqué à attendre que « toute l'app » soit prête.

### Pour Sterelle (Base de données)

- 90% de ton travail est de la traduction, pas de l'invention : `db/schema.sql` a déjà la réponse pour chaque champ, type et contrainte. Ton travail est d'exprimer cette même table dans le format `.spy.yaml` de Serverpod, un fichier par table.
- Tu as un accès direct et en temps réel à la vraie base de données via le tableau de bord Supabase (Table Editor, Database → Advisors) — tu n'as plus à espérer qu'une migration a « probablement » fait ce que le yaml disait. Tu peux juste vérifier.
- La Row Level Security (RLS) est maintenant activée sur toutes les tables, mais **ça n'affecte pas Serverpod du tout** — Serverpod se connecte avec le rôle propriétaire des tables, que Postgres laisse toujours passer peu importe la RLS. La RLS bloque uniquement l'API REST publique de Supabase, que rien dans cette app n'est censé utiliser de toute façon. Tu n'auras pas besoin d'écrire de politiques RLS pour la Phase 1 — sache juste que c'est là et pourquoi.
- Ne modifie jamais à la main quoi que ce soit dans `kingdom_kids_server/lib/src/generated/` ou `kingdom_kids_server/migrations/` — ce sont des sorties, pas des entrées. Si un fichier généré a l'air faux, la correction est toujours dans le fichier `.spy.yaml` qui l'a produit.

---

## 3. Comment les trois rôles se connectent (le vrai pipeline)

C'est le seul schéma à retenir par cœur — chaque fonctionnalité de cette app passe par lui, dans cet ordre :

```
db/schema.sql (vérité terrain, maintenu par Sterelle)
        │
        ▼
kingdom_kids_server/lib/src/models/*.spy.yaml   ← Sterelle écrit/modifie ça
        │
        │  serverpod create-migration + dart run bin/main.dart --apply-migrations
        ▼
kingdom_kids_server/lib/src/generated/*.dart    ← personne ne modifie ça à la main
kingdom_kids_client/lib/src/protocol/*.dart     ← personne ne modifie ça à la main (package partagé)
        │
        ▼
kingdom_kids_server/lib/src/endpoints/*.dart    ← Daniel écrit ça
   (appelle lib/src/business/*.dart)            ← Daniel écrit ça
        │
        │  serverpod generate produit automatiquement une méthode client correspondante
        ▼
kingdom_kids_flutter/lib/features/*/screens/*.dart   ← Josué écrit ça
   (appelle client.<endpoint>.<methode>(...))
```

Implication pratique : si un écran a besoin d'une nouvelle donnée, la demande commence généralement par Sterelle (est-ce que le modèle a ce champ ?), puis Daniel (existe-t-il un endpoint qui le renvoie ?), puis Josué (connecter l'écran pour l'appeler). Travailler dans cet ordre évite le classique « j'ai construit tout l'écran et il n'y a pas encore de backend pour ça ».

---

## 4. Flux Git & GitHub

**Branches :** une branche de courte durée par tâche, nommée `<tonnom>/<tache-courte>` (par exemple `daniel/auth-endpoint`, `josue/profile-picker-ui`, `sterelle/badge-model-fix`). Pars de `main`, pas de la branche longue durée de quelqu'un d'autre.

> Note de nettoyage : `daniel`, `Josue` et `steste` existent actuellement comme des branches personnelles de longue durée depuis le Sprint 0. À partir de maintenant, traite `main` comme la seule branche de longue durée — ouvre des branches de tâche courtes à partir d'elle, fusionne via une PR, puis supprime la branche. Ça évite que vous dériviez silencieusement les uns par rapport aux autres pendant des semaines.

**Pull requests :**
- Chaque PR devrait référencer l'issue GitHub qu'elle résout (`Closes #7`) — GitHub ferme automatiquement l'issue quand la PR est fusionnée.
- `main` nécessite au moins une relecture et une CI qui passe avant la fusion (déjà configuré dans la protection de branche du repo).
- Garde les PR limitées à une seule issue. Une PR qui touche le modèle de base de données, l'endpoint, *et* l'écran en même temps est difficile à relire — préfère trois petites PR dans l'ordre du pipeline du §3 plutôt qu'une seule énorme.

**Mise en préparation des changements :** utilise `git add <fichiers précis>`, pas `git add .` ni `git add -A`. Il est facile de mettre en préparation par accident un fichier généré, une config locale, ou quelque chose contenant un mot de passe. Vérifie `git status` avant chaque commit.

**La CI, en clair** (`.github/workflows/ci.yml` et `format.yml`) :
- *« Serverpod codegen is stale »* — quelqu'un a modifié un modèle `.spy.yaml` mais n'a pas lancé `serverpod generate` (ou l'a lancé sans committer le résultat). Solution : régénérer et committer `lib/src/generated/` et `kingdom_kids_client/lib/src/protocol/` en même temps que le changement de modèle.
- *`dart test` du serveur qui échoue* — un vrai test backend est cassé ; lis le message d'échec, il nomme le test.
- *`flutter analyze` / `flutter test` qui échoue* — un échec statique ou de test côté Flutter.
- *`dart format --set-exit-if-changed`* — le formatage ne correspond pas ; lance `dart format .` en local et committe le résultat.

---

## 5. Où trouver les choses

| Question | Regarde ici |
|---|---|
| Qu'est-ce qu'on construit, dans quel ordre ? | `docs/06_sprint_plan.md` |
| Le modèle de données / contrat d'API complet ? | `docs/03_technical_spec.md` |
| Pourquoi Serverpod plutôt que Django ? | `docs/02_backend_decision.md` |
| À quoi cet écran doit-il vraiment ressembler ? | `kingdomkidsdesignmockupui/images/` (ignorer `screen8.png` — un placeholder qui ne correspond pas) |
| Qu'est-ce que je construis personnellement en ce moment ? | `docs/09_sprint2_plan.md` (le sprint précédent est dans `docs/08_sprint1_assignments.md`) |
