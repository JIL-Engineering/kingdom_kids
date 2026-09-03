# Gabarit d'import de contenu Kingdom Kids

`book_import_template.csv` est le gabarit pour faire entrer un livre dans l'application. Une ligne = une page. Toutes les colonnes sont obligatoires sur chaque ligne, même les colonnes "livre" (elles sont répétées sur chaque page du même livre).

Les deux livres dans ce fichier sont des exemples de test (texte entre crochets `[PLACEHOLDER]`) — à remplacer par du vrai contenu CMFI une fois qu'il est prêt, pas à garder tel quel.

## Colonnes

**Niveau livre (répétées sur chaque page du même livre) :**

| Colonne | Description |
|---|---|
| `slug` | Identifiant unique du livre, sans espace ni majuscule (ex. `david-et-goliath`). Ne change jamais une fois publié. |
| `title_en` / `title_fr` | Titre du livre dans chaque langue. |
| `category` | Une des valeurs suivantes exactement : `bible_story`, `character_building`, `prayer`, `devotional`, `sunday_school`. |
| `age_bracket_min` / `age_bracket_max` | Tranche d'âge ciblée. Une des valeurs suivantes exactement, dans cet ordre croissant : `toddler`, `preschool`, `early_elementary`, `preteen`. Si le livre convient à toutes les tranches de 3 à 8 ans par exemple : `age_bracket_min = toddler`, `age_bracket_max = early_elementary`. |

**Niveau page :**

| Colonne | Description |
|---|---|
| `page_number` | Numéro de la page, à partir de 1, dans l'ordre de lecture. |
| `text_en` / `text_fr` | Texte de la page dans chaque langue. |
| `illustration_filename` | Nom du fichier image pour cette page (ex. `david-et-goliath-page1.png`). Le fichier lui-même est uploadé séparément vers R2 — cette colonne dit juste au script d'import quel nom chercher. |
| `audio_filename_en` / `audio_filename_fr` | Nom du fichier audio de narration pour cette page, dans chaque langue. Même principe que l'illustration. |

## Comment ça devient du contenu réel dans l'app

1. Remplir ce gabarit (ou son équivalent en Google Sheet) avec le vrai contenu, une fois qu'il est prêt et validé par la relecture théologique.
2. Uploader les fichiers illustration/audio vers le bucket R2 (coordination avec Daniel — issue #34).
3. Lancer le script d'import : `dart run bin/import_books.dart chemin/vers/le/fichier.csv` depuis `kingdom_kids_server/`.
4. Vérifier dans le Table Editor Supabase que les lignes `books`, `book_translations`, `pages`, `page_contents` sont bien là.

Toujours tester avec du contenu factice (comme les deux exemples de ce fichier) avant de brancher du vrai contenu CMFI.
