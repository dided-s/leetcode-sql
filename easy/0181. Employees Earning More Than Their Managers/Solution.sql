/*
181. Employees Earning More Than Their Managers
Write a solution to find the employees who earn more than their managers.

Return the result table in any order.

The result format is in the following example.
*/

SELECT employees.name AS Employee
  FROM employee AS managers
       LEFT JOIN employee AS employees
       ON managers.id = employees.managerId
 WHERE employees.salary > managers.salary;
