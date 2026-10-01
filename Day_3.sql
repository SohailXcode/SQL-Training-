

CREATE DATABASE normalization_demo;
USE normalization_demo;

-- 1. Teachers Table
CREATE TABLE teachers (
    teacher_id INT PRIMARY KEY,
    teacher_name VARCHAR(50) NOT NULL,
    teacher_phone VARCHAR(15)
);

-- Insert teachers only once
INSERT INTO teachers VALUES
(1, 'Amit', '9876543210'),
(2, 'Neha', '9123456780');


-- 2. Students Table
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL
);

INSERT INTO students VALUES
(1, 'Rahul'),
(2, 'Priya'),
(3, 'Sameer'),
(4, 'Anjali');


-- 3. Courses Table
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50) NOT NULL,
    teacher_id INT,

    FOREIGN KEY (teacher_id)
    REFERENCES teachers(teacher_id)
);

INSERT INTO courses VALUES
(101, 'Java', 1),
(102, 'Python', 2);


-- 4. Enrollment Table
CREATE TABLE enrollments (
    student_id INT,
    course_id INT,

    PRIMARY KEY (student_id, course_id),

    FOREIGN KEY (student_id)
    REFERENCES students(student_id),

    FOREIGN KEY (course_id)
    REFERENCES courses(course_id)
);


-- 5. Students enroll in courses
INSERT INTO enrollments VALUES
(1, 101), -- Rahul → Java
(2, 101), -- Priya → Java
(3, 101), -- Sameer → Java
(4, 102); -- Anjali → Python


-- 6. See the data
SELECT * FROM teachers;

SELECT * FROM students;

SELECT * FROM courses;

SELECT * FROM enrollments;


-- 7. Get complete information using JOIN
SELECT
    s.student_id,
    s.student_name,
    c.course_name,
    t.teacher_name,
    t.teacher_phone
FROM enrollments e
JOIN students s
    ON e.student_id = s.student_id
JOIN courses c
    ON e.course_id = c.course_id
JOIN teachers t
    ON c.teacher_id = t.teacher_id;