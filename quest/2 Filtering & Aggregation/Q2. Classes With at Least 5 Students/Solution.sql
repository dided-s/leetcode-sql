/*
Q2. Classes With at Least 5 Students

Write a solution to find all the classes that have at least five students.

Return the result table in any order.

The result format is in the following example.
 */
SELECT
	class
FROM
	courses
GROUP BY
	class
HAVING
	COUNT(student) >= 5;