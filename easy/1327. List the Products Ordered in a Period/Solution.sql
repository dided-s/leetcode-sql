/*
1327. List the Products Ordered in a Period

Write a solution to get the names of products that have at least 100 units ordered in February 2020 and their amount.

Return the result table in any order.

The result format is in the following example.
*/


SELECT product_name, SUM(unit) AS unit
  FROM products
       LEFT JOIN orders
       USING (product_id)
 WHERE MONTH(order_date) = 2
   AND YEAR(order_date) = 2020
 GROUP BY product_name
HAVING unit >= 100;
