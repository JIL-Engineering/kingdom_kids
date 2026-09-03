# Sprint 3 — Le Reader : plan et répartition

*Sprint 2 n'est pas fermé au moment où ce document est écrit — voir la section "Ce qui reste ouvert du Sprint 2" avant de traiter ce sprint comme démarré. Ce document prépare la répartition pour quand ce sera le cas, il ne dit pas de commencer avant.*

---

## ⚠️ Ce qui reste ouvert du Sprint 2

- **Issue #24** (migration de réparation badges/devotionals) — rouverte, faussement fermée. Nécessite Emmanuel présent avec `serverpod start` lancé sur la vraie base. Bloquant pour toute nouvelle migration future tant que ce n'est pas fait.
- **Issue #25** (audit des modèles face à la base réelle) — rouverte, faussement fermée, aucun audit n'a en fait été effectué.
- **PR #39** (LibraryEndpoint, Daniel) — CI verte, mais encore en attente de relecture formelle.
- **PR #42** (gabarit + script d'import, Sterelle) — écrit et testé partiellement, le chemin d'écriture en base n'est pas encore validé de bout en bout (problème réseau local à re-tester). À revoir par Sterelle à son retour.
- **Issue #36** (ébauche Reader) — pas commencée, la PR #41 de Josué est vide.
- **Toi** : activer l'accès public r2.dev sur le bucket `kingdom-kids-assets` (voir PR #43).

Le Sprint 3 dépend directement du Reader ayant de vraies pages/images/audio à afficher — donc de #39, #42 et de l'accès R2 étant réellement fonctionnels, pas juste mergés.

---

## Josué — Frontend (tâche principale)

### Le vrai écran Reader (issue à créer, succède à #36)

Construit sur l'ébauche du Sprint 2 plutôt que de repartir de zéro — si #36 n'a pas avancé, ce sprint inclut de fait le travail de l'ébauche.

**Étape 1 :** page-turn (transition entre pages, swipe ou tap flèche selon `screen14.png`), rendu de l'illustration via l'URL renvoyée par `client.library.getBook(bookId, language)` — actuellement une URL publique R2 temporaire (voir `03_technical_spec.md` §4), pas encore signée. Le code ne doit pas dépendre du fait que l'URL soit publique ou signée — juste l'utiliser telle quelle (`Image.network(page.illustrationAsset)`), pour ne rien casser quand ça changera.

**Étape 2 :** lecture audio — tap-to-narrate (le parent/enfant tape pour lancer la narration de la page) et auto-narrate (lecture automatique à l'arrivée sur la page, activable/désactivable). Utilise `page.audioAsset` de la même façon, même remarque sur l'URL.

**Étape 3 :** changement de langue en cours de lecture — rappelle un nouvel appel à `getBook(bookId, autreLangue)` plutôt que de stocker les deux langues en mémoire en même temps.

**Étape 4 :** mode "Read Together" (`03_technical_spec.md` §5) — flux de narration initié par le parent pour une lecture partagée/du soir, distinct de l'usage solo enfant. Détail UI à confirmer sur la maquette avant de coder si ambigu — même principe que le PIN gate : 5 minutes de conversation plutôt qu'une supposition.

**Ne pas faire ce sprint** (Sprint 4+) : téléchargement hors-ligne, vérification de version de contenu, écran bibliothèque/étagère complet (`browseBooks`) — le Reader de ce sprint s'ouvre directement sur un livre donné, pas depuis une liste construite.

---

## Daniel — Backend (support, pas de nouvelle tâche majeure)

`LibraryEndpoint.getBook` couvre déjà tout ce dont le Reader a besoin (pages, texte, URLs audio/illustration) — pas de nouvel endpoint prévu pour ce sprint sauf si Josué découvre un vrai manque en construisant l'écran.

- Reste disponible pour combler un manque d'endpoint si le Sprint 3 en révèle un.
- Poursuit le nettoyage Sprint 2 en tâche de fond : la note d'efficacité sur `browseBooks` (requêtes séquentielles, filtrage en mémoire) reste non bloquante mais vaut le coup si le temps le permet.
- Coordonne avec Sterelle une fois qu'elle revient sur PR #42 pour que l'upload réel des fichiers vers R2 (étape 3 de sa tâche #6) passe par son storage sans qu'elle ait à deviner.

---

## Sterelle — Base de données & contenu

Priorité 1, avant tout travail Sprint 3 : fermer les items rouverts du Sprint 2 (#25 en particulier, l'audit lui revient directement).

Une fois ça fait :
- Reprendre PR #42 : valider le script d'import de bout en bout sur sa propre machine (le blocage rencontré semble spécifique à un environnement Windows/Docker Desktop, à confirmer que ça marche ailleurs).
- Commencer à charger du vrai contenu CMFI dès qu'il est disponible (dépend toujours d'Emmanuel/CMFI, voir `05_content_pipeline_plan.md`) — le Reader de Josué a besoin d'au moins un livre réel ou factice complet pour être testé pour de vrai, pas juste compilé.

---

## Emmanuel

- Activer l'accès public r2.dev sur le bucket (PR #43).
- Appliquer la migration de réparation #24 avec `serverpod start` lancé.
- Décider si PR #39 et #42 sont mergées avant ou après le démarrage effectif du Sprint 3 — le Reader ne peut pas être testé avec de vraies données tant que les deux ne sont pas en `main`.
