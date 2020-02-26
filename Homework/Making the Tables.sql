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
