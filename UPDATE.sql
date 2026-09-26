-- UPDATING STUDENT RECORDS
-- ======================================================
-- Setup Script
-- ======================================================
CREATE DATABASE IF NOT EXISTS student_update_lab;

USE student_update_lab;

DROP TABLE IF EXISTS students;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(60) NOT NULL,
    branch VARCHAR(30) NOT NULL,
    aptitude_score INT NOT NULL
        CHECK (aptitude_score BETWEEN 0 AND 100),
    coding_score INT NOT NULL
        CHECK (coding_score BETWEEN 0 AND 100),
    placement_status VARCHAR(20) NOT NULL DEFAULT 'Not Placed'
        CHECK (
            placement_status IN (
                'Not Placed',
                'Placed',
                'Not Eligible'
            )
        ),
    company_name VARCHAR(60),
    package_lpa DECIMAL(4, 1),
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    last_updated_at TIMESTAMP NULL
);

INSERT INTO students (
    student_id,
    student_name,
    branch,
    aptitude_score,
    coding_score,
    placement_status,
    company_name,
    package_lpa
)
VALUES
    (101, 'Asha Patil', 'CSE', 78, 72, 'Not Placed', NULL, NULL),
    (102, 'Ravi Kumar', 'ECE', 65, 68, 'Not Placed', NULL, NULL),
    (103, 'Meera Shah', 'ISE', 88, 91, 'Not Placed', NULL, NULL),
    (104, 'Zoya Khan', 'CSE', 52, 55, 'Not Placed', NULL, NULL),
    (105, 'Arjun Rao', 'Mechanical', 70, 76, 'Not Placed', NULL, NULL),
    (106, 'Sara Ali', 'CSE', 90, 88, 'Placed', 'TechNova', 8.5),
    (107, 'Kabir Singh', 'ECE', 58, 61, 'Not Placed', NULL, NULL),
    (108, 'Neha Joshi', 'ISE', 82, 79, 'Not Placed', NULL, NULL);


-- ======================================================
-- Task Solutions
-- ======================================================

-- 1. Display All Students
SELECT * FROM students;


-- 2. Correct Asha's Aptitude Score
SELECT * FROM students WHERE student_id = 101;

UPDATE students
SET aptitude_score = 84
WHERE student_id = 101;

SELECT * FROM students WHERE student_id = 101;


-- 3. Correct Ravi's Coding Score
SELECT * FROM students WHERE student_id = 102;

UPDATE students
SET coding_score = 74
WHERE student_id = 102;

SELECT * FROM students WHERE student_id = 102;


-- 4. Add Marks to Zoya
SELECT * FROM students WHERE student_id = 104;

UPDATE students
SET coding_score = coding_score + 3
WHERE student_id = 104;

SELECT * FROM students WHERE student_id = 104;


-- 5. Add Marks to Kabir
SELECT * FROM students WHERE student_id = 107;

UPDATE students
SET coding_score = coding_score + 5
WHERE student_id = 107;

SELECT * FROM students WHERE student_id = 107;


-- 6. Record Meera's Placement
SELECT * FROM students WHERE student_id = 103;

UPDATE students
SET placement_status = 'Placed',
    company_name = 'CodeWorks',
    package_lpa = 12.5,
    last_updated_at = CURRENT_TIMESTAMP
WHERE student_id = 103;

SELECT * FROM students WHERE student_id = 103;


-- 7. Record Arjun's Placement
SELECT * FROM students WHERE student_id = 105;

UPDATE students
SET placement_status = 'Placed',
    company_name = 'AutoTech',
    package_lpa = 7.0,
    last_updated_at = CURRENT_TIMESTAMP
WHERE student_id = 105;

SELECT * FROM students WHERE student_id = 105;


-- 8. Correct Sara's Package
SELECT * FROM students WHERE student_id = 106;

UPDATE students
SET package_lpa = 9.0
WHERE student_id = 106;

SELECT * FROM students WHERE student_id = 106;


-- 9. Mark Students as Not Eligible
SELECT * FROM students WHERE aptitude_score < 60 AND coding_score < 60;

UPDATE students
SET placement_status = 'Not Eligible',
    company_name = NULL,
    package_lpa = NULL,
    last_updated_at = CURRENT_TIMESTAMP
WHERE aptitude_score < 60 AND coding_score < 60;

SELECT * FROM students WHERE aptitude_score < 60 AND coding_score < 60;


-- 10. Deactivate Kabir
SELECT * FROM students WHERE student_id = 107;

UPDATE students
SET is_active = FALSE,
    last_updated_at = CURRENT_TIMESTAMP
WHERE student_id = 107;

SELECT * FROM students WHERE student_id = 107;


-- 11. Update Active ECE Students
SELECT * FROM students WHERE branch = 'ECE' AND is_active = TRUE;

UPDATE students
SET aptitude_score = aptitude_score + 2,
    last_updated_at = CURRENT_TIMESTAMP
WHERE branch = 'ECE' AND is_active = TRUE;

SELECT * FROM students WHERE branch = 'ECE' AND is_active = TRUE;


-- 12. Deactivate Not-Eligible Students
SELECT * FROM students WHERE placement_status = 'Not Eligible';

UPDATE students
SET is_active = FALSE,
    last_updated_at = CURRENT_TIMESTAMP
WHERE placement_status = 'Not Eligible';

SELECT * FROM students WHERE placement_status = 'Not Eligible';


-- 13. Update ISE Students' Coding Scores
SELECT * FROM students WHERE branch = 'ISE' AND is_active = TRUE AND placement_status = 'Not Placed';

UPDATE students
SET coding_score = coding_score + 2,
    last_updated_at = CURRENT_TIMESTAMP
WHERE branch = 'ISE' AND is_active = TRUE AND placement_status = 'Not Placed';

SELECT * FROM students WHERE branch = 'ISE' AND is_active = TRUE AND placement_status = 'Not Placed';


-- 14. Protect an Existing Placement
SELECT * FROM students WHERE student_id = 103;

UPDATE students
SET company_name = 'NextGen'
WHERE student_id = 103 AND placement_status = 'Not Placed';

-- Explanation: The affected-row count is 0 because Student 103's placement_status is 'Placed' 
-- (updated in Task 6). Since the WHERE condition `placement_status = 'Not Placed'` fails, 
-- no row matches the condition and the company remains 'CodeWorks'.

SELECT * FROM students WHERE student_id = 103;


-- 15. Test the Score Constraint
SELECT * FROM students WHERE student_id = 102;

UPDATE students
SET coding_score = 120
WHERE student_id = 102;

-- Explanation: This UPDATE query fails and is rejected due to a CHECK constraint 
-- violation (`CHECK (coding_score BETWEEN 0 AND 100)`). The value stays at its previous valid score.

SELECT * FROM students WHERE student_id = 102;


-- Final Check
SELECT * FROM students;