USE sakila;
/*
Create an example for each function. Show the data before it goes
into the function and the result after it passes through the function.
Use this link for examples, then spin up your own:
https://www.techonthenet.com/mysql/functions/index.php
EX.
SELECT LTRIM('   salmon');
# Result: salmon
*/
-- String Functions
SELECT CONCAT("Is","ma","el");
#Result: ismael
SELECT CONCAT_WS(" ","I love"," all", " tacos");
#Result: I love tacos
SELECT LTRIM("               VS CODE python");
#Result: VS CPDE python
SELECT RTRIM("VS CODE python             ");
#Result: VS CODE python
SELECT TRIM("          VS CODE python             ");
#Result: VS CODE python
SELECT LENGTH("VS CODE python");
#Result: 14
SELECT LOCATE("a", "Ismael") AS name; -- LOCATE (substring, string, [starts_position])
#Result: 4
SELECT LEFT("Ismael Moises", 8);
#Result: Ismael M
SELECT RIGHT("Ismael Moises", 9);
#Result: el Moises
SELECT SUBSTRING_INDEX("www.ismaeltenango.mx", ".", 2); -- take out where the index is and keep reminder
#Result: www.ismaeltenango
SELECT SUBSTRING("SQL Tutorial", 5, 3) AS ExtractString; -- Extract a substring from a string (start at position 5, extract 3 characters):
#Result: tut
SELECT REPLACE("I am vegan","vegan","handsome");
#Result: I am handsome
SELECT INSERT ("MySQL is HARD", 9, 0, " not") string;
#Result: MySQL is not HARD
SELECT REVERSE("I love swimming an playing videogames");
#Result: semagoediv gniyalp na gnimmiws evol I
SELECT LOWER("I LOVE SWIMMING AN PLAYING VIDEOGAMES");
#Result: I love swimming an playing videogames
SELECT UPPER("I love swimming an playing videogames");
#Result: I LOVE SWIMMING AN PLAYING VIDEOGAMES
SELECT LPAD("CODING IS FUN ", 30, "tacos ");  -- Left-pad the string with "ABC", to a total length of 20:
#Result: tacos tacos tacoCODING IS FUN 
SELECT RPAD("CODING IS FUN ", 30, "tacos");
#Result: CODING IS FUN tacostacostacost
SELECT SPACE(1);
#Result: 
SELECT REPEAT("eat sleep work repeat ", 3);
#Result: eat sleep work repeat eat sleep work repeat eat sleep work repeat 
-- Numeric Functions
SELECT ROUND(23.19, 1);
#Result: 23.2
SELECT TRUNCATE(23.19, -1);
#Result: 20
SELECT CEILING(23.19);
#Result: 24
SELECT FLOOR(23.19);
#Result: 23
SELECT ABS(-243.5);
#Result: 243.5
SELECT SIGN(243.5);
#Result: 1
SELECT SQRT(953);
#Result: 30.870698
SELECT POWER(2, 4);
#Result: 16
SELECT RAND(5);
#Result: .40613597483014313
-- DateTime Functions
SELECT NOW();
#Result: 2021-10-19 16:41:42
SELECT SYSDATE();
#Result: 2021-10-19 16:41:51
SELECT CURRENT_TIMESTAMP();
#Result: 2021-10-19 16:43:44
SELECT CURDATE();
#Result: 2021-10-19
SELECT CURRENT_DATE();
#Result: 2021-10-19
SELECT CURTIME();
#Result: 16:44:05
SELECT CURRENT_TIME();
#Result: 16:44:05
SELECT UTC_DATE();
#Result: 2021-10-19
SELECT UTC_TIME();
#Result: 22:44:34
SELECT DAYOFMONTH("2017-06-15");
#Result: 15
SELECT MONTH("2017-06-15");
#Result: 6
SELECT YEAR("2017-06-15");
#Result: 2017
SELECT HOUR("2021-10-19 16:41:51");
#Result: 16
SELECT MINUTE("2021-10-19 16:41:51");
#Result: 41
SELECT SECOND("2021-10-19 16:41:51");
#Result: 51
SELECT DAYOFWEEK("2021-10-19 16:41:51");
#Result: 3
SELECT QUARTER("2021-10-19 16:41:51");
#Result: 4
SELECT DAYOFYEAR("2021-10-19 16:41:51");
#Result: 292
SELECT WEEK("2021-10-19 16:41:51");
#Result: 42
SELECT LAST_DAY("2021-10-19 16:41:51");
#Result: 2021-10-31
SELECT DAYNAME("2021-10-19 16:41:51");
#Result: Tuesday
SELECT MONTHNAME();
#Result: August
SELECT EXTRACT(MONTH FROM "2015-04-08");
#Result: 4
SELECT DATE_FORMAT(NOW(),"%m/%d/%Y");
#Result: 10/19/2021
SELECT TIME_FORMAT(NOW(), "%h:%I %p");
#Result: 10:10 PM
SELECT DATE_ADD("2021-06-15", INTERVAL 2 DAY); -- Add 2 days to a date and return the date:
#Result: 2021-06-17
SELECT DATE_SUB("2021-06-15", INTERVAL 2 DAY); -- Substract 2 days to a date and return the date:
#Result: 2021-06-13
SELECT DATEDIFF("2021-06-25", "2021-06-15"); -- return the diference between two dates.
#Result: 10
SELECT TO_DAYS("2021-06-20"); -- Return the number of days between the date and year 0:
#Result: 738326
SELECT TIME_TO_SEC(CURRENT_TIME());
#Result: 81193