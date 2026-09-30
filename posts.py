from auth import cursor

def get_feed(user_id):
    query = """
        SELECT posts.id, posts.content, posts.image_url, users.username,
               COUNT(DISTINCT likes.id) AS like_count,
               COUNT(DISTINCT comments.id) AS comment_count
        FROM posts
        LEFT JOIN users ON posts.user_id = users.id
        LEFT JOIN likes ON posts.id = likes.post_id
        LEFT JOIN comments ON posts.id = comments.post_id
        WHERE posts.user_id = %s
           OR posts.user_id IN (
               SELECT followed_id FROM followers WHERE follower_id = %s
           )
        GROUP BY posts.id, posts.content, posts.image_url, users.username
        ORDER BY posts.id DESC
    """
    cursor.execute(query, (user_id, user_id))
    return cursor.fetchall()

def get_comments(post_id):
    query = """
        SELECT users.username, comments.content
        FROM comments
        LEFT JOIN users ON comments.user_id = users.id
        WHERE comments.post_id = %s
        ORDER BY comments.id
    """
    cursor.execute(query, (post_id,))
    return cursor.fetchall()
