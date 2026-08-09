/* sql\leetcode-sql\tables\create_visits_transactions1.sql
Write a solution to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.

Return the result table sorted in any order.

The result format is in the following example.
*/

SELECT customer_id, COUNT(*) AS count_no_trans
  FROM visits
       LEFT JOIN transactions
       USING (visit_id)
 WHERE transaction_id IS NULL
 GROUP BY customer_id;
