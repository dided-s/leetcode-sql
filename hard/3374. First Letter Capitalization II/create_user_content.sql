CREATE TABLE IF NOT EXISTS user_content (
    content_id   INT,
    content_text VARCHAR(255)
);

TRUNCATE TABLE user_content;

INSERT INTO user_content (content_id, content_text)
VALUES ('1', 'hello world of SQL');

INSERT INTO user_content (content_id, content_text)
VALUES ('2', 'the QUICK-brown fox');

INSERT INTO user_content (content_id, content_text)
VALUES ('3', 'modern-day DATA science');

INSERT INTO user_content (content_id, content_text)
VALUES ('4', 'web-based FRONT-end development');

INSERT INTO user_content (content_id, content_text)
VALUES ('5', 'foo--bar -baz lOO-daR-@Daz-');
