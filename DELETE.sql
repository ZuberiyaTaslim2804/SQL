CREATE DATABASE IF NOT EXISTS student_cleanup_lab;

USE student_cleanup_lab;

SET SQL_SAFE_UPDATES = 0;

DROP TABLE IF EXISTS students;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    branch VARCHAR(30) NOT NULL,
    account_type VARCHAR(20) NOT NULL,
    registration_status VARCHAR(20) NOT NULL,
    registered_on DATE NOT NULL
);

INSERT INTO students
VALUES
    (101, 'Asha', 'CSE', 'Student', 'Active', '2026-06-10'),
    (102, 'Meera', 'ISE', 'Student', 'Placed', '2026-05-20'),
    (103, 'Zoya', 'CSE', 'Student', 'Withdrawn', '2025-11-15'),
    (104, 'Arjun', 'Mechanical', 'Student', 'Withdrawn', '2026-07-05'),
    (105, 'Sara', 'CSE', 'Student', 'Inactive', '2025-09-10'),
    (106, 'Test User', 'ECE', 'Test', 'Inactive', '2026-08-01');

-- 1. Display All Students
SELECT * FROM students;

-- 2. Count the Records
SELECT COUNT(*) FROM students;

-- 3. Delete Test Accounts
SELECT * FROM students WHERE account_type = 'Test';
DELETE FROM students WHERE account_type = 'Test';
SELECT * FROM students;

-- 4. Delete Old Withdrawn Registrations
DELETE FROM students 
WHERE registration_status = 'Withdrawn' 
  AND registered_on < '2026-01-01';

-- 5. Delete Old Inactive Students
DELETE FROM students 
WHERE account_type = 'Student' 
  AND registration_status = 'Inactive' 
  AND registered_on < '2026-01-01';

-- 6. Test a Condition That Matches Nothing
DELETE FROM students 
WHERE account_type = 'Test' 
  AND registration_status = 'Active';
-- Affected rows: 0. Result explanation: No record matches both conditions simultaneously.

-- 7. Protect a Recent Withdrawn Student
DELETE FROM students 
WHERE student_id = 104 
  AND registered_on < '2026-01-01';
SELECT * FROM students WHERE student_id = 104;

-- 8. Protect a Placed Student
DELETE FROM students 
WHERE student_id = 102 
  AND registration_status = 'Withdrawn';
SELECT * FROM students WHERE student_id = 102;

-- 9. Delete a Missing Student
DELETE FROM students WHERE student_id = 999;
-- Affected rows: 0. Result explanation: Student 999 does not exist in the table.

-- 10. Display the Remaining Students
SELECT * FROM students;

-- 11. Count the Remaining Records
SELECT COUNT(*) FROM students;

-- 12. Check Protected Records
SELECT * FROM students 
WHERE registration_status IN ('Active', 'Placed');

-- 13. Investigate a Broad Condition
SELECT * FROM students WHERE registration_status = 'Withdrawn';
-- Explanation: Deleting all withdrawn records would delete recent withdrawals like Student 104 (registered 2026-07-05), violating retention rules.

-- 14. Investigate DELETE Without WHERE
-- Answer:
-- - It would delete 3 remaining rows.
-- - Yes, the table structure remains intact.
-- - It is unsafe because it removes all data indiscriminately without a filter condition.

-- 15. Delete or Update?
-- Answer:
-- - No, DELETE should not be used.
-- - UPDATE should be used instead.
-- - The registration_status column should be changed to 'Inactive' or 'Withdrawn'.

