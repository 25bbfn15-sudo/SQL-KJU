CREATE DATABASE HRSalaryLab;
USE HRSalaryLab;

CREATE TABLE departments (
    dept_id    INT           AUTO_INCREMENT PRIMARY KEY,
    dept_name  VARCHAR(50)   NOT NULL UNIQUE,
    location   VARCHAR(50)   NOT NULL
);

CREATE TABLE employees (
    emp_id              INT            AUTO_INCREMENT PRIMARY KEY,
    emp_name            VARCHAR(80)    NOT NULL,
    dept_id             INT            NOT NULL,
    job_title           VARCHAR(60)    NOT NULL,
    employment_type     VARCHAR(15)    NOT NULL,
    hire_date           DATE           NOT NULL,
    salary              DECIMAL(10,2)  NOT NULL,
    performance_rating  DECIMAL(2,1)   NULL,
    status              VARCHAR(15)    NOT NULL DEFAULT 'Active',
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE salary_payments (
    payment_id   INT            AUTO_INCREMENT PRIMARY KEY,
    emp_id       INT            NOT NULL,
    pay_month    DATE           NOT NULL,
    basic_pay    DECIMAL(10,2)  NOT NULL,
    bonus        DECIMAL(10,2)  NOT NULL DEFAULT 0,
    deductions   DECIMAL(10,2)  NOT NULL DEFAULT 0,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

CREATE TABLE leave_records (
    leave_id    INT          AUTO_INCREMENT PRIMARY KEY,
    emp_id      INT          NOT NULL,
    leave_type  VARCHAR(15)  NOT NULL,
    start_date  DATE         NOT NULL,
    days        INT          NOT NULL,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO departments (dept_name, location) VALUES
('Human Resources',         'Chennai'),
('Finance',                 'Bengaluru'),
('Information Technology', 'Hyderabad'),
('Marketing',               'Mumbai'),
('Operations',              'Pune'),
('Legal',                   'Delhi'); -- no employees yet (useful for LEFT JOIN)

INSERT INTO employees (emp_name, dept_id, job_title, employment_type, hire_date, salary, performance_rating, status) VALUES
('Amit Nair',       1, 'HR Manager',            'Full-time', '2019-02-11',  98000, 4.6, 'Active'),
('Divya Menon',     1, 'HR Executive',          'Full-time', '2022-09-12',  45000, 4.1, 'Active'),
('Sanjana Rao',     1, 'HR Executive',          'Full-time', '2026-07-15',  41500, NULL, 'Active'),
('Vikram Shah',     1, 'Recruiter',             'Contract',  '2025-03-18',  39500, 3.9, 'Active'),
('Mehul Patel',     2, 'Finance Manager',       'Full-time', '2018-05-21', 101000, 4.5, 'Active'),
('Anjali Das',      2, 'Accountant',            'Full-time', '2021-04-19',  51000, 4.0, 'Active'),
('Rohit Kulkarni',  2, 'Financial Analyst',     'Full-time', '2020-12-14',  68000, 4.3, 'Active'),
('Sneha Iyer',      2, 'Accountant',            'Full-time', '2023-06-26',  48500, 3.7, 'Active'),
('Kiran Reddy',     3, 'IT Manager',            'Full-time', '2017-03-13', 128000, 4.8, 'Active'),
('Aditya Bose',     3, 'Software Engineer',     'Full-time', '2021-09-06',  85000, 4.5, 'Active'),
('Nisha Thomas',    3, 'Software Engineer',     'Full-time', '2022-02-21',  79000, 4.2, 'Active'),
('Varun Gupta',     3, 'Data Analyst',          'Full-time', '2023-07-10',  72000, 4.1, 'Active'),
('Sahil Kapoor',    3, 'Software Engineer',     'Contract',  '2025-10-06',  73500, NULL, 'Active'),
('Maya Krishnan',   3, 'QA Engineer',           'Full-time', '2024-04-15',  61000, 3.8, 'Active'),
('Rhea Malhotra',   4, 'Marketing Manager',     'Full-time', '2020-01-20',  96000, 4.4, 'Active'),
('Kabir Sood',      4, 'Digital Marketer',      'Full-time', '2022-11-14',  57000, 4.1, 'Active'),
('Zoya Fernandes',  4, 'Brand Executive',       'Full-time', '2023-03-20',  49500, 3.7, 'Resigned'),
('Pranav Shetty',   5, 'Operations Manager',    'Full-time', '2019-01-07',  93000, 4.5, 'Active'),
('Ayesha Khan',     5, 'Logistics Coordinator', 'Full-time', '2022-01-17',  46500, 3.9, 'Active'),
('Nitin Chawla',    5, 'Supply Chain Analyst',  'Full-time', '2020-07-13',  63000, 4.2, 'Active'),
('Faiz Ahmed',      5, 'Warehouse Supervisor',  'Contract',  '2025-11-17',  38500, NULL, 'Active');

INSERT INTO leave_records (emp_id, leave_type, start_date, days) VALUES
(1,  'Earned', '2026-07-08', 2),
(2,  'Casual', '2026-07-16', 2),
(2,  'Sick',   '2026-08-22', 1),
(6,  'Casual', '2026-07-23', 1),
(6,  'Earned', '2026-09-09', 4),
(7,  'Earned', '2026-09-23', 5),
(9,  'Casual', '2026-08-01', 1),
(10, 'Sick',   '2026-08-06', 3),
(10, 'Casual', '2026-09-20', 1),
(11, 'Earned', '2026-07-29', 3),
(12, 'Casual', '2026-08-14', 1),
(14, 'Sick',   '2026-09-04', 2),
(15, 'Sick',   '2026-08-19', 1),
(16, 'Casual', '2026-07-11', 1),
(16, 'Earned', '2026-08-26', 2),
(18, 'Casual', '2026-09-26', 1),
(19, 'Sick',   '2026-09-13', 3),
(20, 'Casual', '2026-08-30', 1);

SELECT (SELECT COUNT(*) FROM departments)     AS departments,
       (SELECT COUNT(*) FROM employees)       AS employees,
       (SELECT COUNT(*) FROM salary_payments) AS payments,
       (SELECT COUNT(*) FROM leave_records)   AS leaves;

SELECT COUNT(*) AS total_employees FROM employees;

SELECT COUNT(*) AS active_employees FROM employees WHERE status = 'Active';

SELECT COUNT(*)                   AS all_employees,
       COUNT(performance_rating)  AS employees_with_a_rating
FROM   employees;

SELECT COUNT(DISTINCT job_title) AS different_job_titles,
       COUNT(DISTINCT dept_id)   AS departments_with_staff
FROM   employees;

SELECT SUM(salary) AS monthly_salary_bill FROM employees WHERE status = 'Active';

SELECT ROUND(AVG(salary), 2) AS average_salary FROM employees WHERE status = 'Active';

SELECT MIN(salary) AS lowest_salary, MAX(salary) AS highest_salary
FROM   employees
WHERE  status = 'Active';

SELECT COUNT(*)                AS headcount,
       SUM(salary)             AS total_salary,
       ROUND(AVG(salary), 2)   AS average_salary,
       MIN(salary)             AS lowest_salary,
       MAX(salary)             AS highest_salary
FROM   employees
WHERE  status = 'Active';

SELECT SUM(salary)       AS monthly_payroll,
       SUM(salary) * 12  AS yearly_payroll
FROM   employees
WHERE  status = 'Active';

SELECT ROUND(AVG(performance_rating), 2)             AS avg_rating_ignoring_null,
       ROUND(SUM(performance_rating) / COUNT(*), 2)  AS sum_divided_by_all_rows
FROM   employees;

SELECT MIN(hire_date) AS first_joiner_date,
       MAX(hire_date) AS latest_joiner_date,
       MIN(emp_name)  AS first_name_alphabetically,
       MAX(emp_name)  AS last_name_alphabetically
FROM   employees;

SELECT emp_name, job_title, salary
FROM   employees
WHERE  salary = (SELECT MAX(salary) FROM employees WHERE status = 'Active');
