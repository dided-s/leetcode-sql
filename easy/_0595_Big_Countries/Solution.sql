/* sql\leetcode-sql\tables\create_world1.sql */

SELECT name, population, area
  FROM world
 WHERE area >= 3000000
    OR population >= 25000000;