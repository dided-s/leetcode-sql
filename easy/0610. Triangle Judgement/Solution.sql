/*
610. Triangle Judgement

Report for every three line segments whether they can form a triangle.
Return the result table in any order.
The result format is in the following example.
*/

SELECT *,
       if(x + y > z && y + z > x && x + z > y, 'Yes', 'No') AS triangle
  FROM triangle;
