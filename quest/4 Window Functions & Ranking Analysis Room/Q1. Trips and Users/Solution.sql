/*
Q1. Trips and Users

The cancellation rate is computed by dividing the number of canceled (by client or driver)
requests with unbanned users by the total number of requests with unbanned users on that day.

Write a solution to find the cancellation rate of requests with unbanned users
(both client and driver must not be banned) each day between "2013-10-01" and "2013-10-03" with at least one trip.
Round Cancellation Rate to two decimal points.

Return the result table in any order.

The result format is in the following example.
 */
SELECT
	request_at AS DAY,
	ROUND(
		SUM(if (status != 'completed', 1, 0)) / COUNT(id),
		2
	) AS `Cancellation Rate`
FROM
	trips
	LEFT JOIN users AS clients ON trips.client_id = clients.users_id
	LEFT JOIN users AS drivers ON trips.driver_id = drivers.users_id
WHERE
	clients.banned = "No"
	AND drivers.banned = "No"
	AND request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY
	request_at;