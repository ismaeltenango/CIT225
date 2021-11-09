    -- HOME WORK --

-- You watched a movie recently, "HOLY TADPOLE", and you really liked the actors in the film. 
-- Write a query with a subquery to find all films that star any cast members from "HOLY TADPOLE". Your query should return 85 films.
SELECT title
FROM film
	JOIN  film_actor
		ON film.film_id =film_actor.film_id
	JOIN actor
		ON actor.actor_id = film_actor.actor_id
	WHERE film_actor.actor_id IN 
		(SELECT film_actor.actor_id
			FROM film
				JOIN film_actor
					ON film.film_id = film_actor.film_id
				JOIN actor
					ON actor.actor_id = film_actor.actor_id
			WHERE title = "HOLY TADPOLE");
-- PROBLEM 2
-- Write a correlated subquery with the exists operator to find any actors who have never starred in an NC-17 film.
SELECT first_name, last_name
FROM actor a
WHERE EXISTS (SELECT *
					FROM film f
						JOIN film_actor fa
							ON f.film_id = fa.film_id
					WHERE rating != "NC-17"
                    AND a.actor_id = fa.film_id 
ORDER BY first_name, last_name);

-- Write another correlated subquery to select the first and last names of all 
-- customers who have ever made a payment of greater than $11. Use the EXISTS operator. 
-- The correct results should include only 10 rows.
SELECT first_name, last_name
	FROM payment p 
		JOIN customer c
			ON p.customer_id = c.customer_id
		AND amount > 11;

-- SELECT first_name, last_name
-- 	FROM payment p 
-- 		JOIN customer c
-- 			ON p.customer_id = c.customer_id
-- WHERE c.customer_id IN (SELECT p.customer_id)

-- You want to find the movies with the shortest length. Construct a query with a 
-- subquery that returns the titles of all the films with the minimum runtime.
SELECT title, length
FROM film
WHERE length = (SELECT MIN(length)
		from film);
        
-- Use a subquery to find the actor who has appeared in the most films and return 
-- their first name and last name (there are many ways you can solve this problem).
SELECT first_name, last_name
	FROM actor
		WHERE actor_id = (
			SELECT actor_id
			FROM film_actor
			GROUP BY actor_id
			ORDER BY COUNT(film_id) DESC
			LIMIT 1);
-- FINISH HOMEWORK -- 


-- SELECT sum(film_id) AS most_appearences, first_name, last_name
-- FROM actor
-- 	JOIN film_actor
-- 		ON	film_actor.actor_id = actor.actor_id
-- GROUP BY film_id
-- HAVING MAX(most_appearences);


SELECT COUNT(actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(actor_id) DESC
LIMIT 1;

SELECT 
	(SELECT COUNT(*) FROM actor AS actor_count),
    (SELECT COUNT(*) FROM city AS city_count);

SELECT titl, MAX(actr_COUNT)
FROM (SELECT film_id, COUNT(actor_id) actr_count
		FROM film_actor
		GROUP BY film_id) fa
JOIN film f
	ON f.film_id = fa.film_id;