/* sql\leetcode-sql\tables\create_tweets1.sql */

SELECT tweet_id
  FROM tweets
 WHERE LENGTH(content) > 15;