CREATE TABLE IF NOT EXISTS Stadium (
    id         INT,
    visit_date DATE NULL,
    people     INT
);

TRUNCATE TABLE Stadium;

INSERT INTO Stadium (id, visit_date, people)
VALUES ('1', '2017-01-01', '10');

INSERT INTO Stadium (id, visit_date, people)
VALUES ('2', '2017-01-02', '109');

INSERT INTO Stadium (id, visit_date, people)
VALUES ('3', '2017-01-03', '150');

INSERT INTO Stadium (id, visit_date, people)
VALUES ('4', '2017-01-04', '99');

INSERT INTO Stadium (id, visit_date, people)
VALUES ('5', '2017-01-05', '145');

INSERT INTO Stadium (id, visit_date, people)
VALUES ('6', '2017-01-06', '1455');

INSERT INTO Stadium (id, visit_date, people)
VALUES ('7', '2017-01-07', '199');

INSERT INTO Stadium (id, visit_date, people)
VALUES ('8', '2017-01-09', '188');
