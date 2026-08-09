/*
1193. Monthly Transactions I
Write an SQL query to find for each month and country, the number of transactions and their total amount, the number of approved transactions and their total amount.

Return the result table in any order.
The query result format is in the following example.
*/

SELECT date_format(trans_date, '%Y-%m') AS month,
       country,
       COUNT(*) AS trans_count,
       SUM(if(state = 'approved', 1, 0)) AS approved_count,
       SUM(amount) AS trans_total_amount,
       SUM(if(state = 'approved', amount, 0)) AS approved_total_amount
  FROM transactions
 GROUP BY month, country;
