/*
1934. Confirmation Rate

The confirmation rate of a user is the number of 'confirmed' messages dividedby the total number of requested confirmation messages.
The confirmation rate of a user that did not request any confirmation messages is 0. Round the confirmation rate to two decimal places.
Write a solution to find the confirmation rate of each user.
Return the result table in any order.

The result format is in the following example.
*/

SELECT user_id,
       ROUND(AVG(if(action = 'confirmed', 1, 0)), 2) AS confirmation_rate
  FROM signups
       LEFT JOIN confirmations
       USING (user_id)
 GROUP BY user_id;
