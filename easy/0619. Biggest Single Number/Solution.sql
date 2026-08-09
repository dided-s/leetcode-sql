/*
619. Biggest Single Number

A single number is a number that appeared only once in the MyNumbers table.

Find the largest single number. If there is no single number, report null.

The result format is in the following example.
*/

SELECT max(num) as num FROM (
select num from mynumbers
GROUP BY num
HAVING count(*) = 1) as unique_mynumbers
LIMIT 1;
