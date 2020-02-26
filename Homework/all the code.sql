CREATE TABLE departments (
    dept_no VARCHAR(4) NOT NULL,
    dept_name VARCHAR(30) NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY ("dept_no")
);
select * from departments
-- drop table departments

-- EMPLOYEES TABLE
CREATE TABLE employees (
    emp_no INT NOT NULL,
	birth_date VARCHAR (10) NOT NULL,
	first_name VARCHAR (30),
	last_name VARCHAR (30),
	gender VARCHAR (1),
	hire_date VARCHAR (30),
	CONSTRAINT "pk_Employees" PRIMARY KEY ("emp_no")
);
select * from employees
-- drop table employees

--DEPARTMENT MANAGER TABLE
CREATE TABLE dept_manager (
    dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date VARCHAR(30) NOT NULL,
    to_date VARCHAR(30) NOT NULL
);
select * from dept_manager
-- drop table dept_manager

--SALARIES TABLE
CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	from_date VARCHAR (30),
	to_date VARCHAR (30)	
);
select * from salaries 
-- drop table salaries

-- TITLES TABLE 
CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR (30) NOT NULL,
	from_date VARCHAR (30),
	to_date VARCHAR (30)
);
select * from titles
-- drop table title


-- DEPARTMENT EMPLOYEE TABLE 
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR (10) NOT NULL,
	from_date VARCHAR (30),
	to_date VARCHAR (30)	
); 
select * from dept_emp 
-- drop table dept_emp

-- CREATE A JOIN ON EMPLOYEES 
-- List employee number, last name, first name, gender, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees JOIN salaries 
ON employees.emp_no = salaries.emp_no; 

--List employees who were hired in 1986.
SELECT hire_date FROM employees
WHERE EXTRACT (year from hire_date) = '1986'; 

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, 
-- last name, first name, and start and end employment dates.
SELECT dept_manager.dept_no,dept_name,
dept_manager.emp_no,first_name,last_name,
dept_manager.from_date,
dept_manager.to_date
FROM dept_manager
LEFT JOIN departments on dept_manager.dept_no = departments.dept_no
LEFT JOIN employees on dept_manager.emp_no = employees.emp_no

-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name
SELECT
employees.emp_no, 
first_name, 
last_name,
dept_name
FROM employees
LEFT JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
LEFT JOIN departments
ON dept_emp.dept_no = departments.dept_no;

select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries;
select* from titles;

-- List all employees whose first name is "Hercules" and last names begin with "B."

SELECT * FROM employees
WHERE(first_name LIKE 'Hercules' AND last_name LIKE '%B%');

-- List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.
Select
employees.emp_no, 
first_name, 
last_name,
dept_name
FROM employees
LEFT JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
LEFT JOIN departments
ON dept_emp.dept_no = departments.dept_no 
WHERE departments.dept_name lIKE 'Sales';


-- List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
Select
employees.emp_no, 
first_name, 
last_name,
dept_name
FROM employees
LEFT JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
LEFT JOIN departments
ON dept_emp.dept_no = departments.dept_no 
WHERE departments.dept_name lIKE 'Sales'
OR departments.dept_name LIKE  'Development';

--In descending order, list the frequency count of employee last names, i.e.,
--how many employees share each last name.
SELECT
last_name,
COUNT(last_name) AS "last_name_count"
from employees
GROUP BY
last_name
ORDER BY last_name_count DESC;
