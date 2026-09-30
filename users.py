from auth import cursor, conn

def search_users(query, current_user_id):
    q = """
        SELECT id, username FROM users
        WHERE username ILIKE %s AND id != %s
        ORDER BY username
        LIMIT 20
    """
    cursor.execute(q, (f"%{query}%", current_user_id))
    return cursor.fetchall()

def is_following(follower_id, followed_id):
    q = "SELECT 1 FROM followers WHERE follower_id = %s AND followed_id = %s"
    cursor.execute(q, (follower_id, followed_id))
    return cursor.fetchone() is not None

def follow_user(follower_id, followed_id):
    q = "INSERT INTO followers (follower_id, followed_id) VALUES (%s, %s)"
    try:
        cursor.execute(q, (follower_id, followed_id))
        conn.commit()
        return True
    except Exception:
        conn.rollback()
        return False
