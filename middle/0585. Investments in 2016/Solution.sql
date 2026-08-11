/*
585. Investments in 2016

Write a solution to report the sum of all total investment values in 2016 tiv_2016, for all policyholders who:

have the same tiv_2015 value as one or more other policyholders, and
are not located in the same city as any other policyholder (i.e., the (lat, lon) attribute pairs must be unique).
Round tiv_2016 to two decimal places.

The result format is in the following example.
*/

  WITH valid_tiv_2015 AS (
           SELECT tiv_2015
             FROM insurance
            GROUP BY tiv_2015
           HAVING COUNT(pid) > 1),
       valid_lat_lon AS (
           SELECT lat, lon
             FROM insurance
            GROUP BY lat, lon
           HAVING COUNT(pid) = 1)
SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
  FROM insurance
 WHERE tiv_2015 IN (SELECT *
                      FROM valid_tiv_2015)
   AND (lat, lon) IN (SELECT *
                        FROM valid_lat_lon);
