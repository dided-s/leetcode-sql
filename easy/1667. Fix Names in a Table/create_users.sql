DROP TABLE IF EXISTS Users;

CREATE TABLE IF NOT EXISTS Users (
    user_id INT,
    name    VARCHAR(40)
);

TRUNCATE TABLE Users;

INSERT INTO Users (user_id, name)
VALUES ('1', 'aLice');

INSERT INTO Users (user_id, name)
VALUES ('2', 'bOB');
