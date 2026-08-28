# Sprint 2 — Pipeline de contenu : plan et répartition

*Sprint 1 est fermé : un parent peut créer un compte, donner son consentement, et ajouter un profil enfant, de bout en bout (voir PR #32 et #33). Ce document couvre le Sprint 2, qui est différent des sprints précédents — il ne s'agit presque pas de nouvelles fonctionnalités de code, mais de construire le tuyau qui fait entrer du vrai contenu CMFI dans la base de données.*

---

## ⚠️ Ce sprint dépend de quelque chose que l'équipe ne contrôle pas

`docs/05_content_pipeline_plan.md` le dit explicitement depuis le début : le vrai livrable du Sprint 2 (« du vrai contenu Kingdom Kids existe dans la base ») a une dépendance externe que l'équipe d'ingénierie ne peut pas résoudre seule :

- Qui, chez CMFI, a les livres originaux et peut dire lesquels des 15-25 sont les plus solides pour un lancement ?
- Sous quel format existent-ils (papier, Word, vieux PDF) ?
- Y a-t-il une capacité de narration en français, ou est-ce un vrai manque à combler ?
- Y a-t-il un style d'illustration existant à préserver ?

**Ces questions sont pour Emmanuel / la direction de CMFI, pas pour Sterelle, Daniel, ou Josué.** Le travail d'ingénierie ci-dessous peut avancer entièrement avec du contenu d'exemple/placeholder pendant que ces réponses arrivent — mais le sprint n'est réellement « fermé » que lorsque 3 à 5 vrais livres CMFI sont chargés. Ne bloquez pas le travail technique en attendant ces réponses ; construisez le tuyau maintenant, remplissez-le de vrai contenu dès qu'il arrive.

---

## Corrections requises avant de continuer (revue d'architecture + revue de la PR #39)

Une revue de la PR #39 (Daniel, R2 + `LibraryEndpoint`) et une relecture complète des docs de spec (`02`, `03`, `04`) ont fait remonter des problèmes concrets — certains déjà corrigés directement dans les docs, d'autres à corriger dans le code de chacun avant de continuer. `03_technical_spec.md` §3 et §4, `04_technical_primer.md` §8, et `02_backend_decision.md` viennent d'être mis à jour : lis les sections modifiées avant de commencer les tâches ci-dessous, certaines annulent une hypothèse que tu avais peut-être déjà en tête.

Le changement le plus important : `AgeBracket`, `AppLanguage`, et `BookCategory` sont maintenant des enums Serverpod définies dans la spec, pas du texte libre. La spec disait `ChildProfile.age_bracket` comme une étiquette (« 3-5 »/« 6-8 »/« 9-12 ») mais ne précisait jamais le format de `Book.age_bracket_min/max` — et dans la PR #39, `browseBooks` fait un `int.tryParse` dessus, ce qui échoue silencieusement pour un livre sur toutes les lignes réelles si le format est une étiquette plutôt qu'un entier. Ce n'est pas la faute de qui que ce soit en particulier — la spec ne tranchait juste pas. C'est tranché maintenant : une seule enum, partagée par les deux modèles.

### Sterelle

- Avant de finaliser le gabarit Google Sheet (issue #6) : relis `03_technical_spec.md` §3 (« Typed domain values ») et fais en sorte que les colonnes `age_bracket_min`/`age_bracket_max`/`category` du gabarit utilisent les valeurs d'enum exactes (`threeToFive`/`sixToEight`/`nineToTwelve`, `bibleStory`/`characterBuilding`/`prayer`/`devotional`/`sundaySchool`), pas du texte libre inventé au fil de l'eau. C'est le genre de détail qui coûte cher à corriger une fois que le script d'import et 15-25 lignes de contenu existent déjà.
- **Bloquant, à faire cette semaine :** applique la migration de réparation de l'issue #24 (`badges.trigger_rule`, `devotionals.date`). Ce n'est plus juste un reliquat du Sprint 1 — tant qu'elle n'est pas appliquée, un `serverpod create-migration` lancé par erreur par n'importe qui peut générer un `ALTER` destructeur sur ces deux colonnes. Coordonne avec Emmanuel pour lancer `serverpod start` ensemble — c'est une action sur la vraie base de données, jamais en solo.
- Pendant l'audit de la Tâche 2 de `08_sprint1_assignments.md` (comparer chaque `.spy.yaml` à `db/schema.sql`), vérifie aussi qu'aucun autre champ n'est modélisé en `String` alors qu'il représente en réalité un ensemble fixe de valeurs. C'est maintenant la deuxième fois que ce pattern précis cause un bug réel dans ce projet (badges/devotionals, puis age_bracket/category/language) — ça vaut la peine d'être vigilant partout, pas juste sur ce qui a déjà été trouvé.

### Daniel

- Corrige d'abord les points de la review déjà postée sur la PR #39 (bloquants : double `pod.start()`, titre du livre jamais renvoyé ; à corriger : endpoint de test sans auth, extension `.spy.yaml`) avant de redemander une relecture.
- En plus de ça, deux changements liés à la mise à jour de la spec :
  - Remplace le `int.tryParse(book.ageBracketMin)` de `browseBooks` par une comparaison sur l'enum `AgeBracket` maintenant définie dans `03_technical_spec.md` §3 — ça règle en même temps le filtre d'âge qui ne s'appliquait en pratique à aucun livre.
  - `browseBooks`/`getBook`/`getRecommended` doivent renvoyer des URLs signées R2 (courte durée) pour chaque champ asset (`coverImageAsset`, `illustrationAsset`, `audioAsset`), pas les noms de fichiers bruts actuels — voir la note ajoutée dans `03_technical_spec.md` §4. Ça veut dire retirer `public: true` de `R2CloudStorage` dans `server.dart` : le bucket doit rester privé. (Vérification faite côté Cloudflare : l'accès public r2.dev est de toute façon désactivé sur le bucket réel en ce moment, donc `public: true` ne fonctionnait déjà pas — juste pas pour la bonne raison. Le corriger proprement avec des URLs signées règle les deux problèmes en même temps.)

### Josué

- Rien de nouveau à corriger sorti de cette revue. Rappel simple : la question de design du PIN (Tâche 2, déjà notée dans `08_sprint1_assignments.md` et `09_sprint2_plan.md`) reste à trancher avec Emmanuel avant de coder cet écran — ça n'a pas changé.

---

## Sterelle — Base de données & traitement des données

### Tâche : gabarit Google Sheet + script d'import (issue [#6](../../issues/6))

C'est le cœur technique du sprint. Référence complète : `docs/05_content_pipeline_plan.md` et `docs/03_technical_spec.md` (modèles `Book`/`BookTranslation`/`Page`/`PageContent`).

**Étape 1 :** dessiner le gabarit Google Sheet — une feuille par livre, une ligne par page, avec au minimum : `page_number`, `text_en`, `text_fr`, `illustration_filename`, `audio_filename_en`, `audio_filename_fr`, plus des colonnes de métadonnées au niveau du livre (`slug`, `title_en`, `title_fr`, `category`, `age_bracket_min/max`). Fais-le concret avec 1-2 livres d'exemple remplis, pas juste des en-têtes vides — ça sert aussi de spec pour l'équipe contenu de CMFI.

**Étape 2 :** le script d'import (Dart ou Python, ton choix — ce n'est pas du code Serverpod, pas besoin de suivre les conventions endpoint/business) lit le Sheet (API Google Sheets, ou un export CSV pour commencer plus simple) et écrit :
- une ligne `Book` + une `BookTranslation` par langue
- des lignes `Page` (une par page, `illustration_asset` pointant vers le futur fichier R2)
- des lignes `PageContent` (une par page ET par langue)

**Étape 3 :** upload des fichiers illustration/audio vers R2 — coordonne avec Daniel une fois que son issue [#34](../../issues/34) (provisionnement R2) est prête, votre travail est directement dépendant l'un de l'autre.

**Étape 4 :** teste avec 1-2 livres factices d'abord (contenu bidon, pas besoin d'attendre le vrai contenu CMFI) pour valider que le pipeline entier fonctionne, avant de brancher les vrais livres une fois qu'ils arrivent.

---

## Daniel — Backend

### Tâche 1 : Cloudflare R2 + stockage fichiers Serverpod (issue [#34](../../issues/34))

Rien n'existe encore ici — c'est un vrai prérequis pour le reste du sprint. Voir `docs/04_technical_primer.md` section 4 (pourquoi R2) et section 11 (checklist de setup original du Sprint 0, jamais fait). Étapes : créer le bucket R2 sur le compte Cloudflare, configurer l'intégration de stockage fichiers de Serverpod (identifiants dans `config/passwords.yaml`, jamais commité), confirmer qu'un upload de test depuis le serveur fonctionne avant de dire que c'est prêt.

### Tâche 2 : `LibraryEndpoint` minimal (issue [#35](../../issues/35))

Une fois que Sterelle produit des lignes Book/Page/PageContent, il faut un moyen de vérifier que c'est arrivé correctement sans exécuter du SQL à la main à chaque fois. Contrat complet dans `docs/03_technical_spec.md` §4, mais pour ce sprint implémente juste :

```
LibraryEndpoint
  browseBooks({ageBracket, language, category}) -> List<BookSummary>
  getBook(bookId, language) -> BookDetail (toutes les pages + contenu pour cette langue)
```

Pas besoin de `getRecommended`/`getDownloadBundle`/`checkForUpdates` maintenant — ça vient avec le Sprint 4 (Library & Offline). L'objectif ici est de vérifier le pipeline, pas de livrer la fonctionnalité bibliothèque complète.

---

## Josué — Frontend

Ce sprint n'a presque pas de travail frontend lié au contenu lui-même (il n'y a rien à afficher tant que le pipeline ne produit rien) — plutôt que de rester bloqué, deux tâches qui avancent le prochain sprint et referment un manque du précédent.

### Tâche 1 : verrou PIN parental (issue [#5](../../issues/5), reporté du Sprint 1)

**D'abord, tranche la question de design avec Emmanuel avant de coder** (5 minutes de conversation, pas plus) : le schéma actuel modélise `pinProtected` comme un booléen **par profil enfant** (`child_profiles.pin_protected`), mais la maquette Settings (`screen9.png`, « Manage Parental PIN ») montre plutôt **un seul PIN qui verrouille tout le Mode Parent**. Une fois la réponse connue :
- Si c'est un PIN par parent : il faut un nouveau champ sur `AppUser` (coordonne avec Sterelle/Daniel pour le modèle + migration) — le PIN doit être haché côté serveur, jamais stocké ou comparé en clair côté client.
- Si c'est vraiment par enfant : le champ existe déjà, c'est uniquement du travail frontend.

### Tâche 2 : ébauche de l'écran Reader (issue [#36](../../issues/36), prépare le Sprint 3)

Même pattern que les autres écrans stubs du Sprint 1 : un `Scaffold` basique branché au routeur, matchant `screen14.png`, avec des données `Book`/`Page` factices codées en dur (pas d'appel réseau). N'implémente pas le page-turn/narration/changement de langue maintenant — l'objectif est juste que le Sprint 3 démarre avec la structure en place plutôt qu'un fichier vide, exactement comme `07_team_playbook.md` §2 le recommande pour Josué.

---

## Suivi du Sprint 1 non terminé

- Issue [#24](../../issues/24) : `db/schema.sql` est corrigé (`trigger_rule` en TEXT, `devotionals.date` en TIMESTAMPTZ), mais la migration de réparation correspondante n'a pas encore été appliquée à la vraie base — ça nécessite `serverpod start`, pas fait au moment où ce document est écrit. Premier arrivé sur une session avec le serveur lancé, occupe-toi-en avant de commencer une nouvelle tâche.

## Attribution des issues GitHub

| Issue | Titre | Assignée à |
|---|---|---|
| [#5](../../issues/5) | PIN-protected parent settings gate | Josué (`aangejosue-boop`) |
| [#6](../../issues/6) | Google Sheet template + import script | Sterelle (`Sterelle`) |
| [#7](../../issues/7) | Digitize and upload 3–5 real books (EN/FR) | Emmanuel (`cgeelectropro`) — dépendance CMFI, pas une tâche d'ingénierie pure |
| [#24](../../issues/24) | Fix badge/devotional model-schema type drift + repair migration | Sterelle (`Sterelle`) — reste juste la migration de réparation |
| [#34](../../issues/34) | Provisionner Cloudflare R2 + brancher le stockage fichiers | Daniel (`bec971`) |
| [#35](../../issues/35) | LibraryEndpoint minimal (browseBooks/getBook) | Daniel (`bec971`) |
| [#36](../../issues/36) | Ébauche de l'écran Reader (prep Sprint 3) | Josué (`aangejosue-boop`) |
