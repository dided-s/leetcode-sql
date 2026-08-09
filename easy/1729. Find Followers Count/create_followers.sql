CREATE TABLE IF NOT EXISTS Followers (
    user_id     INT,
    follower_id INT
);

TRUNCATE TABLE Followers;

INSERT INTO Followers (user_id, follower_id)
VALUES ('0', '1');

INSERT INTO Followers (user_id, follower_id)
VALUES ('1', '0');

INSERT INTO Followers (user_id, follower_id)
VALUES ('2', '0');

INSERT INTO Followers (user_id, follower_id)
VALUES ('2', '1');
