/*
184. Department Highest Salary

Write a solution to find employees who have the highest salary in each of the departments.

Return the result table in any order.

The result format is in the following example
*/

  WITH max_department_salaries AS (
           SELECT `departmentId`, MAX(salary)
             FROM employee
            GROUP BY `departmentId`)
SELECT department.name AS Department,
       employee.name AS Employee,
       employee.salary AS Salary
  FROM employee
  JOIN department
    ON employee.`departmentId` = department.id
 WHERE (`departmentId`, salary) IN (SELECT *
                                      FROM max_department_salaries);
