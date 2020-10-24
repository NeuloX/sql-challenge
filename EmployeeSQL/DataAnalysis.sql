/* Tasks */
/* List the following details of each employee: employee number, last name, first name, sex, and salary. */
SELECT 
employees.emp_no AS "Employee_Number", 
employees.last_name, 
employees.first_name,
employees.sex,
salaries.salary
FROM employees
INNER JOIN salaries 
		ON employees.emp_no = salaries.emp_no;

/* List first name, last name, and hire date for employees who were hired in 1986. */
SELECT 
emp_no AS "Employee_Number", 
last_name, 
first_name,
hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986

/* List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name. */
SELECT 
"dept_Manager".emp_no AS "Manager_Number",
employees.last_name,
employees.first_name,
departments.dept_no AS "Department_Number",
departments.dept_name AS "Department_Name"

FROM (("dept_Manager"
INNER JOIN employees
		ON employees.emp_no = "dept_Manager".emp_no)
INNER JOIN departments
		ON departments.dept_no = "dept_Manager".dept_no);

/* List the department of each employee with the following information: employee number, last name, first name, and department name. */
SELECT 
"dept_Emp".emp_no AS "Employee_Number",
employees.last_name,
employees.first_name,
departments.dept_name AS "Department_Name"

FROM (("dept_Emp"
INNER JOIN employees
	  ON employees.emp_no = "dept_Emp".emp_no)
INNER JOIN departments
	  ON departments.dept_no = "dept_Emp".dept_no);
	
/* List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B." */
SELECT 
first_name,
last_name,
sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

/* List all employees in the Sales department, including their employee number, last name, first name, and department name. */
/* ONLY Employees*/
SELECT 
"dept_Emp".emp_no AS "Employee_Number",
employees.last_name,
employees.first_name,
departments.dept_name AS "Department_Name"

FROM (("dept_Emp"
INNER JOIN employees
	  ON employees.emp_no = "dept_Emp".emp_no)
INNER JOIN departments
	  ON departments.dept_no = "dept_Emp".dept_no)
WHERE departments.dept_name = 'Sales';

/* Employees and Managers*/
SELECT 
"dept_Emp".emp_no AS "Employee_Number",
employees.last_name,
employees.first_name,
departments.dept_name AS "Department_Name"

FROM (("dept_Emp"
INNER JOIN employees
	  ON employees.emp_no = "dept_Emp".emp_no)
INNER JOIN departments
	  ON departments.dept_no = "dept_Emp".dept_no)
WHERE departments.dept_name = 'Sales'

UNION

SELECT 
"dept_Manager".emp_no AS "Employee_Number",
employees.last_name,
employees.first_name,
departments.dept_name AS "Department_Name"

FROM (("dept_Manager"
INNER JOIN employees
	  ON employees.emp_no = "dept_Manager".emp_no)
INNER JOIN departments
	  ON departments.dept_no = "dept_Manager".dept_no)
WHERE departments.dept_name = 'Sales';

/* List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name. */
/* ONLY Employees*/
SELECT 
"dept_Emp".emp_no AS "Employee_Number",
employees.last_name,
employees.first_name,
departments.dept_name AS "Department_Name"

FROM (("dept_Emp"
INNER JOIN employees
	  ON employees.emp_no = "dept_Emp".emp_no)
INNER JOIN departments
	  ON departments.dept_no = "dept_Emp".dept_no)
WHERE departments.dept_name = 'Sales' 
OR departments.dept_name = 'Development'; 

/* Employees and Managers*/
SELECT 
"dept_Emp".emp_no AS "Employee_Number",
employees.last_name,
employees.first_name,
departments.dept_name AS "Department_Name"

FROM (("dept_Emp"
INNER JOIN employees
	  ON employees.emp_no = "dept_Emp".emp_no)
INNER JOIN departments
	  ON departments.dept_no = "dept_Emp".dept_no)
WHERE departments.dept_name = 'Sales' 
OR departments.dept_name = 'Development' 

UNION

SELECT 
"dept_Manager".emp_no AS "Employee_Number",
employees.last_name,
employees.first_name,
departments.dept_name AS "Department_Name"

FROM (("dept_Manager"
INNER JOIN employees
	  ON employees.emp_no = "dept_Manager".emp_no)
INNER JOIN departments
	  ON departments.dept_no = "dept_Manager".dept_no)
WHERE departments.dept_name = 'Sales'
OR departments.dept_name = 'Development';

/* In descending order, list the frequency count of employee last names, i.e., how many employees share each last name. */
SELECT 
last_name,
COUNT(last_name) as "Number of Duplicates"
FROM employees
GROUP BY last_name
ORDER BY "Number of Duplicates" DESC




