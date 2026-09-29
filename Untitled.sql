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

INSERT INTO students (first_name, last_name, email, phone, city, birth_date, admission_date)
VALUES
('Aarav', 'Sharma', 'aarav@gmail.com', '9011183408', 'Pune', '2002-05-14', '2024-07-01'),
('Diya', 'Patil', 'diya@gmail.com', '8473984748', 'Mumbai', '2003-05-17', '2023-07-04');

INSERT INTO courses (course_name, credits, fee)
VALUES
('Java Programming', 4, 12000),
('Python', 3, 9000);

INSERT INTO marks (student_id,course_id,score,exam_date)
VALUES
(1, 1, 80, '2025-01-10'),
(1, 2, 76, '2025-01-12');

UPDATE students SET city = 'Bhopal' WHERE student_id = 3;
UPDATE marks SET score = score + 5 WHERE course_id = 25;

SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM marks;





SELECT * FROM students;
SELECT first_name, city FROM students;
SELECT first_name AS name, city AS hometown FROM students;
SELECT DISTINCT city FROM students;
SELECT * FROM students WHERE city = 'Pune';
SELECT * FROM students WHERE city = 'Pune' AND admission_date = '2024-07-01';
SELECT * FROM students WHERE city = 'Pune' OR city = 'Mumbai';
SELECT * FROM students WHERE NOT city = 'Pune';
SELECT * FROM students WHERE city IN ('Pune','Nashik');
SELECT * FROM marks WHERE score BETWEEN 60 AND 80;
SELECT * FROM students WHERE first_name LIKE 'A%';
SELECT * FROM students WHERE first_name LIKE '%a';
SELECT * FROM students WHERE first_name LIKE '_iya';
SELECT * FROM students WHERE phone IS NULL;
SELECT * FROM students WHERE phone IS NOT NULL;
SELECT * FROM marks ORDER BY score DESC;
SELECT * FROM marks ORDER BY score DESC LIMIT 3;
SELECT * FROM students ORDER BY city ASC, first_name ASC;
SELECT * FROM marks WHERE score IS NULL;
SELECT * FROM courses ORDER BY fee DESC LIMIT 1;















