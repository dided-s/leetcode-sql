/*
1204. Last Person to Fit in the Bus

There is a queue of people waiting to board a bus.However, the bus has a
weight limit of 1000 kilograms, so there may be some people who cannot board.
Write a solution to find the person_name of the last person that can fit on the bus without exceeding the weight limit.
The test cases are generated such that the first person does not exceed the weight limit.

Note that only one person can board the bus at any given turn.

The result format is in the following example.
*/

SELECT person_name
  FROM (SELECT *,
               (SELECT SUM(queue_sum.weight)
                  FROM queue AS queue_sum
                 WHERE queue_sum.turn <= queue.turn) AS total_sum
          FROM queue
         ORDER BY turn) AS queue_with_total
 WHERE total_sum <= 1000
 ORDER BY total_sum DESC
 LIMIT 1;

SELECT person_name
  FROM (SELECT *, SUM(weight) OVER (ORDER BY turn) AS total_sum
          FROM queue) AS queue_with_total
 WHERE total_sum <= 1000
 ORDER BY total_sum DESC
 LIMIT 1;
