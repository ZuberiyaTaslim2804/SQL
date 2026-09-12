show databases;
-- creating datbase
CREATE DATABASE day_01;

-- using the database
USE day_01;

-- creating a table
CREATE TABLE students(
	id INT,
    name VARCHAR(60),
    email VARCHAR(60),
    password VARCHAR(60)
    );

-- show tables in database
SHOW TABLES;

CREATE TABLE courses(
	course_id INT,
    course_name VARCHAR(100),
    price DECIMAL(10,2)
    );

SHOW TABLES;


SELECT * FROM students;

-- to get description of table
DESC students;

-- to add a col to existing table
ALTER TABLE students 
	ADD COLUMN course_name VARCHAR(60);
    
-- to modify a col data type to existing table
ALTER TABLE students 
	MODIFY COLUMN course_name TEXT;
    
-- to DROP a col FROM existing table
ALTER TABLE students 
	DROP COLUMN course_name ;
    
DESC students;
    

	


