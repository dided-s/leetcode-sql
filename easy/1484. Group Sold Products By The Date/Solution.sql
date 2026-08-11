/*
1484. Group Sold Products By The Date

Write a solution to find for each date the number of different products sold and their names.
The sold products names for each date should be sorted lexicographically.

Return the result table ordered by sell_date.

The result format is in the following example.
*/

SELECT sell_date,
       COUNT(DISTINCT product) AS num_sold,
       group_concat(DISTINCT product ORDER BY product ASC) AS products
  FROM activities
 GROUP BY sell_date;
