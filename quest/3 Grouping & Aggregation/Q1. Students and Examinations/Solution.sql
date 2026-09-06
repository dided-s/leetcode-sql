/*
Q1. Students and Examinations

Write a solution to find the number of times each student attended each exam.

Return the result table ordered by student_id and subject_name.

The result format is in the following example.
 */
SELECT
	students.student_id,
	students.student_name,
	subjects.subject_name,
	COUNT(examinations.subject_name) AS attended_exams
FROM
	students
	CROSS JOIN subjects
	LEFT JOIN examinations ON students.student_id = examinations.student_id
	AND subjects.subject_name = examinations.subject_name
GROUP BY
	students.student_id,
	students.student_name,
	subjects.subject_name
ORDER BY
	students.student_id,
	subjects.subject_name;