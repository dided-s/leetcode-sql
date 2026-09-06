DROP TABLE IF EXISTS Sales;

CREATE TABLE IF NOT EXISTS Sales (
    sale_id    INT,
    product_id INT,
    year       INT,
    quantity   INT,
    price      INT
);

TRUNCATE TABLE Sales;

INSERT INTO Sales (sale_id, product_id, year, quantity, price)
VALUES ('1', '100', '2008', '10', '5000');

INSERT INTO Sales (sale_id, product_id, year, quantity, price)
VALUES ('2', '100', '2009', '12', '5000');

INSERT INTO Sales (sale_id, product_id, year, quantity, price)
VALUES ('7', '200', '2011', '15', '9000');
