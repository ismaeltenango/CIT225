USE books;
INSERT INTO author values (DEFAULT, "Talmadge", "James E.","1856", "1910");

SELECT * FROM author;

UPDATE author
SET l_name = "Talmage"
WHERE id = 1;

DELETE
FROM author
WHERE id = 1;

