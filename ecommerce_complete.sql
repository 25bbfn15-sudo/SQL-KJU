CREATE DATABASE CollegeDB;

USE CollegeDB;

CREATE TABLE students
(
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    age INT,
    city VARCHAR(30),
    marks INT
);

INSERT INTO students (student_id, name, age, city, marks)
VALUES
(101, 'Aditya', 20, 'Pune', 82),
(102, 'Sneha', 21, 'Kochi', 91),
(103, 'Varun', 22, 'Chennai', 74);

SELECT * FROM students;

SELECT name, marks FROM students;

SELECT * FROM students WHERE age = 20;

SELECT * FROM students WHERE marks > 80;

UPDATE students SET marks = 95 WHERE student_id = 101;

DELETE FROM students WHERE student_id = 102;

SELECT * FROM students ORDER BY marks;

SELECT * FROM students ORDER BY marks DESC;

SELECT * FROM students LIMIT 3;

SELECT * FROM students ORDER BY marks DESC LIMIT 5;

SELECT * FROM students WHERE city = 'Pune' AND marks > 70;

SELECT * FROM students WHERE city = 'Pune' OR city = 'Chennai';

SELECT * FROM students WHERE city IN ('Pune', 'Kochi', 'Chennai');

SELECT * FROM students WHERE marks BETWEEN 70 AND 90;