/*
Q4. Human Traffic of Stadium

Write a solution to display the records with three or more rows with consecutive id's,
and the number of people is greater than or equal to 100 for each.

Return the result table ordered by visit_date in ascending order.

The result format is in the following example.
*/
SELECT *,
       DENSE_RANK() OVER (PARTITION BY id_cluster
                              ORDER BY id)
  FROM (SELECT *, id - ROW_NUMBER() OVER () AS id_cluster
          FROM stadium
         WHERE people >= 100) AS id_cluster_table;

  WITH cluster_table AS (
           SELECT *, id - ROW_NUMBER() OVER () AS id_cluster
             FROM stadium
            WHERE people >= 100),
       rank_cluster_table AS (
           SELECT *,
                  DENSE_RANK() OVER (PARTITION BY id_cluster
                                         ORDER BY id DESC) AS rank_cluster
             FROM cluster_table)
SELECT id, visit_date, people
  FROM rank_cluster_table
 WHERE rank_cluster >= 3
 ORDER BY visit_date;

  WITH cluster_table AS (
           SELECT *, id - ROW_NUMBER() OVER () AS id_cluster
             FROM stadium
            WHERE people >= 100),
       consecutive_count_table AS (
           SELECT *,
                  COUNT(*) OVER (PARTITION BY id_cluster) AS consecutive_count
             FROM cluster_table)
SELECT id, visit_date, people
  FROM consecutive_count_table
 WHERE consecutive_count >= 3
 ORDER BY visit_date;
