/*
602. Friend Requests II: Who Has the Most Friends

Write a solution to find the people who have the most friends and the most friends number.

The test cases are generated so that only one person has the most friends.

The result format is in the following example.
*/

SELECT id, SUM(count) AS num
  FROM (SELECT accepter_id AS id, COUNT(requester_id) AS count
          FROM requestaccepted
         GROUP BY accepter_id

         UNION ALL

        SELECT requester_id AS id, COUNT(accepter_id) AS count
          FROM requestaccepted
         GROUP BY requester_id) AS accepter_requester
 GROUP BY id
 ORDER BY num DESC
 LIMIT 1;
