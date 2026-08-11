/*
1321. Restaurant Growth

You are the restaurant owner and you want to analyze a possible expansion (there will be at least one customer every day).

Compute the moving average of how much the customer paid in a seven days window (i.e., current day + 6 days before).
average_amount should be rounded to two decimal places.

Return the result table ordered by visited_on in ascending order.

The result format is in the following example.
*/

SELECT DISTINCT visited_on,
       (SELECT SUM(amount)
          FROM customer
         WHERE visited_on BETWEEN main_customer.visited_on - INTERVAL 6 DAY
                              AND main_customer.visited_on) AS amount,
       (SELECT ROUND(SUM(amount) / 7, 2)
          FROM customer
         WHERE visited_on BETWEEN main_customer.visited_on - INTERVAL 6 DAY
                              AND main_customer.visited_on) AS average_amount
  FROM customer AS main_customer
 WHERE visited_on >= (SELECT MIN(visited_on) + INTERVAL 6 DAY
                        FROM customer)
 ORDER BY visited_on;

SELECT DISTINCT visited_on,
    SUM(amount) OVER 7_days as amount,
    ROUND((SUM(amount) OVER 7_days) / 7, 2) as average_amount
FROM customer
WINDOW 7_days as (ORDER BY visited_on
RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW)
LIMIT 1000 OFFSET 6;
