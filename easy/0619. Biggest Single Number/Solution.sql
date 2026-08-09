/*
619. Biggest Single Number

A single number is a number that appeared only once in the MyNumbers table.

Find the largest single number. If there is no single number, report null.

The result format is in the following example.
*/

SELECT MAX(num) AS num
  FROM (SELECT num
          FROM mynumbers
         GROUP BY num
        HAVING COUNT(*) = 1) AS unique_mynumbers;
