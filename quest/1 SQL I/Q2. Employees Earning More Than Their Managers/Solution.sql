/*
Q2. Employees Earning More Than Their Managers

Write a solution to find the employees who earn more than their managers.

Return the result table in any order.

The result format is in the following example.
 */
SELECT
	employee.name AS Employee
FROM
	employee
	JOIN employee AS manager ON employee.`managerId` = manager.id
WHERE
	employee.salary > manager.salary;