use student_management_system;

-- Queries

-- 1.Display the full names of students in a single row

SELECT CONCAT(first_name, ' ', last_name) AS student_name
FROM student;

-- 2.Display all students whose names start with 'S' and have a length between 5 and 20 characters

SELECT first_name
FROM student
WHERE first_name LIKE 'S%' 
  AND LENGTH(first_name) BETWEEN 5 AND 20;
 
 -- 3.Display the students who are above the age of 24
 
SELECT first_name,TIMESTAMPDIFF(YEAR, dob, CURDATE()) AS age
FROM student
HAVING age > 24;

-- 4.Display students born after June 1st, 2000

SELECT first_name, dob
FROM student
WHERE dob > '2000-06-01';

-- 5.Display the names of students who have provided invalid phone numbers or have not provided a phone number

SELECT first_name, contact_number
FROM student
WHERE contact_number IS NULL
   OR contact_number LIKE '0%'
   OR LENGTH(contact_number) > 11;

-- 6.Display the names of students who have an invalid email address

SELECT first_name, email
FROM student
WHERE email NOT LIKE '%@%.com'
   OR email IS NULL; 

-- 7.Display the students who have a Gmail account

SELECT first_name, email
FROM student
WHERE email LIKE '%gmail%'; 

-- 8.Display the city names with the student counts in each city

SELECT city, COUNT(first_name) AS total_student
FROM student
GROUP BY city;

-- 9.Display the month names with the student counts for each month of birth

SELECT MONTHNAME(dob) AS Month, COUNT(first_name) AS total_student
FROM student
GROUP BY Month;

-- 10.Display the student name that was born in a leap year order by student name and year of birth

SELECT first_name, YEAR(dob) AS birth_year
FROM student
WHERE YEAR(dob) % 4 = 0
   OR YEAR(dob) % 400 = 0
  AND YEAR(dob) % 100 != 0
ORDER BY first_name AND birth_year;

-- 11.Display students whose city is New York as 'HomeStudent' and others as 'DistanceStudent' under a column named 'Remarks'

SELECT first_name,city,
CASE
	WHEN city = 'New York' THEN 'Home_Student'
	ElSE 'Distance_Student'
END AS Remarks
FROM Student;

-- 12.Display batch ID, course name, batch start date, and batch end date for all batches
 
SELECT a.batch_id,b.course_name,a.batch_start_date,DATE_ADD(batch_start_date,INTERVAL course_duration DAY) AS batch_end_date
FROM batch a,course b
WHERE a.course_id = b.course_id;
 
 -- 13.Display all batch IDs where the difference between the batch start date and end date is 10 hours or less

SELECT a.batch_id, TIMESTAMPDIFF(HOUR, a.batch_start_date, DATE_ADD(a.batch_start_date, INTERVAL b.course_duration DAY)) AS datediff
FROM batch a INNER JOIN course b 
  ON a.course_id = b.course_id
WHERE TIMESTAMPDIFF(HOUR, a.batch_start_date, DATE_ADD(a.batch_start_date, INTERVAL b.course_duration DAY)) <= 10;

-- 14.Display all batches with the same start date and the same number of students

SELECT a.batch_id, a.batch_start_date, a.batch_strength
FROM batch a INNER JOIN batch b 
  ON a.batch_start_date = b.batch_start_date
 AND a.batch_strength = b.batch_strength
 AND a.batch_id <> b.batch_id;






