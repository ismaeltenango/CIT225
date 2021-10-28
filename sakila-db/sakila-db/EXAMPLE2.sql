use sakila;
/*problem 1  Write the SQL statement that retrieves 
the actor ID, first name, and last name for all actors. 
Sort results by last name and then by first name.  */
SELECT id, f_name, l_name
FROM actor
ORDER BY l_name ASC, f_name DESC;