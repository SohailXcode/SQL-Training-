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
INSERT INTO employees (employee_id, employee_name, department_id, salary, hire_date) VALUES 
(9, 'Rohan', 3, 65000, '2023-01-15'),
(10, 'Sneha', 1, 75000, '2024-05-20'),
(11, 'Vikram', 4, 85000, '2021-11-12'),
(12, 'Ananya', 2, 45000, '2025-03-01'),
(13, 'Karan', 3, 55000, '2022-09-10'),
(14, 'Meera', 4, 95000, '2020-08-25');
INSERT INTO employees (employee_id, employee_name, department_id, salary, hire_date) VALUES 
(15, 'Aditya', 1, 60000, '2023-07-14'),
(16, 'Neha', 2, 72000, '2024-02-28'),
(17, 'Sameer', 3, 48000, '2022-11-05'),
(18, 'Pooja', 4, 82000, '2021-04-19'),
(19, 'Gaurav', 1, 53000, '2025-01-10'),
(20, 'Divya', 2, 67000, '2023-09-30');


SELECT employee_name,salary
FROM employees
WHERE salary > (
SELECT AVG(salary)
FROM employees
);


SELECT
    employee_name,
    department_id,
    salary
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE location = 'Pune'
);


SELECT e.employee_name,e.salary,e.department_id
FROM employees e
WHERE e.salary>(
SELECT AVG(e2.salary)
FROM employees e2
WHERE e2.department_id = e.department_id
);

SELECT d.department_id, d.department_name
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
);


SELECT d.department_id, d.department_name
FROM departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
);



SELECT department_name AS name
FROM departments
UNION
SELECT employee_name AS name
FROM employees;


SELECT department_name AS name
FROM departments
UNION ALL
SELECT employee_name AS name
FROM employees;





SELECT employee_name,
salary,
AVG(salary)OVER() AS company_avg_salary
FROM employees;

SELECT employee_name,
department_id,
salary,
ROW_NUMBER()OVER(
PARTITION BY department_id
ORDER BY salary DESC
)AS row_num
FROM employees;


SELECT employee_name,
salary,
RANK()OVER(
ORDER BY salary DESC
) AS salary_rank
FROM employees;



SELECT employee_name,
salary,
DENSE_RANK()OVER(
ORDER BY salary DESC
) AS salary_rank
FROM employees;


WITH ranked_employees AS (
SELECT employee_name,
department_id,
salary,
DENSE_RANK() OVER (
PARTITION BY department_id
ORDER BY salary DESC
) AS rnk
FROM employees
)
SELECT *
FROM ranked_employees
WHERE rnk <= 3;

SELECT employee_name,
salary,
LAG(salary) OVER(
ORDER BY salary DESC
)AS previous_salary
FROM employees;



SELECT employee_name,
salary,
SUM(salary) OVER(
ORDER BY employee_id
ROWS BETWEEN UNBOUNDED PRECEDING
AND CURRENT ROW )
AS running_total_salary
FROM employees;



WITH department_avg AS (
    SELECT
        department_id,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT
    e.employee_name,
    e.salary,
    d.avg_salary
FROM employees e
JOIN department_avg d
    ON e.department_id = d.department_id
WHERE e.salary > d.avg_salary;

WITH department_avg AS (
    SELECT
        department_id,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
),

employee_rank AS (
    SELECT
        employee_id,
        employee_name,
        department_id,
        salary,
        RANK() OVER (
            PARTITION BY department_id
            ORDER BY salary DESC
        ) AS salary_rank
    FROM employees
)

SELECT
    employee_id,
    employee_name,
    department_id,
    salary,
    salary_rank
FROM employee_rank
WHERE salary_rank <= 3;



 

