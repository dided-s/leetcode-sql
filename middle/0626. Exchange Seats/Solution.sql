/*
626. Exchange Seats
Write a solution to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.
Return the result table ordered by id in ascending order.

The result format is in the following example.
*/

SELECT new_id AS id, student
  FROM (SELECT id - 1 AS new_id, student
          FROM seat
         WHERE id % 2 = 0

         UNION

        SELECT if(id = (SELECT MAX(id)
          FROM seat), id, id + 1) AS new_id,
               student
          FROM seat
         WHERE id % 2 = 1) AS swap_seats
 ORDER BY id;

SELECT CASE
       WHEN id % 2 = 1 AND id != (SELECT MAX(id)
  FROM Seat) THEN id + 1
       WHEN id % 2 = 0 THEN id - 1
       ELSE id
       END AS id,
       student
  FROM Seat
 ORDER BY id;
