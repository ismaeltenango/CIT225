
-- SELECT * FROM sakila.film;
use sakila;
SELECT title, first_name, last_name
FROM film
	INNER JOIN film_actor
		ON film.film_id = film_actor.film_id
    INNER JOIN actor
		ON actor.actor_id = film_actor.actor_id;
        
SELECT address, address2, city, country, c.country_id
FROM address a
	INNER JOIN city c
		ON c.city_id = a.city_id
	INNER JOIN country co
		ON co.country_id = c.country_id;
        
        
