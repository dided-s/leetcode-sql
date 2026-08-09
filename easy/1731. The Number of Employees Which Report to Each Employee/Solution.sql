/*
1731. The Number of Employees Which Report to Each Employee

For this problem, we will consider a manager an employee who has at least 1 other employee reporting to them.
Write a solution to report the ids and the names of all managers, the number of employees who report directly to them,
and the average age of the reports rounded to the nearest integer.
Return the result table ordered by employee_id.

The result format is in the following example.
*/

SELECT manager.employee_id,
       manager.name,
       COUNT(*) AS reports_count,
       ROUND(AVG(employees.age)) AS average_age
  FROM employees AS manager
       LEFT JOIN employees AS employees
       ON manager.employee_id = employees.reports_to
 GROUP BY manager.employee_id, manager.name
HAVING average_age IS NOT NULL
ORDER BY manager.employee_id;
