/*
1251. Average Selling Price
Write a solution to find the average selling price for each product. average_price should be rounded to 2 decimal places.
If a product does not have any sold units, its average selling price is assumed to be 0.
Return the result table in any order.
The result format is in the following example.
*/

SELECT prices.product_id,
       IFNULL(ROUND(SUM(units * price) / SUM(units), 2), 0) AS average_price
  FROM prices
       LEFT JOIN unitssold
       ON prices.product_id = unitssold.product_id
          AND purchase_date BETWEEN start_date AND end_date
 GROUP BY product_id;
