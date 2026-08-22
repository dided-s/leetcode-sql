DROP TABLE IF EXISTS Person;

CREATE TABLE IF NOT EXISTS Person (
    id    INT,
    email VARCHAR(255)
);

TRUNCATE TABLE Person;

INSERT INTO Person (id, email)
VALUES ('1', 'a@b.com');

INSERT INTO Person (id, email)
VALUES ('2', 'c@d.com');

INSERT INTO Person (id, email)
VALUES ('3', 'a@b.com');
