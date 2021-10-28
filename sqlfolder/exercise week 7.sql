USE sakila;

-- PROBLEM 1
-- Construct a query that counts the number of rows in the payment table.
SELECT count(amount),
    count(*)
FROM payment;

-- PROBLEM 2 
-- Modify the previous query to count the number of payments made by each customer.
-- Use a join to show the customer first name, customer last name, and total amount paid. Sort so the highest payment is first.
SELECT customer.customer_id, first_name, last_name, COUNT(payment_id) AS payment_count, SUM(amount) AS Total_Payment
	FROM customer INNER JOIN payment
		ON customer.customer_id = payment.customer_id
	GROUP BY customer.customer_id
    ORDER BY Total_Payment DESC;

-- PROBLEM 3
-- Filter your results from the previous query to only include customers who have made 40 or more payments.
-- Add this payment count to your existing SELECT list. (hint: your query should return only 5 customers).
SELECT customer.customer_id, first_name, last_name, COUNT(payment_id) AS payment_count, SUM(amount) AS Total_Payment
	FROM customer INNER JOIN payment
		ON customer.customer_id = payment.customer_id
	GROUP BY customer.customer_id
    HAVING COUNT(payment_id) > 40
    ORDER BY Total_Payment DESC;

-- PROBLEM 4
-- Write a query to find the average replacement cost of rentals in each category. 
-- Include category name and average replacement cost in your result set.  film.name // film_category.film.id // category.category/_id
SELECT name, AVG(replacement_cost) AS Average_Cost
FROM film INNER JOIN film_category
	ON film.film_id = film_category.film_id
		INNER JOIN category
	ON category.category_id = film_category.category_id
    group by name;

-- PROBLEM 5
-- Query the film table to find the total number of films whose titles start with each letter of the alphabet. 
-- (hint: you will need to use a function in your GROUP BY clause to accomplish this.)
SELECT SUBSTR(title, 1, 1) AS Letter, COUNT(title) AS number_of_films
FROM film
GROUP BY Letter;

-- PROBLEM 6
-- Edit your last query to find the longest and shortest film lengths for titles beginning with each letter.
SELECT SUBSTR(title, 1, 1) AS Letter, COUNT(title) AS number_of_films,CHAR_LENGTH(title) AS title_Length, title
FROM film
GROUP BY Letter
HAVING title_length > title_length - 1;

-- PROBLEM 7
-- Create a query that groups by both category name and movie rating. 
-- Use the ROLLUP utility to also create summary rows for each category name regardless of rating. 
-- Sort your results by category name, then reverse rating order.