# Social Media Database (Portfolio Project)

A relational database and demo application modeling core social media functionality, built in PostgreSQL and Python as a portfolio project while learning SQL and database design (University of Michigan PostgreSQL specialization, Coursera, and IBM's Databases and SQL for Data Science with Python).

## Schema

Five tables covering the full range of relational database relationships:

- **users** — user accounts, including securely hashed passwords (bcrypt)
- **posts** — posts (One-to-Many relationship: one user to many posts), with an optional image URL
- **likes** — likes (Many-to-Many relationship: users to posts, with a composite unique constraint)
- **followers** — who follows whom (self-referencing Many-to-Many relationship: users to users)
- **comments** — comments (dual foreign key relationship: users and posts)

## Concepts demonstrated

- PRIMARY KEY, FOREIGN KEY, UNIQUE constraints, including composite UNIQUE across multiple columns
- ON DELETE strategies (CASCADE and SET NULL), deliberately chosen for each relationship
- Self-referencing Many-to-Many relationships
- INNER JOIN and LEFT JOIN, including multi-table joins with COUNT and GROUP BY
- Subqueries (WHERE ... IN (SELECT ...)) for personalized feed generation
- Password security with bcrypt hashing, never storing plaintext passwords
- Environment variables for database credentials, keeping secrets out of version control
- Safe error handling for duplicate registrations (try/except with rollback)

## Files

- `schema.sql` — table structure (CREATE TABLE statements)
- `seed_data.sql` — sample test data (INSERT/COPY statements)
- `queries.sql` — example queries demonstrating joins, aggregations, and the self-referencing follower relationship
- `auth.py` — password hashing, registration, and login logic
- `posts.py` — feed and comment retrieval logic
- `users.py` — user search and follow/unfollow logic
- `app.py` — Streamlit interface (login, registration, feed, search, follow, comments)
- `.env.example` — template for required environment variables

## App features

- Registration and login with securely hashed passwords (bcrypt)
- Personalized feed: the logged-in user's own posts plus posts from users they follow
- Expandable comment threads under each post
- Case-insensitive user search and follow/unfollow functionality
- Like and comment counts on every post

## Example query

Posts with author, like count, and comment count in a single result:

```sql
SELECT posts.content, users.username,
       COUNT(DISTINCT likes.id) AS like_count,
       COUNT(DISTINCT comments.id) AS comment_count
FROM posts
LEFT JOIN users ON posts.user_id = users.id
LEFT JOIN likes ON posts.id = likes.post_id
LEFT JOIN comments ON posts.id = comments.post_id
GROUP BY posts.content, users.username;
```

## How to run

1. Clone the repository:

```bash
git clone https://github.com/Oski-02/social-media-db.git
cd social-media-db
```

2. Create a local PostgreSQL database and load the schema and sample data:

```bash
createdb social_app
psql social_app < schema.sql
psql social_app < seed_data.sql
```

3. Create a Python virtual environment and install dependencies:

```bash
python3 -m venv venv
source venv/bin/activate
pip install psycopg2-binary bcrypt streamlit python-dotenv
```

4. Create a `.env` file in the project root (copy `.env.example` and fill in your own values):


DB_HOST=localhost
DB_USER=your_username
DB_PASSWORD=your_password
DB_NAME=social_app
5. Run the app:

```bash
streamlit run app.py
```

The app opens in your browser. You can register a new account or log in with existing seed data.

## Tech stack

PostgreSQL, SQL, Python, psycopg2, bcrypt, Streamlit, Git/GitHub

## What's next

- Cloud hosting (Supabase or Neon) and public deployment via Streamlit Community Cloud
- Image uploads for posts (currently supports an image URL field, not file upload)
- Basic UI styling
