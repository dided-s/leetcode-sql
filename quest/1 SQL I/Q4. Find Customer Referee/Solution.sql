/*
Q4. Find Customer Referee

Find the names of the customer that are either:

1. referred by any customer with id != 2.
2. not referred by any customer.
Return the result table in any order.

The result format is in the following example.
*/

SELECT
	name
FROM
	customer
WHERE
	referee_id != 2
	OR referee_id IS NULL;