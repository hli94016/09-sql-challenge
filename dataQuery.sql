-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no AS `Employee Number`,
       e.last_name AS `Last Name`,
       e.first_name AS `First Name`,
       e.sex AS `Sex`,
       s.salary AS `Salary`
from employees e JOIN salaries s on e.emp_no = s.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT e.first_name as `First Name`,
       e.last_name as `Last Name`,
       e.hire_date as `Hire Date`
from employees e
where YEAR(e.hire_date) = 1986;

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no as `Department Number`,
       d.dept_name as `Department Name`,
       e.emp_no as `Employee Number`,
       e.last_name as `Last Name`,
       e.first_name as `First Name`
from dept_manager dm join employees e on e.emp_no = dm.emp_no
join departments d on dm.dept_no = d.dept_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no as `Employee Number`,
       e.last_name as `Last Name`,
       e.first_name as `First Name`,
       d.dept_name as `Department Name`
FROM dept_emp de JOIN employees e on de.emp_no = e.emp_no
JOIN departments d on de.dept_no = d.dept_no;

-- List first name, last name, and sex for employees whose first name is 'ercules' and last names begin with 'B.'
SELECT e.first_name as `First Name`,
       e.last_name as `Last Name`,
       e.sex as `Sex`
FROM employees e
where e.first_name = 'ercules' and
      e.last_name like 'B.%'

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no as `Employee Number`,
       e.last_name as `Last Name`,
       e.first_name as `First Name`,
       d.dept_name as `Department Name`
FROM dept_emp de
    JOIN employees e on de.emp_no = e.emp_no
    JOIN departments d on de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no as `Employee Number`,
       e.last_name as `Last Name`,
       e.first_name as `First Name`,
       d.dept_name as `Department Name`
FROM dept_emp de
         JOIN employees e on de.emp_no = e.emp_no
         JOIN departments d on de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT COUNT(e.last_name) as `count` from employees e
ORDER BY count DESC;