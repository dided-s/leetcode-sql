/*
Q3. Not Boring Movies

Write a solution to report the movies with an odd-numbered ID and a description that is not "boring".

Return the result table ordered by rating in descending order.

The result format is in the following example.
 */
SELECT
	*
FROM
	cinema
WHERE
	MOD(id, 2) = 1
	AND description NOT LIKE 'boring'
ORDER BY
	rating DESC;