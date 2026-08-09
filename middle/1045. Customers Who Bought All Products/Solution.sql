/*
1045. Customers Who Bought All Products
Write a solution to report the customer ids from the Customer table that bought all the products in the Product table.

Return the result table in any order.

The result format is in the following example.
*/

SELECT customer_id
  FROM customer
 GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*)
                     FROM product);
