USE sakila;

-- PROBLEM 1
-- 1. Write a query to find the first name, last name, 
-- address and city of all customers who reside in the address district of California. 
-- This query should return 9 rows.

SELECT first_name, last_name, address, city, district
FROM customer 
	INNER JOIN address
		ON customer.address_id = address.address_id
	INNER JOIN city ci
		ON ci.city_id = address.city_id
WHERE district = "california";

-- PROBLEM 2
-- 2. Write a query that returns the title of every 
-- film in which an actor with the first name NICK appeared. 
-- You should return the film title, actor first name, and actor last name.
-- SELECT title, first_name, last_name
SELECT title, first_name, last_name
FROM film INNER JOIN film_actor
		ON film.film_id = film_actor.film_id
    INNER JOIN actor
		ON actor.actor_id = film_actor.actor_id
    WHERE first_name = "NICK";



-- PROBLEM 3
-- Use a self-join on the actor table to find the first and last names of all actors 
-- who share the same first name with others in the database.
SELECT a1.first_name, a2.last_name
FROM actor a1
	INNER JOIN actor a2
		ON a1.first_name = a2.first_name
	WHERE a1.last_name <> a2.last_name
		ORDER BY first_name, last_name;


-- PROBLEM 4
-- Construct a query that returns all addresses that are in the same city. 
-- You will need to join the address table to itself, 
-- and each row should include two different addresses. Sort your results by city name.
SELECT a1.address, a2.address, city
FROM address a1 INNER JOIN address a2
		ON a1.city_id = a2.city_id
	INNER JOIN city
		ON city.city_id = a2.city_id
WHERE a1.address != a2.address
ORDER BY city;

-- PROBLEM 5 
-- Write a query that shows all the films starring Jane Jackman that have a runtime 
-- between 90 and 120 minutes. Include the film title and length in your results.
SELECT title, length
FROM film INNER JOIN film_actor
		ON film.film_id = film_actor.film_id
		 INNER JOIN actor
		ON actor.actor_id = film_actor.actor_id
WHERE first_name = "Jane" AND last_name = "Jackman"
	AND length BETWEEN 90 AND 120;



-- PROBLEM 6
-- Write a query that selects all distinct films that are part of store 2's inventory.
-- Further filter the films to only those in which Emily Dee stars. You should have 11 rows in your result set.
SELECT DISTINCT title
FROM actor INNER JOIN film_actor
	ON actor.actor_id = film_actor.actor_id
		INNER JOIN film
	ON film.film_id = film_actor.film_id
		INNER JOIN inventory
	ON film.film_id = inventory.film_id
WHERE first_name = "emily" AND last_name = "dee"
AND store_id = 2;
    

-- FROM film INNER JOIN inventory
-- 			ON film.film_id = inventory.film_id
-- 		 INNER JOIN store
-- 			ON store.store_id = inventory.store_id;
-- WHERE first_name = "EMILY" AND last_name = "dee";
