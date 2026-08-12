/*
177. Nth Highest Salary
Write a solution to find the nth highest distinct salary from the Employee table. If there are less than n distinct salaries, return null.

The result format is in the following example.
*/

Drop FUNCTION if EXISTS getNthHighestSalary;
CREATE FUNCTION getNthHighestSalary(N INT)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
  SET N = N - 1;
  RETURN (
      SELECT DISTINCT(salary) FROM Employee ORDER BY salary DESC
      LIMIT 1 OFFSET N
  );
END;

SELECT getNthHighestSalary(2);
