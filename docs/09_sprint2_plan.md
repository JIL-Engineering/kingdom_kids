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

**Dette technique R2 :** pendant ce sprint, `LibraryEndpoint` renvoie des URLs publiques R2 pour les couvertures, illustrations et fichiers audio. Elles ne sont ni signées ni expirantes. Le package `serverpod_cloud_storage_r2`, via `s3_compat`, ne fournit pas nativement de presigned download URL ; une implémentation SigV4 devra donc être écrite manuellement dans un sprint ultérieur, puis le stockage pourra être repassé en privé.

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
