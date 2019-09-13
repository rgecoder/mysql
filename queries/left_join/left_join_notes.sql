-- get all tweets from user id of 1
SELECT users.first_name, users.last_name, GROUP_CONCAT(' ', tweets.tweet)
FROM users
JOIN tweets ON users.id = tweets.user_id
WHERE users.id = 1
GROUP BY users.id;

-- solution 1
SELECT *
FROM users
LEFT JOIN tweets
ON users.id = tweets.user_id
WHERE users.id = 2;

-- 2. query: return all tweets that user id = 2 tagges as favs -- COMPLETE
SELECT first_name, tweets.tweet
FROM users
LEFT JOIN tweets ON users.id = tweets.user_id
LEFT JOIN faves ON tweets.id = faves.tweet_id
WHERE faves.user_id = 2; 

-- 2. Solution alt
SELECT first_name, tweet
FROM users
LEFT JOIN faves ON users.id = faves.user_id
LEFT JOIN tweets ON faves.tweet_id = tweets.id
WHERE users.id = 2; 

-- 3 Get all the tweets user id = 2, or user id = 1, that is tagged as favs
SELECT first_name, tweet
FROM users 
LEFT JOIN faves ON  users.id = faves.user_id
LEFT JOIN  tweets ON faves.tweet_id =  tweets.id
WHERE users.id = 2 OR users.id=1;

-- 4. Query to get all users that are following user with id 1?
-- MANY TO MANY using the same table twice
-- Key word is AS, it allows same table to be joined twice
SELECT users.first_name AS followed, users2.first_name as follower
FROM users
LEFT JOIN follows ON users.id = follows.followed_id
LEFT JOIN users as users2 ON users2.id = follows.follower_id
WHERE users.id = 1;

-- 5. All users that are NOT following the user id = 2
-- SELECT users.first_name AS user_id, users2.first_name AS not_followed
-- FROM users
-- LEFT JOIN follows ON users.id = follows.followed.id
 -- JOIN users AS users2 ON users2.id = follows.follower_id
 -- WHERE users.id <> 2;


-- 5 SOL - This requires nested queries
SELECT * FROM users
WHERE users.id NOT IN (

SELECT follower_id
FROM follows
WHERE followed_id = 2)

AND users.id != 2;

-- 5.2 IMPORTANT, count number of followers for user id = 1
SELECT users.first_name as user, COUNT(users2.first_name) AS follower_count
FROM users
LEFT JOIN follows ON users.id = follows.followed_id
LEFT JOIN users AS users2 ON users2.id = follows.follower_id
WHERE users.id = 1
GROUP BY users.id; 

-- Join is sometimes referred as INNER JOIN, all other joins are referred as OUTER JOIN










