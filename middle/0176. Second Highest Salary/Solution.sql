/*
176. Second Highest Salary
Write a solution to find the second highest distinct salary from the Employee table. If there is no second highest salary, return null (return None in Pandas).

The result format is in the following example.
*/


/*
SELECT (SELECT salary AS SecondHighestSalary
          FROM employee
         WHERE salary NOT IN
               (SELECT MAX(salary)
                  FROM employee)
         GROUP BY salary
        HAVING COUNT(id) = 1
         ORDER BY salary DESC
         LIMIT 1) AS value;
*/

SELECT MAX(Salary) AS SecondHighestSalary
  FROM Employee
 WHERE Salary < (SELECT MAX(Salary)
                   FROM Employee);
