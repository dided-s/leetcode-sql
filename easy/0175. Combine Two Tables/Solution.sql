/*
175. Combine Two Tables

Write a solution to report the first name, last name, city, and state of each person in the Person table.
If the address of a personId is not present in the Address table, report null instead.

Return the result table in any order.

The result format is in the following example.
*/

SELECT `firstName`, `lastName`, city, state
  FROM person
  LEFT JOIN address
    USING (personId);
