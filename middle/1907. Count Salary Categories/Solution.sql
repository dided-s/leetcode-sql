/*
1907. Count Salary Categories
Write a solution to calculate the number of bank accounts for each salary category. The salary categories are:

"Low Salary": All the salaries strictly less than $20000.
"Average Salary": All the salaries in the inclusive range [$20000, $50000].
"High Salary": All the salaries strictly greater than $50000.
The result table must contain all three categories. If there are no accounts in a category, return 0.

Return the result table in any order.

The result format is in the following example.
*/

  WITH category AS (
           SELECT 'Low Salary' AS category
            UNION
           SELECT 'Average Salary'
            UNION
           SELECT 'High Salary'),
       accounts_count AS (
           SELECT *,
                  CASE
                  WHEN income < 20000 THEN 'Low Salary'
                  WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
                  WHEN income > 50000 THEN 'High Salary'
                  END AS category
             FROM accounts)
SELECT category, COUNT(account_id) AS accounts_count
  FROM category
       LEFT JOIN accounts_count
       USING (category)
 GROUP BY category;
