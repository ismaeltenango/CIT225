use sakila;
/*problem 1  Write the SQL statement that retrieves 
the actor ID, first name, and last name for all actors. 
Sort results by last name and then by first name.  */
SELECT id, first_name, last_name
FROM actor
ORDER BY last_name ASC, first_name DESC;

/*PROBLEM 2
Write the SQL statement that retrieves 
the actor ID, first name, and last name for all 
actors whose last name equals 'WILLIAMS' or 'DAVIS'.
*/
SELECT first_name, last_name
FROM actor
WHERE last_name = "WILLIAMS" OR last_name = "DAVIS";

/*PROBLEM 3
Write a query against the rental table that returns the IDs 
of the customers who rented a film on July 5, 2005 (use the rental_date column, 
and you can use the date() function to ignore the time component). 
Include a single row for each distinct customer ID.*/
SELECT rental_id
FROM rental
WHERE DATE(rental_date) = ("2005-07-05");

/*PROBLEM 4
Write a query to return the first and last name of all customers whose name does NOT 
begin with the letter A. Sort results by last name, then by first name.*/
SELECT last_name, first_name
FROM customer
WHERE last_name REGEXP "^[B-Z]";
-- WHERE last_name != "A" OR last_name != "A";

/*
PROBLEM 5
Find the customer id and payment amount from the payment table 
where the customer payed between 5 and 7 dollars. 
Sort results by customer id. Limit your results to the first 25 rows.*/
SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 5 AND 7
ORDER BY customer_id
LIMIT 25;

/*PROBLEM 6
You are setting up the shelves in your rental store and 
you need to find all the films with titles that start with DO through IT. 
Write a query to retrieve the titles of these films.*/

SELECT title
FROM film
WHERE title BETWEEN "DO%" AND "IT%";

/*PROBLEM 7
Find the customer id's with corresponding rental return dates that have not been returned. 
These rentals will have no return date. 
Be sure to return a single row for each distinct customer id. Sort by customer id.*/
SELECT  customer_id, return_date
FROM rental
WHERE return_date IS NULL;
