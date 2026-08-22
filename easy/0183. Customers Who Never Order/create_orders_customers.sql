DROP TABLE IF EXISTS Customers;

DROP TABLE IF EXISTS Orders;

CREATE TABLE IF NOT EXISTS Customers (
    id   INT,
    name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Orders (
    id         INT,
    customerId INT
);

TRUNCATE TABLE Customers;

INSERT INTO Customers (id, name)
VALUES ('1', 'Joe');

INSERT INTO Customers (id, name)
VALUES ('2', 'Henry');

INSERT INTO Customers (id, name)
VALUES ('3', 'Sam');

INSERT INTO Customers (id, name)
VALUES ('4', 'Max');

TRUNCATE TABLE Orders;

INSERT INTO Orders (id, customerId)
VALUES ('1', '3');

INSERT INTO Orders (id, customerId)
VALUES ('2', '1');
