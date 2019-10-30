--Employee info and Salary
SELECT employees.emp_no, 
employees.last_name, 
employees.first_name, 
employees.gender,
salaries.salary
FROM employees
INNER JOIN salaries on employees.emp_no = salaries.emp_no;

--Employees hired in 1986
SELECT emp_no, 
last_name, 
first_name,
hire_date
FROM employees
WHERE
hire_date BETWEEN '1985-01-01' AND  '1986-12-31'
ORDER BY hire_date ASC;

-- Department Managers
SELECT dm.dept_no,
d.dept_name,
dm.emp_no,
e.last_name,
e.first_name,
dm.from_date,
dm.to_date
FROM dept_manager as dm
INNER JOIN departments as d
ON (dm.dept_no = d.dept_no )
INNER JOIN employees as e
ON (dm.emp_no = e.emp_no);

--Employee Departments
SELECT de.emp_no,
		e.last_name,
		e.first_name,
		d.dept_name
FROM dept_emp as de
    INNER JOIN employees as e
    ON e.emp_no = de.emp_no
INNER JOIN departments as d
on d.dept_no = de.dept_no
ORDER BY emp_no;

-- Hercules! Hercules!
SELECT 
last_name,
first_name
FROM 
employees
WHERE
last_name LIKE 'B%' AND
first_name = 'Hercules';

--Sales Employees
SELECT
de.emp_no,
e.last_name,
e.first_name,
d.dept_name
FROM employees as e
INNER JOIN dept_emp as de
ON de.emp_no = e.emp_no
INNER JOIN departments as d
ON d.dept_no = de.dept_no
WHERE de.dept_no = 'd007';

-- Sales and Development Employees
SELECT
de.emp_no,
e.last_name,
e.first_name,
d.dept_name
FROM employees as e
INNER JOIN dept_emp as de
ON de.emp_no = e.emp_no
INNER JOIN departments as d
ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales' OR 
d.dept_name = 'Development';

--Last Name Frequency
SELECT 
	last_name,
	COUNT (last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT (last_name) DESC;



