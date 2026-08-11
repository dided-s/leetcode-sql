/*
1517. Find Users With Valid E-Mails

Write a solution to find the users who have valid emails.

A valid e-mail has a prefix name and a domain where:

The prefix name is a string that may contain letters (upper or lower case), digits, underscore '_', period '.', and/or dash '-'. The prefix name must start with a letter.
The domain must be exactly '@leetcode.com' in lowercase.
Return the result table in any order.

The result format is in the following example.
*/

SELECT *
  FROM users
  # 'Флаг c означает case-sensitive, то есть проверку с учётом регистра'
 WHERE BINARY REGEXP_LIKE(mail, "^[A-Za-z][A-Za-z0-9_.-]*@leetcode\\.com$", 'c');
