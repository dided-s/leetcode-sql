/*
180. Consecutive Numbers
Find all numbers that appear at least three times consecutively.

Return the result table in any order.

The result format is in the following example.
*/

SELECT DISTINCT logs1.num AS ConsecutiveNums
  FROM logs AS logs1
       LEFT JOIN logs AS logs2
       ON logs1.id = logs2.id - 1

       LEFT JOIN logs AS logs3
       ON logs1.id = logs3.id - 2
 WHERE logs1.num = logs2.num
   AND logs1.num = logs3.num;
