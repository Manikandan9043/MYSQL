use ig_clone;


SELECT AVG(photo_count) AS avg_posts_per_user
FROM (
    SELECT u.id, COUNT(p.id) AS photo_count 
    FROM users u
    LEFT JOIN photos p ON u.id = p.user_id
    GROUP BY u.id
) AS user_photo_counts;



SELECT (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS avg_photos_per_user;



SELECT u.username 
FROM users u
WHERE NOT EXISTS (
    SELECT 1 
    FROM photos p
    LEFT JOIN likes l ON p.id = l.photo_id AND l.user_id != u.id
    WHERE l.photo_id IS NULL
);



