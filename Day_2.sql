CREATE DATABASE day2_sql;
USE day2_sql;

CREATE TABLE departments (
department_id INT PRIMARY KEY,
department_name VARCHAR(100) NOT NULL,
location VARCHAR(100)
);

CREATE TABLE employees(
employee_id INT PRIMARY KEY,
employee_name VARCHAR(100) NOT NULL,
department_id INT,
salary DECIMAL(10,2),
hire_date DATE,
FOREIGN KEY(department_id)
REFERENCES departments(department_id)
);


INSERT INTO departments
(department_id,department_name,location)
VALUES
(1,'IT','Pune'),
(2,'HR','Mumbai'),
(3,'Finance','Pune'),
(4,'Marketing','Banglore'),
(5,'Sales','Delhi');


INSERT INTO employees
(employee_id,employee_name,department_id,salary,hire_date)
VALUES
(1,'Amit',1,90000,'2022-01-10'),
(2,'Rahul',1,70000,'2022-02-11'),
(3,'Priya',1,50000,'2023-04-6'),
(4,'Mitali',2,40000,'2026-06-21'),
(5,'Atharva',2,80000,'2026-07-27'),
(6,'Omkar',2,30000,'2021-02-4'),
(7,'Zaid',3,60000,'2022-06-11'),
(8,'Faiz',4,70000,'2024-08-4');




 

