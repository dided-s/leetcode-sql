/*
Write a solution to find all dates' id with higher temperatures compared to its previous dates (yesterday).

Return the result table in any order.

The result format is in the following example.
*/

SELECT weather.id
  FROM weather
  JOIN (SELECT id,
               recordDate + INTERVAL 1 DAY AS recordDate,
               temperature AS yesterday_temperature
          FROM weather) AS yesterday_weather
    USING (recordDate)
 WHERE temperature > yesterday_temperature;

SELECT w1.id
  FROM weather AS w1
       LEFT JOIN weather AS w2
       ON w1.recordDate = w2.recordDate + INTERVAL 1 DAY
 WHERE w1.temperature > w2.temperature;
