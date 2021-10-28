USE sakila;
-- PROBLEM 1 
-- Write a query to select each customer's first name, and last name, 
-- and use a string function to get their street name without the address. 
-- For example, instead of 123 Garland Manor, only select Garland Manor. Order by street name.
-- (hint: a few useful functions include SUBSTRING and LOCATE).
SELECT first_name, last_name, TRIM(SUBSTRING(address, LOCATE(" ", address, 1) ) ) AS "Address whitout street #"
	FROM customer c JOIN address a
	ON c.address_id = a.address
    ORDER BY address;

-- PROBLEM 2
 -- Write a query to round the rental amounts in the following ways. 
-- Include the original amount for reference. Use column aliases to rename the columns.
-- Round all of the payments up, include the 1 decimal (1.99 -> 2)
-- Round all the payments down, include the 1 decimal (1.99 -> 1)
-- Round all the payments to 1 decimal (1.99 -> 1.9)
-- Round all payments to the nearest multiple of 10 (1.99 -> 0)


-- help!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
SELECT amount, CEILING(amount) AS "ceiled number", 
FLOOR(amount) AS "floored number", 
ROUND(amount, 1) AS "rounded number" ,
ROUND(amount, -1) AS "nearest 10"
FROM payment;

-- PROBLEM 3 
-- Write a query that returns distinct film title and the month when 
-- the movie was rented. Format the month so it is the actual word (eg "August" instead of 8). 
-- Select only films that were rented in May (hint: join to film through the inventory table).

SELECT DISTINCT title, DATE_FORMAT(rental_date,"%M") AS "Month of rental"
	FROM rental INNER JOIN inventory
		ON rental.inventory_id = inventory.inventory_id
	INNER JOIN film
		ON film.film_id = inventory.film_id
    WHERE DATE_FORMAT(rental_date,"%M") = "May";

-- PROBLEM 4 
--  Write a query to return the number of days that the popular film 'CURTAIN VIDEOTAPE'
--  was rented. Each row should include customer first and last name, film title, rental date, 
--  return date, and a column called "rental_period" that shows the length of the rental period. 
--  Order by the longest rental period first.
SELECT first_name, last_name, title, rental_date, return_date,  DATEDIFF(return_date, rental_date) AS "rental_period"
-- first_name, last_title, DATEDIFF(NOW(), rental_rate)
FROM customer INNER JOIN rental
	ON customer.customer_id = rental.customer_id
		INNER JOIN inventory
	ON inventory.inventory_id = rental.inventory_id
		INNER JOIN film
	ON film.film_id = inventory.film_id
WHERE title = "CURTAIN VIDEOTAPE"
ORDER BY rental_period desc;


-- PROBLEM 5 
-- Write a query that converts the string "Friday, 21st September, 1838" to a date. Then, 
-- calculate how many full years and remaining days it has been since then. Use the STR_TO_DATE() 
-- function to parse the string, and FLOOR and modulus to get the full years and remaining days.
SELECT STR_TO_DATE("Friday, 21st September, 1838", "%W, %dst %M, %Y") AS "DEFAULT DATE FORMAT", -- change super fancy date into a default format string.
			MOD(YEAR(NOW()),YEAR(STR_TO_DATE("Friday, 21st September, 1838", "%W, %dst %M, %Y"))) as "YEARS apart from today",
				CEIL(DATEDIFF(NOW(),STR_TO_DATE("Friday, 21st September, 1838", "%W, %dst %M, %Y")) % 365.25) AS "DAYS apart from today"; 
 -- FLOOR(DATEDIFF(NOW(),STR_TO_DATE("Friday, 21st September, 1838", "%W, %dst %M, %Y")) / 365.25) AS "YEARS apart from today",
			-- Another waay to get the days apart
