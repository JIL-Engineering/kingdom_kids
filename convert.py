import csv, json, re, os

def normalize_slug(name):
    s = re.sub(r'([a-z])([A-Z])', r'\1-\2', name)
    return s.lower().replace("_", "-").replace(" ", "-").replace("--","-")

FILES = ["archeNoe.csv", "bon-samaritain.csv"]

books = []
for file in FILES:
    base = os.path.splitext(os.path.basename(file))[0]
    slug = normalize_slug(base.replace("Kingdom Kids - ",""))
    print(f"-> {file} => {slug}")

    with open(file, encoding='utf-8') as f:
        reader = csv.DictReader(f)
        pages = list(reader)
        if not pages: continue

        first = pages[0]
        book = {
            "slug": slug,
            "category": first.get("category","bible"),
            "age_bracket_min": int(first.get("age_bracket_min",3)),
            "age_bracket_max": int(first.get("age_bracket_max",7)),
            "translations": [
                {"lang": "en", "title": first.get("title_en", slug)},
                {"lang": "fr", "title": first.get("title_fr", slug)}
            ],
            "pages": []
        }
        for row in pages:
            pid = row.get("page_number","1")
            book["pages"].append({
                "page_number": int(pid) if pid.isdigit() else 1,
                "illustration_asset": f"/books/{slug}/images/{row.get('illustration_filename') or f'{slug}_{pid}.png'}",
                "contents": [
                    {"lang": "en", "text": row.get("text_en",""), "audio_asset": f"/books/{slug}/audio/{row.get('audio_filename_en') or f'{slug}_{pid}_en.mp3'}"},
                    {"lang": "fr", "text": row.get("text_fr",""), "audio_asset": f"/books/{slug}/audio/{row.get('audio_filename_fr') or f'{slug}_{pid}_fr.mp3'}"}
                ],
                "prompt": row.get("illustration_prompt_en","")
            })
        books.append(book)

with open("books.json", "w", encoding='utf-8') as out:
    json.dump(books, out, ensure_ascii=False, indent=2)

print(f"\nSUCCES! books.json créé avec {len(books)} livres")