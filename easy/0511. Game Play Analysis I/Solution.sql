/*
511. Game Play Analysis I

Write a solution to find the first login date for each player.

Return the result table in any order.

The result format is in the following example.
*/

SELECT player_id, MIN(event_date) AS first_login
  FROM activity
 GROUP BY player_id;
