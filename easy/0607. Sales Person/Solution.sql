/*
607. Sales Person

Write a solution to find the names of all the salespersons who did not have any orders related to the company with the name "RED".

Return the result table in any order.

The result format is in the following example.
*/

SELECT SalesPerson.name
  FROM Orders
  JOIN Company
    ON Orders.com_id = Company.com_id
       AND Company.name = 'RED'
       RIGHT JOIN SalesPerson
       ON SalesPerson.sales_id = Orders.sales_id
 WHERE Orders.sales_id IS NULL;
