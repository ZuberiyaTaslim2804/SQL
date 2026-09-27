-- Filtering records with multiple conditions

-- Setup Queries (Run once)
CREATE DATABASE IF NOT EXISTS student_condition_practice;
USE student_condition_practice;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    branch VARCHAR(20) NOT NULL,
    score INT NOT NULL,
    attendance_percentage DECIMAL(5,2) NOT NULL,
    graduation_year INT NOT NULL,
    placement_status VARCHAR(20) NOT NULL
);

INSERT INTO students
VALUES
    (101, 'Asha', 'CSE', 82, 91, 2026, 'Placed'),
    (102, 'Ravi', 'ECE', 74, 86, 2026, 'Not Placed'),
    (103, 'Meera', 'CSE', 91, 96, 2025, 'Placed'),
    (104, 'Arjun', 'ME', 68, 78, 2026, 'Not Placed'),
    (105, 'Neha', 'ISE', 86, 93, 2025, 'In Progress'),
    (106, 'Kiran', 'CSE', 76, 84, 2026, 'In Progress'),
    (107, 'Zoya', 'ISE', 90, 95, 2026, 'Placed'),
    (108, 'Vikram', 'ECE', 80, 88, 2025, 'In Progress'),
    (109, 'Pooja', 'Civil', 72, 90, 2026, 'Not Placed'),
    (110, 'Rahul', 'ME', 85, 82, 2025, 'Placed'),
    (111, 'Sara', 'EEE', 88, 94, 2026, 'In Progress'),
    (112, 'Manoj', 'CSE', 60, 75, 2025, 'Not Placed');

-- ============================================================
-- PRACTICE WITH AND
-- ============================================================

-- 1. Display students from CSE who scored at least 80.
SELECT * 
FROM students 
WHERE branch = 'CSE' AND score >= 80;

-- 2. Display ECE students whose attendance is at least 85%.
SELECT * 
FROM students 
WHERE branch = 'ECE' AND attendance_percentage >= 85;

-- 3. Retrieve students who scored at least 80 and have attendance of at least 90%.
SELECT * 
FROM students 
WHERE score >= 80 AND attendance_percentage >= 90;

-- 4. Display students graduating in 2026 whose placement status is Placed.
SELECT * 
FROM students 
WHERE graduation_year = 2026 AND placement_status = 'Placed';

-- 5. Retrieve CSE students who scored above 75 and have attendance above 80%.
SELECT * 
FROM students 
WHERE branch = 'CSE' AND score > 75 AND attendance_percentage > 80;

-- 6. Display students who are not placed and have a score below 70.
SELECT * 
FROM students 
WHERE placement_status = 'Not Placed' AND score < 70;

-- ============================================================
-- PRACTICE WITH OR
-- ============================================================

-- 7. Display students who belong to CSE or ISE.
SELECT * 
FROM students 
WHERE branch = 'CSE' OR branch = 'ISE';

-- 8. Retrieve students whose placement status is Placed or In Progress.
SELECT * 
FROM students 
WHERE placement_status = 'Placed' OR placement_status = 'In Progress';

-- 9. Display students who scored above 90 or have attendance of at least 95%.
SELECT * 
FROM students 
WHERE score > 90 OR attendance_percentage >= 95;

-- 10. Retrieve students graduating in 2025 or students whose score is at least 90.
SELECT * 
FROM students 
WHERE graduation_year = 2025 OR score >= 90;

-- ============================================================
-- PRACTICE WITH NOT
-- ============================================================

-- 11. Display students whose placement status is not Placed using NOT.
SELECT * 
FROM students 
WHERE NOT (placement_status = 'Placed');

-- 12. Retrieve students who do not belong to the CSE branch.
SELECT * 
FROM students 
WHERE NOT (branch = 'CSE');

-- 13. Display students who are not graduating in 2026.
SELECT * 
FROM students 
WHERE NOT (graduation_year = 2026);

-- 14. Retrieve students who are not from either CSE or ISE. Use NOT with a grouped condition.
SELECT * 
FROM students 
WHERE NOT (branch = 'CSE' OR branch = 'ISE');

-- ============================================================
-- PRACTICE WITH MIXED CONDITIONS
-- ============================================================

-- 1. Display students from CSE or ISE who scored at least 80.
SELECT * 
FROM students 
WHERE (branch = 'CSE' OR branch = 'ISE') AND score >= 80;

-- 2. Retrieve students from CSE or ECE whose placement status is Placed.
SELECT * 
FROM students 
WHERE (branch = 'CSE' OR branch = 'ECE') AND placement_status = 'Placed';

-- 3. Display students who are placed or in progress and have attendance of at least 90%.
SELECT * 
FROM students 
WHERE (placement_status = 'Placed' OR placement_status = 'In Progress') 
  AND attendance_percentage >= 90;

-- 4. Retrieve CSE students who either scored at least 90 or have attendance of at least 95%.
SELECT * 
FROM students 
WHERE branch = 'CSE' AND (score >= 90 OR attendance_percentage >= 95);

-- 5. Display students graduating in 2026 who belong to CSE, ISE or ECE.
SELECT * 
FROM students 
WHERE graduation_year = 2026 AND (branch = 'CSE' OR branch = 'ISE' OR branch = 'ECE');

-- 6. Retrieve students who belong to CSE/ISE, score >= 80, and attendance >= 90%.
SELECT * 
FROM students 
WHERE (branch = 'CSE' OR branch = 'ISE') 
  AND score >= 80 
  AND attendance_percentage >= 90;

-- 7. Display students who are either from CSE (score >= 80) OR ECE (attendance >= 85%).
SELECT * 
FROM students 
WHERE (branch = 'CSE' AND score >= 80) 
   OR (branch = 'ECE' AND attendance_percentage >= 85);

-- 8. Create a placement report showing Student ID, Student Name, Branch, Score and Status for students who are placed and have a score of at least 80.
SELECT student_id, student_name, branch, score, placement_status 
FROM students 
WHERE placement_status = 'Placed' AND score >= 80;