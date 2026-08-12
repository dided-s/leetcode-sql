/*
3374. First Letter Capitalization II

Write a solution to transform the text in the content_text column by applying the following rules:

Convert the first letter of each word to uppercase and the remaining letters to lowercase
Special handling for words containing special characters:
For words connected with a hyphen -, both parts should be capitalized (e.g., top-rated → Top-Rated)
All other formatting and spacing should remain unchanged
Return the result table that includes both the original content_text and the modified text following the above rules.

The result format is in the following example.
*/


  WITH RECURSIVE words AS (
           SELECT content_id,
                  TRIM(substring_index(content_text, ' ', 1)) AS word,
                  TRIM(SUBSTRING(content_text, LENGTH(substring_index(content_text, ' ', 1)) + 2)) AS rest,
                  1 AS word_num
             FROM user_content

            UNION ALL

           SELECT content_id,
                  TRIM(substring_index(rest, ' ', 1)) AS word,
                  TRIM(SUBSTRING(rest, LENGTH(substring_index(rest, ' ', 1)) + 2)) AS rest,
                  word_num + 1
             FROM words
            WHERE rest <> '')
SELECT content_id,
       group_concat(word ORDER BY word_num SEPARATOR ' ') AS original_text,
       group_concat(
           CONCAT(CASE
                    -- -baz → -baz
                    WHEN LEFT(word, 1) = '-' THEN word
                    -- foo-bar → Foo-Bar
                    WHEN LENGTH(word) - LENGTH(REPLACE(word, '-', '')) = 1 THEN CONCAT(
                        UPPER(LEFT(SUBSTRING_INDEX(word, '-', 1), 1)),
                        LOWER(SUBSTRING(SUBSTRING_INDEX(word, '-', 1), 2)),
                        '-',
                        UPPER(LEFT(SUBSTRING_INDEX(word, '-', -1), 1)),
                        LOWER(SUBSTRING(SUBSTRING_INDEX(word, '-', -1), 2))
                    )
                    -- foo--bar → Foo--bar
                    ELSE CONCAT(
                        UPPER(LEFT(word, 1)),
                        LOWER(SUBSTRING(word, 2))
                    )
                END)
           ORDER BY word_num
           SEPARATOR ' '
       ) AS converted_text
  FROM words
 WHERE word <> ''
 GROUP BY content_id;







// Неудача, но жалко выкидывать

SELECT *
  FROM user_content;

  WITH RECURSIVE words AS (
           SELECT content_id,
                  TRIM(SUBSTRING(content_text, 1, regexp_instr(content_text, ' '))) AS word,
                  TRIM(SUBSTRING(content_text, regexp_instr(content_text, '[- ]') + 1)) AS rest,
                  1 AS word_num
             FROM user_content

            UNION ALL

           SELECT content_id,
                  TRIM(SUBSTRING(rest, 1, regexp_instr(rest, '[- ]'))),
                  TRIM(SUBSTRING(rest, regexp_instr(rest, '[- ]') + 1)),
                  word_num + 1
             FROM words
            WHERE rest <> '')
SELECT *
  FROM words
 WHERE word <> ''
 ORDER BY content_id, word_num;

  WITH RECURSIVE words AS (
           SELECT content_id,
                  CASE
                  WHEN regexp_instr(content_text, '^(?!.*-.*-)[^- ]+(?:[ -][^- ]+)?$') > 0 THEN SUBSTRING(content_text, 1, regexp_instr(content_text, '^(?!.*-.*-)[^- ]+(?:[ -][^- ]+)?$'))
                  ELSE TRIM(content_text)
                  END AS word,
                  CASE
                  WHEN regexp_instr(content_text, '^(?!.*-.*-)[^- ]+(?:[ -][^- ]+)?$') > 0 THEN SUBSTRING(content_text, regexp_instr(content_text, '^(?!.*-.*-)[^- ]+(?:[ -][^- ]+)?$') + 1)
                  ELSE ''
                  END AS rest,
                  1 AS word_num
             FROM user_content

            UNION ALL

           SELECT content_id,
                  CASE
                  WHEN regexp_instr(rest, '^(?!.*-.*-)[^- ]+(?:[ -][^- ]+)?$') > 0 THEN SUBSTRING(rest, 1, regexp_instr(rest, '^(?!.*-.*-)[^- ]+(?:[ -][^- ]+)?$'))
                  ELSE TRIM(rest)
                  END AS word,
                  CASE
                  WHEN regexp_instr(rest, '^(?!.*-.*-)[^- ]+(?:[ -][^- ]+)?$') > 0 THEN SUBSTRING(rest, regexp_instr(rest, '^(?!.*-.*-)[^- ]+(?:[ -][^- ]+)?$') + 1)
                  ELSE ''
                  END AS rest,
                  word_num + 1
             FROM words
            WHERE rest <> '')
            SELECT * FROM words;
SELECT content_id,
       group_concat(word ORDER BY word_num SEPARATOR '') AS original_text,
       group_concat(
           CONCAT(UPPER(SUBSTRING(word, 1, 1)), LOWER(SUBSTRING(word, 2)))
           ORDER BY word_num
           SEPARATOR ''
       ) AS converted_text
  FROM words
 WHERE word <> ''
 GROUP BY content_id;
