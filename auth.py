import os
from dotenv import load_dotenv
import psycopg2
import bcrypt

load_dotenv()

conn = psycopg2.connect(
    host=os.getenv("DB_HOST"),
    user=os.getenv("DB_USER"),
    password=os.getenv("DB_PASSWORD"),
    dbname=os.getenv("DB_NAME")
)
cursor = conn.cursor()

def hash_password(password):
    password_bytes = password.encode('utf-8')
    hashed = bcrypt.hashpw(password_bytes, bcrypt.gensalt())
    return hashed.decode('utf-8')

def check_password(password, hashed_password):
    password_bytes = password.encode('utf-8')
    hashed_bytes = hashed_password.encode('utf-8')
    return bcrypt.checkpw(password_bytes, hashed_bytes)

def register_user(username, email, password):
    hashed = hash_password(password)
    query = "INSERT INTO users (username, email, password_hash) VALUES (%s, %s, %s)"
    try:
        cursor.execute(query, (username, email, hashed))
        conn.commit()
        return True
    except psycopg2.errors.UniqueViolation:
        conn.rollback()
        return False

def login_user(username, password):
    query = "SELECT id, password_hash FROM users WHERE username = %s"
    cursor.execute(query, (username,))
    result = cursor.fetchone()
    if result is None:
        return None
    user_id, stored_hash = result
    if check_password(password, stored_hash):
        return user_id
    return None
