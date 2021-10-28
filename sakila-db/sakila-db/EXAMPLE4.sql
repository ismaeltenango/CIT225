USE sakila;
-- CREATE VIEW all_customers AS 

SELECT * FROM (
(SELECT "cust", last_name, first_name
	FROM customer)
UNION
(SELECT "actor", last_name, first_name
	FROM actor)) a
		ORDER BY last_name;

-- SELECT * FROM all_customers