use final_cit225;

SELECT * FROM final_cit225.person;

CREATE OR REPLACE VIEW foreing_relationships AS
SELECT first_name, last_name, age, country 
FROM person
WHERE country NOT LIKE "USA";

CREATE OR REPLACE VIEW first_kissers AS 
SELECT person_id, first_name, last_name
FROM person
	JOIN person_has_dates
		ON person.id = person_has_dates.person_id
WHERE first_kiss_date = 1;

CREATE OR REPLACE VIEW first_kiss_activity AS 
SELECT activity, first_name
FROM person
	JOIN person_has_dates
		ON person.id = person_has_dates.person_id
	JOIN dates
		ON person_has_dates.person_id = dates.id
WHERE first_kiss_date = 1;

CREATE OR REPLACE VIEW last_date_from_today AS 
SELECT person_id, first_name, last_name, activity,  DATEDIFF(NOW(), activity_date) AS "last date diference in days", dates.id
FROM person
	JOIN person_has_dates
		ON person.id = person_has_dates.person_id
	JOIN dates
		ON person_has_dates.person_id = dates.id;

CREATE OR REPLACE VIEW common_activity_to_get_relationships AS 
SELECT activity, COUNT(activity)
FROM person
	JOIN person_has_dates
		ON person.id = person_has_dates.person_id
	JOIN dates
		ON person_has_dates.person_id = dates.id
        GROUP BY looking_dates;
        
CREATE OR REPLACE VIEW usa_relatinoships AS 
SELECT first_name, last_name, country, mayor, age, number_of_relationships
FROM person
WHERE country = "usa"
ORDER BY number_of_relationships DESC;

CREATE OR REPLACE VIEW mayors_activities_affiliation AS 
SELECT mayor, looking_dates, activity
FROM person
	JOIN person_has_dates
		ON person.id = person_has_dates.person_id
	JOIN dates
		ON person_has_dates.person_id = dates.id
	WHERE looking_dates = 1;
    
CREATE OR REPLACE VIEW Marriages_spouses AS 
SELECT p1.first_name AS "husband's first name", 
		p1.last_name AS "husband's last name", 
		p2.first_name AS "wife's first name", p2.last_name AS "wife's last name"
FROM person p1
	JOIN marriages m 
		ON p1.id = m.spouse1_id
	JOIN person p2
		ON p2.id = m.spouse2_id;

CREATE OR REPLACE VIEW bill_and_ryann_in_marriage AS 
SELECT p1.first_name AS "husband's first name", 
		p1.last_name AS "husband's last name", 
		p2.first_name AS "wife's first name", p2.last_name AS "wife's last name",
 DATEDIFF(divorce_date, marriage_date) AS "total days in marriage"
FROM person p1
	JOIN marriages m 
		ON p1.id = m.spouse1_id
	JOIN person p2
		ON p2.id = m.spouse2_id
	WHERE divorce_date IS NOT NULL;
    
CREATE OR REPLACE VIEW bill_cosby_single_since_last_marriage AS 
SELECT p1.first_name AS "first name", 
		p1.last_name AS "last name", 
 DATEDIFF(NOW(), marriage_date) AS "total days not in a marriage"
FROM person p1
	JOIN marriages m 
		ON p1.id = m.spouse1_id
	JOIN person p2
		ON p2.id = m.spouse2_id
	WHERE divorce_date IS NOT NULL;

CREATE OR REPLACE VIEW current_marriages_with_children AS 
SELECT p1.first_name AS "husband's first name", 
		p1.last_name AS "husband's last name", 
		p2.first_name AS "wife's first name", 
        p2.last_name AS "wife's last name",
        num_children AS "children"
FROM person p1
	JOIN marriages m 
		ON p1.id = m.spouse1_id
	JOIN person p2
		ON p2.id = m.spouse2_id
	WHERE divorce_date IS NULL;
    
CREATE OR REPLACE VIEW divorce_marriages_with_children AS 
SELECT p1.first_name AS "husband's first name", 
		p1.last_name AS "husband's last name", 
		p2.first_name AS "wife's first name", 
        p2.last_name AS "wife's last name",
        num_children AS "children"
FROM person p1
	JOIN marriages m 
		ON p1.id = m.spouse1_id
	JOIN person p2
		ON p2.id = m.spouse2_id
	WHERE divorce_date IS NOT NULL;


SELECT * FROM foreing_relationships;
SELECT * FROM first_kissers;
SELECT * FROM first_kiss_activity;
SELECT * FROM last_date_from_today;
SELECT * FROM common_activity_to_get_relationships;
SELECT * FROM usa_relatinoships;
SELECT * FROM mayors_activities_affiliation;
SELECT * FROM Marriages_spouses;
SELECT * FROM bill_and_ryann_in_marriage;
SELECT * FROM bill_cosby_single_since_last_marriage;
SELECT * FROM current_marriages_with_children;
SELECT * FROM divorce_marriages_with_children;