/*
262. Trips and Users

The cancellation rate is computed by dividing the number of canceled (by client or driver) requests with
unbanned users by the total number of requests with unbanned users on that day.

Write a solution to find the cancellation rate of requests with unbanned users (both client and driver must not be banned)
each day between "2013-10-01" and "2013-10-03" with at least one trip. Round Cancellation Rate to two decimal points.

Return the result table in any order.

The result format is in the following example.
*/

  WITH trips_unbanned AS (
           SELECT trips.id,
                  trips.client_id,
                  trips.driver_id,
                  trips.status,
                  trips.request_at
             FROM trips
             JOIN users AS clients
               ON client_id = clients.users_id
             JOIN users AS drivers
               ON driver_id = drivers.users_id
            WHERE clients.banned = "No"
              AND drivers.banned = "No"),
       trips_all_count AS (
           SELECT request_at, COUNT(*) AS all_count
             FROM trips_unbanned
            GROUP BY request_at),
       trips_cancelled_count AS (
           SELECT request_at, COUNT(*) AS cancelled_count
             FROM trips_unbanned
            WHERE status IN ('cancelled_by_client', 'cancelled_by_driver')
            GROUP BY request_at)
SELECT request_at AS Day,
       ROUND(ifnull(cancelled_count, 0) / all_count, 2) AS 'Cancellation Rate'
  FROM trips_all_count
       LEFT JOIN trips_cancelled_count
       USING (request_at)
 WHERE request_at BETWEEN '2013-10-01' AND '2013-10-03';

SELECT request_at AS Day,
       ROUND(SUM(CASE WHEN status != 'completed' THEN 1 ELSE 0 END) / COUNT(*), 2) AS `Cancellation Rate`
  FROM trips
  JOIN users AS clients
    ON client_id = clients.users_id
  JOIN users AS drivers
    ON driver_id = drivers.users_id
 WHERE clients.banned = 'No'
   AND drivers.banned = 'No'
   AND request_at BETWEEN '2013-10-01' AND '2013-10-03'
 GROUP BY request_at;
