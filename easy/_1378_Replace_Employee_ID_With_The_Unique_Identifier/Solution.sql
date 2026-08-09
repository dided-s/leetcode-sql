/*
Write a solution to show the unique ID of each user, If a user does not have a unique ID replace just show null.

Return the result table in any order.

The result format is in the following example.
*/

SELECT unique_id, name
  FROM employees
       LEFT JOIN employeeuni
       ON employees.id = employeeuni.id;
