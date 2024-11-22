use ig_clone;


SELECT username, created_at AS Dates 
FROM users 
ORDER BY created_at ASC 
LIMIT 5;


SELECT u.username, u.created_at 
FROM users u
LEFT JOIN photos p ON u.id = p.user_id
WHERE p.id IS NULL;


SELECT u.username, p.id AS photo_id, COUNT(l.user_id) AS total_likes
FROM photos p
JOIN users u ON p.user_id = u.id
JOIN likes l ON l.photo_id = p.id
GROUP BY p.id, u.username
ORDER BY total_likes DESC 
LIMIT 1;


SELECT t.tag_name, COUNT(pt.photo_id) AS usage_count
FROM tags t
JOIN photo_tags pt ON t.id = pt.tag_id
GROUP BY t.id
ORDER BY usage_count DESC 
LIMIT 5;


SELECT DAYNAME(created_at) AS day_of_week, COUNT(id) AS user_count
FROM users
GROUP BY day_of_week
ORDER BY user_count DESC 
LIMIT 1;

