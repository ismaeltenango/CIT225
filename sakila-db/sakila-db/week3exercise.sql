USE sakila;

-- problem 1
SELECT customer_id, payment_id, amount, payment_date
From payment
WHERE customer_id != 5 AND (amount > 8 OR DATE(payment_date) = "2005-08-23")
ORDER BY customer_id ASC
LIMIT 25;

-- PROBLEM 2
-- Alter your query from #1 to include only transactions with customer 5, where the customer paid 
-- more than $6 and didn’t pay on June 19, 2005. You should have 5 rows returned.
SELECT customer_id, payment_id, amount, payment_date
FROM payment
WHERE customer_id = 5 AND (amount > 6 AND DATE(payment_date) != "2005-06-19")
ORDER BY customer_id ASC;

-- PROBLEM 3 
-- Construct a query that retrieves all rows from the payment 
-- table where the amount is either 98, 7.98, or 9.98.-- 
SELECT customer_id, amount
FROM payment
WHERE amount = 5.98 OR amount = 7.98 OR amount = 9.98
ORDER BY customer_id ASC;

-- problem 4
-- Construct a query that finds the first and last names of all customers 
-- whose last name contains an A in the second position and a W anywhere after the A.

-- ANOTHER WAY WITH MORE SPECIFIC CONDITIONS IN THE DATA.
-- SELECT *
-- FROM customer
-- WHERE last_name REGEXP "^.a.*w";

SELECT last_name, first_name
FROM customer
WHERE last_name LIKE "_a%w%";

-- problem 5

-- Provide a query that selects the title, rating, and price of all 
-- movies that are family-friendly (ratings of G or PG) 
-- and have a rental rate of $0.99. You should have 126 such movies.
SELECT title, rating, rental_rate
FROM film
WHERE rental_rate = 0.99 AND rating = "G" OR rental_rate = 0.99 AND rating = "PG"
ORDER BY rating ASC;

-- PROBLEM 6
-- Use a subquery in your WHERE clause to find the titles, ratings, 
-- and runtimes (lengths) of all films longer than 'TRAFFIC HOBBIT'. 
-- Sort your results by title in reverse alphabetical order.

SELECT title, rating, length
FROM film
WHERE length > 
	(SELECT length FROM film WHERE title = "TRAFFIC HOBBIT")
		ORDER BY title DESC;

