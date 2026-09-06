/*
Q3. Tree Node

Each node in the tree can be one of three types:

"Leaf": if the node is a leaf node.
"Root": if the node is the root of the tree.
"Inner": If the node is neither a leaf node nor a root node.
Write a solution to report the type of each node in the tree.

Return the result table in any order.

The result format is in the following example.
 */
SELECT
	tree.id,
	CASE
		WHEN COUNT(tree.p_id) = 0 THEN "Root"
		WHEN COUNT(children.id) = 0 THEN "Leaf"
		ELSE "Inner"
	END AS type
FROM
	tree
	LEFT JOIN tree AS children ON tree.id = children.p_id
GROUP BY
	tree.id;

SELECT
	id,
	CASE
		WHEN p_id IS NULL THEN 'Root'
		WHEN id IN (
			SELECT
				p_id
			FROM
				tree
		) THEN 'Inner'
		ELSE 'Leaf'
	END AS type
FROM
	tree;