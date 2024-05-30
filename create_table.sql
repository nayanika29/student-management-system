-- STUDENT MANAGEMENT SYSTEM

-- Create Database

create database student_management_system;

-- select database

use student_management_system;

-- create student table

CREATE TABLE student (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    dob DATE,
    city VARCHAR(20),
    email VARCHAR(30) UNIQUE,
    contact_number CHAR(10) UNIQUE,
    CHECK (LENGTH(contact_number) = 10)
);
-- create course table

CREATE TABLE course (
    course_id CHAR(4) PRIMARY KEY,
    course_name VARCHAR(40) UNIQUE,
    department VARCHAR(40),
    course_fees DECIMAL(10 , 2 ),
    course_duration INT
);

-- create batch table

CREATE TABLE batch (
    batch_id CHAR(4) PRIMARY KEY,
    batch_start_date DATETIME,
    batch_strength INT,
    course_id CHAR(4),
    FOREIGN KEY (course_id)
        REFERENCES course (course_id)
);

-- create enrollment table

CREATE TABLE enrollment (
    batch_id CHAR(4),
    student_id INT,
    enrollment_date DATE,
    PRIMARY KEY (batch_id , student_id),
    FOREIGN KEY (student_id)
        REFERENCES student (student_id),
    FOREIGN KEY (batch_id)
        REFERENCES batch (batch_id)
);

-- to view created tables

show tables;
