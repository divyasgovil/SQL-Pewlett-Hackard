--List the employee number, last name, first name, sex, and salary of each employee.
Select e.emp_no,e.last_name,e.first_name,e.sex,s.salary
from public."Employees" as e
Join public."Salary" as s On e.emp_no=s.emp_no
;
--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT e.first_name, e.last_name, e.hire_date
FROM public."Employees" as e
WHERE EXTRACT(YEAR FROM e.hire_date) = 1986
;
-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM public."DepartmentManager" dm
JOIN public."Departments" d ON dm.dept_no = d.dept_no
JOIN public."Employees" e ON dm.emp_no = e.emp_no
;
--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
Select de.dept_no,e.emp_no,e.last_name,e.first_name, d.dept_name
from public."DepartmentEmployees" as de
Join public."Departments" as d On de.dept_no=d.dept_no
Join public."Employees" as e On de.emp_no=e.emp_no
;
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT e.first_name, e.last_name, e.sex
FROM public."Employees" as e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%'
;
--List each employee in the Sales department, including their employee number, last name, and first name.
Select e.emp_no,e.last_name,e.first_name, d.dept_name
from public."DepartmentEmployees" as de
Join public."Departments" as d On de.dept_no=d.dept_no
Join public."Employees" as e On de.emp_no=e.emp_no
WHERE d.dept_name = 'Sales'
;
--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM public."Employees" e
JOIN public."DepartmentEmployees" de ON e.emp_no = de.emp_no
JOIN public."Departments" d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development')
;
--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT e.last_name, COUNT(e.emp_no) AS frequency
FROM public."Employees" e
GROUP BY e.last_name
ORDER BY frequency DESC;