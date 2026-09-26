-- MODIFY the structre of student table

CREATE DATABASE IF NOT EXISTS student_structure_lab;

USE student_structure_lab;

DROP TABLE IF EXISTS student_details;

CREATE TABLE student_details (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    dept VARCHAR(20) NOT NULL,
    phone VARCHAR(10),
    temporary_note VARCHAR(100)
);

INSERT INTO student_details (
    name,
    dept,
    phone,
    temporary_note
)
VALUES
    ('Asha', 'CSE', '9876543210', 'Remove this column'),
    ('Ravi', 'Electronics', '9123456780', 'Remove this column'),
    ('Meera', 'Information Science', NULL, 'Remove this column');
USE student_structure_lab;

-- Initial Inspection
SHOW TABLES;
DESCRIBE student_details;
SELECT * FROM student_details;

-- Task 1: Rename the ID Column
ALTER TABLE student_details CHANGE id student_id INT AUTO_INCREMENT;
DESCRIBE student_details;
SELECT * FROM student_details;

-- Task 2: Rename and Expand the Name Column
ALTER TABLE student_details CHANGE name student_name VARCHAR(60) NOT NULL;
DESCRIBE student_details;
SELECT * FROM student_details;

-- Task 3: Rename the Department Column
ALTER TABLE student_details CHANGE dept department VARCHAR(20) NOT NULL;
DESCRIBE student_details;
SELECT * FROM student_details;

-- Task 4: Increase the Department Length
ALTER TABLE student_details MODIFY department VARCHAR(50) NOT NULL;
DESCRIBE student_details;
SELECT * FROM student_details;

-- Task 5: Rename and Expand the Phone Column
ALTER TABLE student_details CHANGE phone phone_number VARCHAR(15);
DESCRIBE student_details;
SELECT * FROM student_details;

-- Task 6: Add an Email Column
ALTER TABLE student_details ADD email VARCHAR(100) AFTER student_name;
DESCRIBE student_details;
SELECT * FROM student_details;

-- Task 7: Add a CGPA Column
ALTER TABLE student_details ADD cgpa DECIMAL(4, 2) AFTER department;
DESCRIBE student_details;
SELECT * FROM student_details;

-- Task 8: Add a Placement-Status Column
ALTER TABLE student_details ADD placement_status VARCHAR(20) NOT NULL DEFAULT 'Not Placed' AFTER cgpa;
DESCRIBE student_details;
SELECT * FROM student_details;

-- Task 9: Add a Registration-Time Column
ALTER TABLE student_details ADD registered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
DESCRIBE student_details;
SELECT * FROM student_details;

-- Task 10: Remove the Temporary Column
ALTER TABLE student_details DROP COLUMN temporary_note;
DESCRIBE student_details;
SELECT * FROM student_details;

-- Task 11: Rename the Table
RENAME TABLE student_details TO students;

-- Final Verification
SHOW TABLES;
DESCRIBE students;
SELECT * FROM students;