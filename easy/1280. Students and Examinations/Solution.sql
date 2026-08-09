/*
1280. Students and Examinations
Write a solution to find the number of times each student attended each exam.

Return the result table ordered by student_id and subject_name.

The result format is in the following example.
*/

SELECT students.student_id AS student_id,
       student_name,
       subjects.subject_name AS subject_name,
       COUNT(examinations.student_id) AS attended_exams
  FROM students
       CROSS JOIN subjects

       LEFT JOIN examinations
       ON students.student_id = examinations.student_id
          AND subjects.subject_name = examinations.subject_name
 GROUP BY student_id, student_name, subject_name
 ORDER BY student_id, subject_name;
