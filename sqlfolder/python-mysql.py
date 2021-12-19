import mysql.connector

# connectiing to mysql database

conn = mysql.connector.connect(
    host = "localhost",
    user = "root",
    password = "/*/*/*password/*/*/",
    database = "sakila",
    port = 3306
)

lname = input("enter a last name my guy ;) ")

cur = conn.cursor()
cur.execute("SELECT * FROM actor WHERE last_name = %s", (lname,))

rows = cur.fetchall()

for row in rows:
    print(f'ID = {row[0]} Name = {row[1]} ')
    
# CLOSE THE CURCOR
cur.close()
conn.close()