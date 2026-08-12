DROP TABLE IF EXISTS Person;

CREATE TABLE IF NOT EXISTS Person (
    personId  INT,
    firstName VARCHAR(255),
    lastName  VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Address (
    addressId INT,
    personId  INT,
    city      VARCHAR(255),
    state     VARCHAR(255)
);

TRUNCATE TABLE Person;

INSERT INTO Person (personId, lastName, firstName)
VALUES ('1', 'Wang', 'Allen');

INSERT INTO Person (personId, lastName, firstName)
VALUES ('2', 'Alice', 'Bob');

TRUNCATE TABLE Address;

INSERT INTO Address (addressId, personId, city, state)
VALUES ('1', '2', 'New York City', 'New York');

INSERT INTO Address (addressId, personId, city, state)
VALUES ('2', '3', 'Leetcode', 'California');
