/*
Q1. Investments in 2016

Write a solution to report the sum of all total investment values in 2016 tiv_2016, for all policyholders who:

have the same tiv_2015 value as one or more other policyholders, and
are not located in the same city as any other policyholder (i.e., the (lat, lon) attribute pairs must be unique).
Round tiv_2016 to two decimal places.

The result format is in the following example.
 */

  WITH valid_insurance AS (
           SELECT *,
                  COUNT(*) OVER (PARTITION BY tiv_2015) AS count_2015,
                  COUNT(*) OVER (PARTITION BY lat, lon) AS loc_count
             FROM Insurance)
SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
  FROM valid_insurance AS a
 WHERE count_2015 > 1
   AND loc_count = 1;
