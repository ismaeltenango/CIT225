USE sakila;

-- example 1 -- 
SELECT title, rating, length, release_year, description
FROM film
WHERE release_year = 
	(SELECT release_year FROM film WHERE title = "FURY MURDER") AND RATING = "G" OR description LIKE "^%drama%"
		ORDER BY title ASC;
        
-- example 2 -- 

SELECT staff_id, customer_id, payment_date, amount
FROM payment
WHERE amount > 4.99 AND staff_id = 1 AND DATE(payment_date) = "2005-06-15"
ORDER BY payment_date ASC;

-- the idea of using sub queries is amazing and useful, and when we use subqueries in my mind is the reason is because 
-- the boss or our employer requested a detail table about what he is looking for.

-- I do not remember the name of this expresion " ^%drama% " i think is pattern mathcing, however, I like its functionality,
-- as a software engineer major sql is helping me to get used to sql and its syntax

-- The example number 2 is an example of what a real customer could request. Becasue what I think about proffesionl data bases job
-- is that they ask for really specific data and when the databse is big we have to be "picky" with our filters and queries we are using so
-- the query is displaying a table where bills of $5 are lost in one of the cashiers (staff) in a specfic day.