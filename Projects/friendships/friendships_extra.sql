-- return all users who are friends with Kermit, display their names

SELECT users.first_name, users.last_name, users2.first_name AS friend_first_name, users2.last_name AS friend_last_name
FROM users
LEFT JOIN friendships ON users.id = friendships.user_id
LEFT JOIN users AS users2 ON friendships.friend_id = users2.id; -- left join allows users w/o friends to display as well

-- 1. return all users who are friends with Kermit
SELECT users.first_name, users.last_name
FROM users
LEFT JOIN friendships ON users.id = friendships.user_id
LEFT JOIN users AS friends ON friendships.friend_id = friends.id
WHERE friends.first_name LIKE 'Kermit';

-- 2. return the count of all friendships
SELECT users.first_name, users.last_name, COUNT(users2.id) AS friend_count
FROM users
LEFT JOIN friendships ON users.id = friendships.user_id
LEFT JOIN users AS users2 ON friendships.friend_id = users2.id
GROUP BY users.id;

-- 3. find who has most friends and return count of friends

SELECT users.first_name, users.last_name, COUNT(users2.id) AS friend_count
FROM users
LEFT JOIN friendships ON users.id = friendships.user_id
LEFT JOIN users AS users2 ON friendships.friend_id = users2.id
GROUP BY users.id;











