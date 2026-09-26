-- INSERT student records

-- Setup Script
CREATE DATABASE IF NOT EXISTS student_registration_lab;

USE student_registration_lab;

DROP TABLE IF EXISTS students;

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    registration_number CHAR(10) NOT NULL UNIQUE,
    student_name VARCHAR(60) NOT NULL,
    branch VARCHAR(30) NOT NULL,
    cgpa DECIMAL(4, 2)
        CHECK (cgpa >= 0 AND cgpa <= 10),
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(15),
    placement_status VARCHAR(20)
        NOT NULL
        DEFAULT 'Not Placed',
    is_active BOOLEAN
        NOT NULL
        DEFAULT TRUE,
    registered_at TIMESTAMP
        DEFAULT CURRENT_TIMESTAMP
);


-- Initial Check
USE student_registration_lab;

DESCRIBE students;


-- Student 1: Complete Registration
INSERT INTO students (
    registration_number,
    student_name,
    branch,
    cgpa,
    email,
    phone_number,
    placement_status
) VALUES (
    'KN20260001',
    'Asha Patil',
    'CSE',
    8.45,
    'asha@gmail.com',
    '9876543210',
    'Placed'
);

SELECT * FROM students;


-- Student 2: Optional Phone Number Missing
INSERT INTO students (
    registration_number,
    student_name,
    branch,
    cgpa,
    email,
    phone_number,
    placement_status
) VALUES (
    'KN20260002',
    'Ravi Kumar',
    'ECE',
    7.80,
    'ravi@gmail.com',
    NULL,
    'Not Placed'
);

SELECT * FROM students;


-- Student 3: Use the Default Placement Status
INSERT INTO students (
    registration_number,
    student_name,
    branch,
    cgpa,
    email,
    phone_number
) VALUES (
    'KN20260003',
    'Meera Shah',
    'ISE',
    9.10,
    'meera@gmail.com',
    '9123456780'
);

SELECT * FROM students;


-- Student 4: CGPA Not Yet Available
INSERT INTO students (
    registration_number,
    student_name,
    branch,
    cgpa,
    email,
    phone_number,
    placement_status
) VALUES (
    'KN20260004',
    'Zoya Khan',
    'CSE',
    NULL,
    'zoya@gmail.com',
    '9988776655',
    'Not Eligible'
);

SELECT * FROM students;


-- Student 5: Use DEFAULT Explicitly
INSERT INTO students (
    registration_number,
    student_name,
    branch,
    cgpa,
    email,
    phone_number,
    placement_status,
    is_active
) VALUES (
    'KN20260005',
    'Arjun Rao',
    'Mechanical',
    6.95,
    'arjun@gmail.com',
    '9012345678',
    DEFAULT,
    DEFAULT
);

SELECT * FROM students;


-- ======================================================
-- Constraint Tests (Run individually to confirm rejection)
-- ======================================================

-- Test 1: Duplicate Registration Number (Should fail: UNIQUE constraint violation)
INSERT INTO students (
    registration_number,
    student_name,
    branch,
    cgpa,
    email,
    phone_number
) VALUES (
    'KN20260001',
    'New Student',
    'CSE',
    8.00,
    'new1@gmail.com',
    '9000000001'
);

-- Test 2: Duplicate Email (Should fail: UNIQUE constraint violation)
INSERT INTO students (
    registration_number,
    student_name,
    branch,
    cgpa,
    email,
    phone_number
) VALUES (
    'KN20260006',
    'New Student',
    'CSE',
    8.00,
    'asha@gmail.com',
    '9000000002'
);

-- Test 3: Missing Student Name (Should fail: NOT NULL constraint violation)
INSERT INTO students (
    registration_number,
    branch,
    cgpa,
    email,
    phone_number
) VALUES (
    'KN20260007',
    'CSE',
    8.00,
    'new3@gmail.com',
    '9000000003'
);

-- Test 4: Invalid CGPA (Should fail: CHECK constraint violation)
INSERT INTO students (
    registration_number,
    student_name,
    branch,
    cgpa,
    email,
    phone_number
) VALUES (
    'KN20260008',
    'New Student',
    'CSE',
    12.00,
    'new4@gmail.com',
    '9000000004'
);