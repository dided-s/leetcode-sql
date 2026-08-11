/*
1667. Fix Names in a Table
Write a solution to fix the names so that only the first character is uppercase and the rest are lowercase.

Return the result table ordered by user_id.

The result format is in the following example.
*/

SELECT user_id,
       CONCAT(UPPER(SUBSTRING(name, 1, 1)), LOWER(SUBSTRING(name, 2))) AS name
  FROM users
 ORDER BY user_id;
