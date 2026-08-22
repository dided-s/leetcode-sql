/*
608. Tree Node

Each node in the tree can be one of three types:

"Leaf": if the node is a leaf node.
"Root": if the node is the root of the tree.
"Inner": If the node is neither a leaf node nor a root node.
Write a solution to report the type of each node in the tree.

Return the result table in any order.

The result format is in the following example.
*/

SELECT id,
       CASE
       WHEN p_id IS NULL THEN 'Root'
       WHEN id IN (SELECT p_id FROM tree) THEN 'Inner'
       ELSE 'Leaf'
       END as type
  FROM tree;
