-- TRUNCATE vs DROP

-- Database creation and setup
CREATE DATABASE IF NOT EXISTS practice_db;

USE practice_db;

-- Table creation
CREATE TABLE temporary_students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(60) NOT NULL,
    branch VARCHAR(30) NOT NULL
);

-- Insert sample data
INSERT INTO temporary_students (
    student_name,
    branch
)
VALUES
    ('Asha', 'CSE'),
    ('Ravi', 'ECE'),
    ('Meera', 'ISE');

-- Check records and table structure
SELECT * FROM temporary_students;

DESCRIBE temporary_students;

-- Truncate example (removes all records, preserves structure)
TRUNCATE TABLE temporary_students;

-- Verify after truncating
SELECT * FROM temporary_students;

DESCRIBE temporary_students;

-- Insert a new record to demonstrate AUTO_INCREMENT reset after TRUNCATE
INSERT INTO temporary_students (
    student_name,
    branch
)
VALUES (
    'Zoya',
    'CSE'
);

SELECT * FROM temporary_students;

-- Drop example (removes table completely)
DROP TABLE temporary_students;

-- Verify table removal
SHOW TABLES;

-- Safe drop syntax using IF EXISTS
DROP TABLE IF EXISTS temporary_students;