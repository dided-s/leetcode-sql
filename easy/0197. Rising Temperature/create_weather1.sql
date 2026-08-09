CREATE TABLE IF NOT EXISTS Weather (
    id          INT,
    recordDate  DATE,
    temperature INT
);

TRUNCATE TABLE Weather;

INSERT INTO Weather (id, recordDate, temperature)
VALUES ('1', '2015-01-01', '10');

INSERT INTO Weather (id, recordDate, temperature)
VALUES ('2', '2015-01-02', '25');

INSERT INTO Weather (id, recordDate, temperature)
VALUES ('3', '2015-01-03', '20');

INSERT INTO Weather (id, recordDate, temperature)
VALUES ('4', '2015-01-04', '30');
