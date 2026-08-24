/*
627. Swap Sex of Employees
Write a solution to swap all 'f' and 'm' values (i.e., change all 'f' values to 'm' and vice versa)
with a single update statement and no intermediate temporary tables.

Note that you must write a single update statement, do not write any select statement for this problem.

The result format is in the following example.
*/

SELECT *
  FROM salary;

UPDATE salary
   SET sex = IF(sex = 'f', 'm', 'f');
