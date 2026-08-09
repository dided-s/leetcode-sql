/*
577. Employee Bonus
Write a solution to report the name and bonus amount of each employee who satisfies either of the following:

The employee has a bonus less than 1000.
The employee did not get any bonus.
Return the result table in any order.

The result format is in the following example.
*/

SELECT name, bonus
  FROM employee
       LEFT JOIN bonus
       USING (empId)
 WHERE bonus IS NULL
    OR bonus < 1000;
