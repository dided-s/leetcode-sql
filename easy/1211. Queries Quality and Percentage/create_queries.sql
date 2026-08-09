CREATE TABLE IF NOT EXISTS Queries (
    query_name VARCHAR(30),
    result     VARCHAR(50),
    position   INT,
    rating     INT
);

TRUNCATE TABLE Queries;

INSERT INTO Queries (query_name, result, position, rating)
VALUES ('Dog', 'Golden Retriever', '1', '5');

INSERT INTO Queries (query_name, result, position, rating)
VALUES ('Dog', 'German Shepherd', '2', '5');

INSERT INTO Queries (query_name, result, position, rating)
VALUES ('Dog', 'Mule', '200', '1');

INSERT INTO Queries (query_name, result, position, rating)
VALUES ('Cat', 'Shirazi', '5', '2');

INSERT INTO Queries (query_name, result, position, rating)
VALUES ('Cat', 'Siamese', '3', '3');

INSERT INTO Queries (query_name, result, position, rating)
VALUES ('Cat', 'Sphynx', '7', '4');
