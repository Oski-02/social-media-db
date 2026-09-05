# Social Media Database (Portfolio Project)

Uproszczona baza danych social media zbudowana w PostgreSQL, jako projekt portfolio
w ramach nauki SQL/PostgreSQL (kurs pg4e — University of Michigan, Coursera).

## Schemat

5 tabel pokazujących pełen zakres relacji w bazach danych:

- **users** — konta użytkowników
- **posts** — posty (relacja One-to-Many: jeden user → wiele postów)
- **likes** — polubienia (relacja Many-to-Many: users ↔ posts, z composite UNIQUE)
- **followers** — kto kogo obserwuje (relacja Many-to-Many self-referencing: users ↔ users)
- **comments** — komentarze (podwójny klucz obcy: users + posts)

## Zastosowane koncepcje

- PRIMARY KEY, FOREIGN KEY, UNIQUE (w tym composite UNIQUE na wielu kolumnach)
- Strategie ON DELETE: CASCADE i SET NULL, dobrane świadomie do kontekstu każdej relacji
- Self-referencing Many-to-Many (followers)
- JOIN: INNER JOIN i LEFT JOIN, w tym potrójne złączenia
- Agregacje: COUNT, GROUP BY, ORDER BY

## Pliki

- `schema.sql` — struktura wszystkich tabel (CREATE TABLE)
- `seed_data.sql` — przykładowe dane testowe (INSERT)
- `queries.sql` — zapytania pokazujące umiejętności (feed, ranking popularności, liczniki polubień/komentarzy)

## Przykładowe zapytanie

Posty z autorem, liczbą polubień i liczbą komentarzy w jednym wyniku:

```sql
SELECT posts.content, users.username,
       COUNT(DISTINCT likes.id) AS liczba_polubien,
       COUNT(DISTINCT comments.id) AS liczba_komentarzy
FROM posts
LEFT JOIN users ON posts.user_id = users.id
LEFT JOIN likes ON posts.id = likes.post_id
LEFT JOIN comments ON posts.id = comments.post_id
GROUP BY posts.content, users.username;
```

## Co dalej

- Migracja bazy do chmury (Supabase/Neon)
- Prosty interfejs w Streamlit
