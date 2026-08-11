/*
185. Department Top Three Salaries
A company's executives are interested in seeing who earns the most money in each of the company's departments.
A high earner in a department is an employee who has a salary in the top three unique salaries for that department.
Write a solution to find the employees who are high earners in each of the departments.

Return the result table in any order.

The result format is in the following example.
*/


SELECT department.name AS Department,
       employee.name AS Employee,
       employee.salary AS Salary
  FROM employee
  JOIN department
    ON departmentId = department.id
 WHERE (SELECT COUNT(DISTINCT e2.salary)
  FROM employee AS e2
 WHERE e2.departmentId = employee.departmentId
   AND e2.salary > employee.salary) < 3
 ORDER BY employee.salary DESC;

SELECT department.name AS Department,
       employee.name AS Employee,
       employee.salary AS Salary
  FROM (SELECT *,
               DENSE_RANK() OVER (PARTITION BY departmentId
                                      ORDER BY salary DESC) AS rnk
          FROM employee) AS employee

  JOIN department
    ON employee.departmentId = department.id
 WHERE rnk <= 3;
