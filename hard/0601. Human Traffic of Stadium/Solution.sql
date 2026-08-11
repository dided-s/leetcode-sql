/*
601. Human Traffic of Stadium

Write a solution to display the records with three or more rows with consecutive id's,
and the number of people is greater than or equal to 100 for each.

Return the result table ordered by visit_date in ascending order.

The result format is in the following example.
*/

SELECT *
  FROM (SELECT stadium.id, stadium.visit_date, stadium.people
          FROM stadium
               LEFT JOIN stadium AS stadium2
               ON stadium.id = stadium2.id - 1

               LEFT JOIN stadium AS stadium3
               ON stadium.id = stadium3.id - 2
         WHERE stadium.people >= 100
           AND stadium2.people >= 100
           AND stadium3.people >= 100

         UNION

        SELECT stadium.id, stadium.visit_date, stadium.people
          FROM stadium
               LEFT JOIN stadium AS stadium2
               ON stadium.id = stadium2.id - 1

               LEFT JOIN stadium AS stadium3
               ON stadium.id = stadium3.id + 1
         WHERE stadium.people >= 100
           AND stadium2.people >= 100
           AND stadium3.people >= 100

         UNION

        SELECT stadium.id, stadium.visit_date, stadium.people
          FROM stadium
               LEFT JOIN stadium AS stadium2
               ON stadium.id = stadium2.id + 1

               LEFT JOIN stadium AS stadium3
               ON stadium.id = stadium3.id + 2
         WHERE stadium.people >= 100
           AND stadium2.people >= 100
           AND stadium3.people >= 100) AS union_table
 ORDER BY id;

  WITH filtered AS (
           SELECT id,
                  visit_date,
                  people,
                  id - ROW_NUMBER() OVER (ORDER BY id) AS id_100_more
             FROM Stadium
            WHERE people >= 100)
SELECT id, visit_date, people
  FROM filtered
 WHERE id_100_more IN
       (SELECT id_100_more
          FROM filtered
         GROUP BY id_100_more
        HAVING COUNT(*) >= 3)
 ORDER BY visit_date;
