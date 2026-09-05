-- ============================================
-- Zapytanie 1: Posty z autorem i liczbą polubień
-- Pokazuje: LEFT JOIN (zachowuje posty bez polubień), COUNT, GROUP BY
-- ============================================
SELECT posts.content, users.username, COUNT(likes.id) AS liczba_polubien
FROM posts
LEFT JOIN users ON posts.user_id = users.id
LEFT JOIN likes ON posts.id = likes.post_id
GROUP BY posts.content, users.username;


-- ============================================
-- Zapytanie 2: Posty z autorem, liczbą polubień I liczbą komentarzy
-- Pokazuje: potrójny JOIN, dwa niezależne COUNT w jednym zapytaniu
-- ============================================
SELECT posts.content, users.username,
       COUNT(DISTINCT likes.id) AS liczba_polubien,
       COUNT(DISTINCT comments.id) AS liczba_komentarzy
FROM posts
LEFT JOIN users ON posts.user_id = users.id
LEFT JOIN likes ON posts.id = likes.post_id
LEFT JOIN comments ON posts.id = comments.post_id
GROUP BY posts.content, users.username;


-- ============================================
-- Zapytanie 3: Ranking najpopularniejszych postów (wg polubień)
-- Pokazuje: GROUP BY + ORDER BY DESC
-- ============================================
SELECT post_id, COUNT(*) AS liczba_polubien
FROM likes
GROUP BY post_id
ORDER BY liczba_polubien DESC;


-- ============================================
-- Zapytanie 4: Kto ma najwięcej obserwujących
-- Pokazuje: self-referencing many-to-many + agregacja
-- ============================================
SELECT followed_id, COUNT(*) AS liczba_obserwujacych
FROM followers
GROUP BY followed_id
ORDER BY liczba_obserwujacych DESC;


-- ============================================
-- Zapytanie 5: Feed użytkownika (posty osób, które obserwuje)
-- Pokazuje: połączenie self-referencing many-to-many z one-to-many
-- Przykład dla usera o id = 1
-- ============================================
SELECT users.username AS autor, posts.content
FROM followers
JOIN posts ON followers.followed_id = posts.user_id
JOIN users ON posts.user_id = users.id
WHERE followers.follower_id = 1;

