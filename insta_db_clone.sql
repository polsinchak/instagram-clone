-- CREATING USERS TABLE

CREATE TABLE users (
	id INT AUTO_INCREMENT PRIMARY KEY,
	username VARCHAR(255) UNIQUE NOT NULL,
	created_at TIMESTAMP DEFAULT NOW()
);

-- CREATING PHOTOS TABLE

CREATE TABLE photos (
	id INT AUTO_INCREMENT PRIMARY KEY,
	image_url VARCHAR(255) NOT NULL,
	user_id INT NOT NULL,
	created_at TIMESTAMP DEFAULT NOW(),
	FOREIGN KEY(user_id) REFERENCES users(id)
);

-- CREATING COMMENTS TABLE

CREATE TABLE comments (
	id INT AUTO_INCREMENT PRIMARY KEY,
	comment_text VARCHAR(255) NOT NULL,
	photo_id INT NOT NULL,
	user_id INT NOT NULL,
	created_at TIMESTAMP DEFAULT NOW(),
	FOREIGN KEY(photo_id) REFERENCES photos(id),
	FOREIGN KEY(user_id) REFERENCES users(id)
);

-- CREATING LIKES TABLE

CREATE TABLE likes (
	user_id INT NOT NULL,
	photo_id INT NOT NULL,
	created_at TIMESTAMP DEFAULT NOW(),
	FOREIGN KEY(user_id) REFERENCES users(id),
	FOREIGN KEY(photo_id) REFERENCES photos(id),
	PRIMARY KEY(user_id, photo_id)
);

-- CREATING FOLLOWS TABLE
-- (CONTAINS BOTH FOLLOWER AND FOLLOWEE INFORMATION)

CREATE TABLE follows (
	follower_id INTEGER NOT NULL,
	followee_id INTEGER NOT NULL,
	created_at TIMESTAMP DEFAULT NOW(),
	FOREIGN KEY(follower_id) REFERENCES users(id),
	FOREIGN KEY(followee_id) REFERENCES users(id),
	PRIMARY KEY(follower_id, followee_id)
);

-- CREATING TAGS TABLE

CREATE TABLE tags (
	id INT AUTO_INCREMENT PRIMARY KEY,
	tag_name VARCHAR(255) UNIQUE,
	created_at TIMESTAMP DEFAULT NOW()
);

-- CREATING PHOTO TAGS TABLE

CREATE TABLE photo_tags (
	photo_id INT NOT NULL,
	tag_id INT NOT NULL,
	FOREIGN KEY(photo_id) REFERENCES photos(id),
	FOREIGN KEY(tag_id) REFERENCES tags(id),
	PRIMARY KEY(photo_id, tag_id)
);






























































