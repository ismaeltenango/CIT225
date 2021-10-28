-- WORKING WITH STRING DATA\
USE sakila;
SELECT INSERT ("MySQL is HARD", 9, 0, " not") string;
SELECT REPLACE("I am vegan","vegan","handsome");
SELECT first_name, REPLACE(first_name,"ED", "Eddie")
FROM actor;
SELECT title
FROM filM
WHERE SUBSTRING(title, LOCATE("OO", title), 2) = "oo";

-- WORKING WITH NUMERIC DATA
SELECT amount,
	ROUND(amount, 1),
    CEIL(amount),
    FLOOR(amount),
	TRUNCATE(amount, 1)
FROM payment;

-- WORKING WITH DATE TIME DATA
SELECT DATE_FORMAT(NOW(),"%M %D %Y"),
	SYSDATE(),
    CURRENT_DATE(),
    CURRENT_TIME,
    UTC_DATE(),
    UTC_TIME();

SELECT payment_date, 
CONCAT (DATE_FORMAT(payment_date, "%m/%d/%Y"), " ", TIME_FORMAT(PAYMENT_DATE, "%h:%I %p"))
FROM payment;

SELECT DATE_FORMAT("2020-01-01", "%M %d, %Y"); -- January 01, 2020
SELECT DATE_FORMAT("2020-01-01", "%M %e, %Y"); -- January 1, 2020
SELECT STR_TO_DATE("January 01, 2020", "%M %e, %Y"); -- change the fancy date to a default format date.
SELECT STR_TO_DATE("Friday, 21st September, 1838", "%W, %dst %M, %Y"); -- change super fancy date into a default format string.