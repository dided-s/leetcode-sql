/*
550. Game Play Analysis IV
Write a solution to report the fraction of players that logged in again on the day after the day they first logged in,
rounded to 2 decimal places. In other words, you need to determine the number of players who logged in on the day
immediately following their initial login, and divide it by the number of total players.

The result format is in the following example.
*/


SELECT ROUND(AVG(second_day_visit), 2) AS fraction
  FROM (SELECT player_id,
               SUM(event_date = second_day) AS second_day_visit
          FROM activity
               LEFT JOIN (SELECT player_id,
                                 MIN(event_date) + INTERVAL 1 DAY AS second_day
                            FROM activity
                           GROUP BY player_id) AS second_day_activity
               USING (player_id)
         GROUP BY player_id) AS second_day_table;

SELECT ROUND(COUNT(*) / (SELECT COUNT(DISTINCT player_id)
  FROM activity), 2) AS fraction
  FROM activity
 WHERE (player_id, event_date) IN
       (SELECT player_id, MIN(event_date) + INTERVAL 1 DAY
          FROM Activity
         GROUP BY player_id);
