/*
1084. Sales Analysis III

Write a solution to report the products that were only sold in the first quarter of 2019. That is, between 2019-01-01 and 2019-03-31 inclusive.

Return the result table in any order.

The result format is in the following example
*/

SELECT DISTINCT product_id, product_name
  FROM product
  JOIN sales
    USING (product_id)
 WHERE sale_date BETWEEN "2019-01-01" AND "2019-03-31"
   AND product_id NOT IN
       (SELECT product_id
          FROM sales
         WHERE sale_date NOT BETWEEN "2019-01-01" AND "2019-03-31");
