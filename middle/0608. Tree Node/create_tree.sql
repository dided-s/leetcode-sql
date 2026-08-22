CREATE TABLE IF NOT EXISTS Tree (
    id   INT,
    p_id INT
);

TRUNCATE TABLE Tree;

INSERT INTO Tree (id, p_id)
VALUES ('1', NULL);

INSERT INTO Tree (id, p_id)
VALUES ('2', '1');

INSERT INTO Tree (id, p_id)
VALUES ('3', '1');

INSERT INTO Tree (id, p_id)
VALUES ('4', '2');

INSERT INTO Tree (id, p_id)
VALUES ('5', '2');
