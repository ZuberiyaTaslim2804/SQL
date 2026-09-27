-- DQL(SELECT) AND ALIAS

-- Setup Queries
CREATE DATABASE IF NOT EXISTS student_report_homework;
USE student_report_homework;

CREATE TABLE student_results (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    branch VARCHAR(20) NOT NULL,
    sql_score INT NOT NULL,
    python_score INT NOT NULL,
    aptitude_score INT NOT NULL,
    communication_score INT NOT NULL,
    attendance_percentage DECIMAL(5,2) NOT NULL
);

INSERT INTO student_results
VALUES
    (101, 'Asha', 'CSE', 84, 88, 76, 82, 91.50),
    (102, 'Ravi', 'ECE', 72, 69, 81, 74, 86.00),
    (103, 'Meera', 'CSE', 92, 95, 89, 90, 96.50),
    (104, 'Arjun', 'ME', 65, 71, 68, 73, 79.50),
    (105, 'Neha', 'ISE', 87, 90, 85, 88, 93.00),
    (106, 'Kiran', 'EEE', 78, 75, 80, 77, 84.50),
    (107, 'Zoya', 'CSE', 91, 86, 88, 94, 95.00),
    (108, 'Vikram', 'ECE', 70, 74, 72, 69, 81.00);

-- ============================================================
-- HOMEWORK TASKS
-- ============================================================

-- 1. Basic student report
SELECT 
    student_id AS `Student ID`, 
    student_name AS `Student Name`, 
    branch AS `Branch`
FROM student_results;

-- 2. Technical report
SELECT 
    student_name AS `Student`, 
    sql_score AS `SQL Score`, 
    python_score AS `Python Score`
FROM student_results;

-- 3. Combined technical score
SELECT 
    student_name, 
    (sql_score + python_score) AS `Technical Score`
FROM student_results;

-- 4. Total score across all four assessments
SELECT 
    student_name, 
    (sql_score + python_score + aptitude_score + communication_score) AS `Total Score`
FROM student_results;

-- 5. Average score
SELECT 
    student_name, 
    (sql_score + python_score + aptitude_score + communication_score) / 4 AS `Average Score`
FROM student_results;

-- 6. Marks required to reach 400
SELECT 
    student_name, 
    400 - (sql_score + python_score + aptitude_score + communication_score) AS `Marks Below Maximum`
FROM student_results;

-- 7. Assessment report
SELECT 
    student_id AS `Student ID`, 
    student_name AS `Student Name`, 
    branch AS `Branch`, 
    (sql_score + python_score + aptitude_score + communication_score) AS `Total Score`, 
    (sql_score + python_score + aptitude_score + communication_score) / 4 AS `Average Score`
FROM student_results;

-- 8. Detailed report
SELECT 
    student_name AS `Student Name`, 
    sql_score AS `SQL Score`, 
    python_score AS `Python Score`, 
    aptitude_score AS `Aptitude Score`, 
    communication_score AS `Communication Score`, 
    (sql_score + python_score + aptitude_score + communication_score) AS `Total Score`, 
    (sql_score + python_score + aptitude_score + communication_score) / 4 AS `Average Score`
FROM student_results;

-- 9. Attendance report
SELECT 
    student_name AS `Student`, 
    branch AS `Department`, 
    attendance_percentage AS `Attendance %`
FROM student_results;

-- 10. Final formatted report
SELECT 
    student_id AS `Student ID`, 
    student_name AS `Student Name`, 
    branch AS `Branch`, 
    (sql_score + python_score) AS `Technical Score`, 
    (sql_score + python_score + aptitude_score + communication_score) AS `Total Score`, 
    (sql_score + python_score + aptitude_score + communication_score) / 4 AS `Average Score`, 
    attendance_percentage AS `Attendance %`
FROM student_results;


