/* The CSV files provided have some issues where the some of the cells in columns 
birth and hire dates are read as TEXT not DATE this causes an error when being imported
if the data type in the sql is set as date.
To bypass this I created the birth and hire date columns as varchar and used the following
queries to change them as date.
*/
/* To change the data type of birth date and hire date of employees table*/

ALTER TABLE employees ALTER COLUMN birth_date TYPE DATE 
using to_date(birth_date, 'MM-DD-YYYY');

ALTER TABLE employees ALTER COLUMN hire_date TYPE DATE 
using to_date(hire_date, 'MM-DD-YYYY');



/* Check */
SELECT * FROM departments;

SELECT * FROM "dept_Emp";

SELECT * FROM "dept_Manager";

SELECT * FROM employees;

SELECT * FROM titles;

SELECT * FROM salaries;


