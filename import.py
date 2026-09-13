import json
import psycopg
from datetime import datetime, timezone
from pathlib import Path

conn = psycopg.connect(
  host="localhost",
  port=8090,
  dbname="kingdom_kids",
  user="postgres",
  password="ReallyBetter2222."
)
cur = conn.cursor()

path = Path("kingdom_kids_server/assets/books.json")
books = json.loads(path.read_text(encoding="utf-8"))
print(f"Import de {len(books)} livres...")

for b in books:
  slug = b["slug"]
  cur.execute("SELECT id FROM books WHERE slug=%s",(slug,))
  if cur.fetchone():
    print(f" - {slug} déjà présent")
    continue
  now = datetime.now(timezone.utc)
  cur.execute("""
    INSERT INTO books (slug,"ageBracketMin","ageBracketMax",category,"coverImageAsset","isPublished","contentVersion","createdAt","updatedAt")
    VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s) RETURNING id
  """, (slug, str(b["age_bracket_min"]), str(b["age_bracket_max"]), b["category"], b["pages"][0]["illustration_asset"], False, 1, now, now))
  book_id = cur.fetchone()[0]
  for tr in b["translations"]:
    cur.execute('INSERT INTO book_translations ("bookId", language, title) VALUES (%s,%s,%s)', (book_id, tr["lang"], tr["title"]))
  for p in b["pages"]:
    cur.execute('INSERT INTO pages ("bookId","pageNumber","illustrationAsset","layoutType") VALUES (%s,%s,%s,%s) RETURNING id',
                (book_id, p["page_number"], p["illustration_asset"], "full"))
    pid = cur.fetchone()[0]
    for c in p["contents"]:
      cur.execute('INSERT INTO page_contents ("pageId", language, text, "audioAsset") VALUES (%s,%s,%s,%s)',
                  (pid, c["lang"], c["text"], c["audio_asset"]))
  print(f" -> {slug} OK")

conn.commit()
cur.close()
conn.close()
print("✅ ETAPE 2 TERMINEE")
