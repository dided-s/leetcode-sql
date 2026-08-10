/*
1164. Product Price at a Given Date

Initially, all products have price 10.
Write a solution to find the prices of all products on the date 2019-08-16.
Return the result table in any order.

The result format is in the following example.
*/

  WITH data_price_products AS (
           SELECT product_id, new_price AS price
             FROM products
            WHERE (product_id, change_date) IN
                  (SELECT product_id, MAX(change_date) AS min_change_date
                     FROM products
                    WHERE change_date <= '2019-08-16'
                    GROUP BY product_id))
SELECT DISTINCT product_id, ifnull(price, 10) AS price
  FROM data_price_products
       RIGHT JOIN products
       USING (product_id);
