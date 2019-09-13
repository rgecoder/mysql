-- 1. all customers inside city_id=312
SELECT city.city_id, city.city, customer.first_name, customer.last_name, customer.email, address.address
FROM city
JOIN address ON city.city_id = address.city_id
JOIN customer ON customer.address_id = address.address_id
WHERE city.city_id = 312;

-- 2. all comedy films  ** MANY TO MANY, created a film_category table to link the two
SELECT film.film_id, film.title, film.description, release_year, film.rating, film.special_features, category. name
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
WHERE category.name = 'Comedy';

-- 3. all films joined by actor_id = 5
SELECT actor.actor_id, concat( ' ', actor.first_name, ' ' , actor.last_name) AS full_name , film.film_id, film.title, film.description, film.release_year
FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE actor.actor_id = 5;

-- 4. all customers in store_id = 1 and inside cities (1,42,312, 459)
SELECT store.store_id, address.city_id, customer.first_name, customer.last_name, customer.email, address.address
FROM store
JOIN customer ON store.store_id = customer.store_id
JOIN address ON customer.address_id = address.address_id
WHERE store.store_id = 1 AND address.city_id  IN (1, 42, 312, 459); 

-- 5. all films with rating = G and special features = behind the scenes, joined by actor_id = 15
SELECT film.title, film.description, film.release_year, film.rating, film.special_features
FROM film
JOIN film_actor ON film_actor.film_id = film.film_id
WHERE rating = 'G'
AND special_features LIKE '%Behind the Scenes%'
AND actor_id = '15'; -- can locate actor_id using the joint table without joining actual actor table

-- 6. all actors joined in film_id=369 
SELECT film_actor.film_id, film.title, film_actor.actor_id, CONCAT(actor.first_name,' ', actor.last_name) AS actor_name
FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON actor.actor_id = film_actor.actor_id
WHERE film_actor.film_id = 369;

-- 7. all drama films with rental rate = 2.99
SELECT film.title, film.description, film.release_year, film.rating, film.special_features, category.name AS genre
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON category.category_id = film_category.category_id
WHERE film.rental_rate = 2.99
AND category.name = 'Drama';

-- 8. all action films joined by SANDRA KILMER
SELECT film.title, film.description, film.release_year, film.rating, film.special_features, category.name AS genre, actor.first_name, actor.last_name
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON category.category_id = film_category.category_id
JOIN film_actor ON film_actor.film_id = film.film_id
JOIN actor ON actor.actor_id = film_actor.actor_id
WHERE category.name = "Action" AND CONCAT(actor.first_name, ' ', actor.last_name) LIKE "Sandra Kilmer";














