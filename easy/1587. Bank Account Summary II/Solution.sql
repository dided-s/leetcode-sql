/*
1587. Bank Account Summary II

Write a solution to report the name and balance of users with a balance higher than 10000.
The balance of an account is equal to the sum of the amounts of all transactions involving that account.

Return the result table in any order.

The result format is in the following example.
*/

SELECT users.name, SUM(amount) AS balance
  FROM users
       LEFT JOIN transactions
       ON users.account = transactions.account
 GROUP BY users.account, name
HAVING balance > 10000;
