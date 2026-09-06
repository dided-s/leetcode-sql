/*
Q2. Department Highest Salary

Write a solution to find employees who have the highest salary in each of the departments.

Return the result table in any order.

The result format is in the following example.
 */
WITH
	max_salary_department AS (
		SELECT
			`departmentId`,
			MAX(salary)    AS max_salary
		FROM
			employee
		GROUP BY
			`departmentId`
	)
SELECT
	department.name AS Department,
	employee.name   AS Employee,
	employee.salary AS Salary
FROM
	employee
	JOIN max_salary_department ON max_salary_department.`departmentId` = employee.`departmentId`
	AND max_salary_department.max_salary = employee.salary
	JOIN department ON employee.`departmentId` = department.id;