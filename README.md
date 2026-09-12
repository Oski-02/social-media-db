# Social Media Database (Portfolio Project)

A relational database and demo application modeling core social media functionality, built in PostgreSQL and Python as a portfolio project while learning SQL and database design (University of Michigan PostgreSQL specialization, Coursera, and IBM's Databases and SQL for Data Science with Python).

## Schema

Five tables covering the full range of relational database relationships:

* users, user accounts, including securely hashed passwords
* posts, one to many relationship (one user to many posts)
* likes, many to many relationship (users to posts) with a composite unique constraint
* followers, self referencing many to many relationship (users to users)
* comments, dual foreign key relationship (users and posts)

## Concepts demonstrated

* PRIMARY KEY, FOREIGN KEY, UNIQUE constraints, including composite UNIQUE across multiple columns
* ON DELETE strategies (CASCADE and SET NULL) chosen deliberately for each relationship
* Self referencing many to many relationships
* INNER JOIN and LEFT JOIN, including multi table joins with COUNT and GROUP BY
* Password security with bcrypt hashing, never storing plaintext passwords
* Environment variables for database credentials, keeping secrets out of version control

## Files

* schema.sql, table structure (CREATE TABLE statements)
* seed_data.sql, sample test data (INSERT statements)
* queries.sql, example queries demonstrating joins, aggregations, and the self referencing follower relationship
* auth.py, password hashing and user registration/login logic
* app.py, Streamlit interface (login, registration, and session handling)
* .env.example, template for required environment variables

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

git clone https://github.com/Oski-02/social-media-db.git
cd social-media-db

2. Create a local PostgreSQL database and load the schema and sample data:

createdb social_app
psql social_app < schema.sql
psql social_app < seed_data.sql

3. Create a Python virtual environment and install dependencies:

python3 -m venv venv
source venv/bin/activate
pip install psycopg2-binary bcrypt streamlit python-dotenv

4. Create a .env file in the project root (copy .env.example and fill in your own values):

DB_HOST=localhost
DB_USER=your_username
DB_PASSWORD=your_password
DB_NAME=social_app

5. Run the app:

streamlit run app.py

The app opens in your browser. You can register a new account or log in with existing seed data.

## Tech stack

PostgreSQL, SQL, Python, psycopg2, bcrypt, Streamlit, Git/GitHub

## What's next

* Post feed and engagement metrics displayed in the app
* User profiles (posts, followers, following)
* Image uploads for posts
* Cloud hosting (Supabase or Neon) and public deployment via Streamlit Community Cloud
