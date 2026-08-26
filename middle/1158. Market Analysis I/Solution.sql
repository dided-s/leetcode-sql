/*
1158. Market Analysis I
Write a solution to find for each user, the join date and the number of orders they made as a buyer in 2019.

Return the result table in any order.

The result format is in the following example.
*/

SELECT user_id AS buyer_id,
       join_date,
       COUNT(item_id) AS orders_in_2019
  FROM users
       LEFT JOIN orders
       ON user_id = buyer_id
          AND YEAR(order_date) = 2019
 GROUP BY user_id, join_date;
