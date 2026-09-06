/*
Q4. Movie Rating

Write a solution to:

- Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name.
- Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name.
The result format is in the following example.
 */
(
	SELECT
		name AS results
	FROM
		users
		LEFT JOIN movierating USING (user_id)
	GROUP BY
		user_id,
		name
	ORDER BY
		COUNT(movie_id) DESC,
		name
	LIMIT
		1
)
UNION ALL
(
	SELECT
		title
	FROM
		movies
		LEFT JOIN movierating USING (movie_id)
	WHERE
		YEAR (created_at) = 2020
		AND MONTH (created_at) = 2
	GROUP BY
		movie_id,
		title
	ORDER BY
		AVG(rating) DESC, title
	LIMIT
		1
);