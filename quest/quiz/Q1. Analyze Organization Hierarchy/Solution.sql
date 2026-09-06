/*
Q1. Analyze Organization Hierarchy

Write a solution to analyze the organizational hierarchy and answer the following:

Hierarchy Levels: For each employee, determine their level in the organization (CEO is level 1, employees reporting directly to the CEO are level 2, and so on).
Team Size: For each employee who is a manager, count the total number of employees under them (direct and indirect reports).
Salary Budget: For each manager, calculate the total salary budget they control (sum of salaries of all employees under them, including indirect reports, plus their own salary).
Return the result table ordered by the result ordered by level in ascending order, then by budget in descending order, and finally by employee_name in ascending order.

The result format is in the following example.
*/

  WITH RECURSIVE all_manager_table AS (
           SELECT employee_id AS manager_id, employee_id AS sub_id
             FROM employees

            UNION ALL

           SELECT all_manager_table.manager_id, employees.employee_id
             FROM all_manager_table
             JOIN employees
               ON all_manager_table.sub_id = employees.manager_id),
       total_table AS (
           SELECT all_manager_table.manager_id,
                  SUM(salary) AS budget,
                  COUNT(sub_id) - 1 AS team_size
             FROM all_manager_table
             JOIN employees
               ON all_manager_table.sub_id = employees.employee_id
            GROUP BY all_manager_table.manager_id)
SELECT *
  FROM total_table;

  WITH RECURSIVE level_table AS (
           SELECT employee_id, 1 AS level
             FROM employees
            WHERE manager_id IS NULL

            UNION ALL

           SELECT employees.employee_id,
                  level_table.level + 1 AS level
             FROM employees
             JOIN level_table
               ON employees.manager_id = level_table.employee_id),
       all_manager_table AS (
           SELECT employee_id AS manager_id, employee_id AS sub_id
             FROM employees

            UNION ALL

           SELECT all_manager_table.manager_id, employees.employee_id
             FROM all_manager_table
             JOIN employees
               ON all_manager_table.sub_id = employees.manager_id),
       total_table AS (
           SELECT all_manager_table.manager_id,
                  SUM(salary) AS budget,
                  COUNT(sub_id) - 1 AS team_size
             FROM all_manager_table
             JOIN employees
               ON all_manager_table.sub_id = employees.employee_id
            GROUP BY all_manager_table.manager_id)
SELECT employee_id, employee_name, level, team_size, budget
  FROM employees
  JOIN level_table
    USING (employee_id)
  JOIN total_table
    ON employee_id = total_table.manager_id
 ORDER BY level, budget DESC, employee_name;

  WITH RECURSIVE org_level AS (
/* base case with the executive */
           SELECT employee_id, employee_name, 1 AS level
             FROM Employees
            WHERE manager_id IS NULL

            UNION ALL

           SELECT e.employee_id, e.employee_name, ol.level + 1 AS level
             FROM Employees AS e
             JOIN org_level AS ol
               ON e.manager_id = ol.employee_id),
       org_rela AS (
/* base case with all current employees */
           SELECT employee_id AS manager_id, employee_id AS sub_id, salary
             FROM Employees

            UNION ALL

           SELECT orl.manager_id, e.employee_id AS sub_id, e.salary
             FROM Employees AS e
             JOIN org_rela AS orl
               ON orl.sub_id = e.manager_id)
SELECT ol.employee_id,
       ol.employee_name,
       ol.level,
       COUNT(orl.sub_id) - 1 AS team_size,
       SUM(orl.salary) AS budget
  FROM org_level AS ol
  JOIN org_rela AS orl
    ON ol.employee_id = orl.manager_id
 GROUP BY ol.employee_id, ol.employee_name, ol.level
 ORDER BY ol.level, budget DESC, ol.employee_name;
