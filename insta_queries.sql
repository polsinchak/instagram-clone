-- 1. FINDING WHO THE 5 OLDEST USERS ARE

SELECT *
FROM users
ORDER BY created_at DESC 
LIMIT 5; 


-- 2. FINDING WHAT DAY OF THE WEEK MOST USERS REGISTER ON

SELECT 
	DAYNAME(created_at) AS day,
	COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC LIMIT 1;


-- 3. FINDING WHO HAS NEVER POSTED A PHOTO

SELECT
	username
FROM users
LEFT JOIN photos
	ON users.id = photos.user_id
WHERE photos.id IS NULL;


-- 4. FINDING WHO HAS THE MOST LIKES ON A PHOTO

SELECT 
    username, 
    image_url,
    COUNT(*) AS total
FROM photos
JOIN likes
    ON likes.photo_id = photos.id
JOIN users
    ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1;


-- 5. FINDING AVERAGE AMOUNT OF POSTS PER USER

SELECT ((SELECT COUNT(*) FROM photos) /  (SELECT COUNT(*) FROM users)) ;


-- 6. FINDING 5 MOST COMMON HASHTAGS

SELECT 
	tag_name,
	tag_id,
	COUNT(*) AS amount
FROM tags
JOIN photo_tags
ON tags.id = photo_tags.tag_id 
GROUP BY tags.id
ORDER BY amount DESC 
LIMIT 5;


-- 7. FINDING USERS THAT LIKED EVERY SINGLE PHOTO

SELECT
	username,
	COUNT(*) as total
FROM users
JOIN likes
ON users.id = likes.user_id
GROUP BY users.id
HAVING total = (SELECT COUNT(*) FROM photos);







