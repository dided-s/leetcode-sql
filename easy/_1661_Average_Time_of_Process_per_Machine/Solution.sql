/*
1661. Average Time of Process per Machine
There is a factory website that has several machines each running the same number of processes.
Write a solution to find the average time each machine takes to complete a process.

The time to complete a process is the 'end' timestamp minus the 'start' timestamp.
The average time is calculated by the total time to complete every process on the machine divided by the number of processes that were run.
The resulting table should have the machine_id along with the average time as processing_time, which should be rounded to 3 decimal places.
Return the result table in any order.

The result format is in the following example
*/

SELECT start_activity.machine_id AS machine_id,
       ROUND(AVG(end_activity.timestamp - start_activity.timestamp), 3) AS processing_time
  FROM activity AS start_activity
  JOIN activity AS end_activity
    USING (machine_id, process_id)
 WHERE start_activity.activity_type = 'start'
   AND end_activity.activity_type = 'end'
 GROUP BY machine_id;
