DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Customer;

CREATE TABLE IF NOT EXISTS Customer (
    customer_id INT,
    product_key INT
);

CREATE TABLE Product (
    product_key INT
);

TRUNCATE TABLE Customer;

INSERT INTO Customer (customer_id, product_key)
VALUES ('1', '5');

INSERT INTO Customer (customer_id, product_key)
VALUES ('2', '6');

INSERT INTO Customer (customer_id, product_key)
VALUES ('3', '5');

INSERT INTO Customer (customer_id, product_key)
VALUES ('3', '6');

INSERT INTO Customer (customer_id, product_key)
VALUES ('1', '6');

TRUNCATE TABLE Product;

INSERT INTO Product (product_key)
VALUES ('5');

INSERT INTO Product (product_key)
VALUES ('6');
