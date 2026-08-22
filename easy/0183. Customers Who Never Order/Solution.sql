/*
183. Customers Who Never Order

Write a solution to find all customers who never order anything.

Return the result table in any order.

The result format is in the following example.
*/

SELECT customers.name AS Customers
  FROM customers
       LEFT JOIN orders
       ON customers.id = orders.customerId
 GROUP BY customers.id, customers.name
HAVING COUNT(orders.id) = 0;
