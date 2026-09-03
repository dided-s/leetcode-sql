/*
1393. Capital Gain/Loss

Write a solution to report the Capital gain/loss for each stock.

The Capital gain/loss of a stock is the total gain or loss after buying and selling the stock one or many times.

Return the result table in any order.

The result format is in the following example.
*/


SELECT stock_name,
       SUM(if(operation = 'Buy', -1 * price, price)) AS capital_gain_loss
  FROM stocks
 GROUP BY stock_name;
