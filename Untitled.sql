DROP DATABASE IF EXISTS student_db;
CREATE DATABASE student_db;
USE student_db;

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    city VARCHAR(50) DEFAULT 'Pune',
    birth_date DATE,
    admission_date DATE
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    fee DECIMAL(8,2) NOT NULL,
    credits INT NOT NULL
);

CREATE TABLE marks (
    marks_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    score DECIMAL(5,2) CHECK (score BETWEEN 0 AND 100),
    exam_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);

DESCRIBE students;

ALTER TABLE students ADD COLUMN gender VARCHAR(10);
ALTER TABLE students DROP COLUMN gender;

INSERT INTO students
(first_name, last_name, email, phone, city, birth_date, admission_date)
VALUES
('Aarav', 'Sharma', 'aarav@gmail.com', '9011183408', 'Pune', '2002-05-14', '2024-07-01'),
('Diya', 'Patil', 'diya@gmail.com', '8473984748', 'Mumbai', '2003-05-17', '2023-07-04'),
('Rohan', 'Deshmukh', 'rohan@gmail.com', '9876543210', 'Pune', '2002-08-21', '2024-07-01'),
('Priya', 'Kulkarni', 'priya@gmail.com', '9123456789', 'Nashik', '2003-02-11', '2024-07-05'),
('Aditya', 'Joshi', 'aditya@gmail.com', '9988776655', 'Bhopal', '2001-11-30', '2023-07-04'),
('Ananya', 'Patil', 'ananya@gmail.com', '9090909090', 'Pune', '2002-12-15', '2024-07-01'),
('Vikas', 'More', 'vikas@gmail.com', '8888888888', 'Mumbai', '2001-09-10', '2023-07-04'),
('Isha', 'Shinde', 'isha@gmail.com', NULL, 'Nashik', '2003-06-25', '2024-07-05'),
('Karan', 'Pawar', 'karan@gmail.com', '7777777777', 'Pune', '2002-03-18', '2024-07-01'),
('Sneha', 'Jadhav', 'sneha@gmail.com', '9666666666', 'Bhopal', '2003-10-05', '2023-07-04');

INSERT INTO courses
(course_name, credits, fee)
VALUES
('Java Programming', 4, 12000),
('Python', 3, 9000),
('Database Management', 4, 10000),
('Web Development', 5, 15000),
('Data Structures', 4, 11000),
('Machine Learning', 5, 18000);

INSERT INTO marks
(student_id, course_id, score, exam_date)
VALUES
(1, 1, 80, '2025-01-10'),
(1, 2, 76, '2025-01-12'),
(1, 3, 88, '2025-01-15'),
(2, 1, 92, '2025-01-10'),
(2, 2, 85, '2025-01-12'),
(2, 4, 90, '2025-01-18'),
(3, 1, 65, '2025-01-10'),
(3, 3, 72, '2025-01-15'),
(3, 5, 68, '2025-01-20'),
(4, 2, 95, '2025-01-12'),
(4, 3, 89, '2025-01-15'),
(4, 6, 91, '2025-01-22'),
(5, 1, 55, '2025-01-10'),
(5, 2, 62, '2025-01-12'),
(5, 5, 70, '2025-01-20'),
(6, 1, 87, '2025-01-10'),
(6, 4, 94, '2025-01-18'),
(6, 6, 96, '2025-01-22'),
(7, 2, 73, '2025-01-12'),
(7, 3, 81, '2025-01-15'),
(7, 5, 77, '2025-01-20'),
(8, 1, 68, '2025-01-10'),
(8, 4, 82, '2025-01-18'),
(8, 6, 75, '2025-01-22'),
(9, 1, 90, '2025-01-10'),
(9, 3, 86, '2025-01-15'),
(9, 5, 93, '2025-01-20'),
(10, 2, 58, '2025-01-12'),
(10, 4, 74, '2025-01-18'),
(10, 6, 79, '2025-01-22');

CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    class_date DATE NOT NULL,
    status VARCHAR(10) NOT NULL CHECK (status IN ('Present', 'Absent')),
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE
);
INSERT INTO attendance (student_id, class_date, status) VALUES
(1, '2025-02-01', 'Present'),
(1, '2025-02-02', 'Absent'),
(1, '2025-02-03', 'Present'),
(2, '2025-02-01', 'Present'),
(2, '2025-02-02', 'Present'),
(3, '2025-02-01', 'Absent'),
(3, '2025-02-02', 'Present'),
(4, '2025-02-01', 'Present'),
(5, '2025-02-01', 'Present'),
(5, '2025-02-02', 'Present');


UPDATE students
SET city = 'Bhopal'
WHERE student_id = 3;

UPDATE marks
SET score = score + 5
WHERE course_id = 2
AND student_id = 1;

SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM marks;

SELECT first_name, city FROM students;

SELECT first_name AS name, city AS hometown
FROM students;

SELECT DISTINCT city FROM students;

SELECT * FROM students
WHERE city = 'Pune';

SELECT * FROM students
WHERE city = 'Pune'
AND admission_date = '2024-07-01';

SELECT * FROM students
WHERE city = 'Pune'
OR city = 'Mumbai';

SELECT * FROM students
WHERE NOT city = 'Pune';

SELECT * FROM students
WHERE city IN ('Pune', 'Nashik');

SELECT * FROM marks
WHERE score BETWEEN 60 AND 80;

SELECT * FROM students
WHERE first_name LIKE 'A%';

SELECT * FROM students
WHERE first_name LIKE '%a';

SELECT * FROM students
WHERE first_name LIKE '_iya';

SELECT * FROM students
WHERE phone IS NULL;

SELECT * FROM students
WHERE phone IS NOT NULL;

SELECT * FROM marks
ORDER BY score DESC;

SELECT * FROM marks
ORDER BY score DESC
LIMIT 3;

SELECT * FROM students
ORDER BY city ASC, first_name ASC;

SELECT * FROM marks
WHERE score IS NULL;

SELECT * FROM courses
ORDER BY fee DESC
LIMIT 1;









SELECT * FROM students;
SELECT * FROM marks;
SELECT COUNT(*) FROM students;
SELECT AVG(score) FROM marks;
SELECT MAX(score),MIN(score) FROM marks;
SELECT SUM(fee) FROM courses;

SELECT COUNT(phone) FROM students;
SELECT COUNT(*) FROM students WHERE phone IS NULL;




SELECT student_id,COUNT(*) AS classes_attended
FROM attendance
WHERE status = 'Present'
GROUP BY student_id;

SELECT course_id, AVG(score) AS avg_score
FROM marks
GROUP BY course_id
HAVING AVG(score) < 80;



SELECT COUNT(*) AS has_phone FROM students WHERE phone IS NOT NULL;
SELECT COUNT(*) AS no_phone FROM students WHERE phone IS NULL;

SELECT  s.first_name,s.last_name,m.course_id,m.score
FROM students s
INNER JOIN marks m ON s.student_id = m.student_id;

SELECT s.first_name,s.last_name,m.score
FROM students s
INNER JOIN marks m ON s.student_id = m.student_id
ORDER BY m.score DESC
LIMIT 3;


SELECT s.first_name,c.course_name,m.score
FROM students s

INNER JOIN marks m ON s.student_id = m.student_id
INNER JOIN courses c ON m.course_id = c.course_id
ORDER BY s.first_name;






