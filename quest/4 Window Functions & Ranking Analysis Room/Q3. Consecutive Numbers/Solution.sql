/*
Q3. Consecutive Numbers

Find all numbers that appear at least three times consecutively.

Return the result table in any order.

The result format is in the following example.
 */
SELECT DISTINCT num AS ConsecutiveNums
  FROM (SELECT id,
               num,
               LEAD(num, 1) OVER (ORDER BY id) AS n1,
               LEAD(num, 2) OVER (ORDER BY id) AS n2
          FROM logs) AS logs_with_nums
 WHERE num = n1
   AND num = n2;

SELECT DISTINCT num AS ConsecutiveNums
  FROM (SELECT id,
               num,
               ABS(id - ROW_NUMBER() OVER (PARTITION BY num ORDER BY id)) AS num_cluster
          FROM logs) AS logs_clusters
 GROUP BY num, num_cluster
HAVING COUNT(*) >= 3;

SELECT num, COUNT(*) AS consecutive_count
  FROM (SELECT id,
               num,
               id - ROW_NUMBER() OVER (PARTITION BY num ORDER BY id) AS num_cluster
          FROM logs) AS logs_clusters
 GROUP BY num, num_cluster;
