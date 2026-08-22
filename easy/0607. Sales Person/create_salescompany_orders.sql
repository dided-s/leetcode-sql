DROP TABLE IF EXISTS SalesPerson;

DROP TABLE IF EXISTS Company;

DROP TABLE IF EXISTS Orders;

CREATE TABLE IF NOT EXISTS SalesPerson (
    sales_id        INT,
    name            VARCHAR(255),
    salary          INT,
    commission_rate INT,
    hire_date       DATE
);

CREATE TABLE IF NOT EXISTS Company (
    com_id INT,
    name   VARCHAR(255),
    city   VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Orders (
    order_id   INT,
    order_date DATE,
    com_id     INT,
    sales_id   INT,
    amount     INT
);

TRUNCATE TABLE SalesPerson;

INSERT INTO SalesPerson (sales_id, name, salary, commission_rate, hire_date)
VALUES ('1', 'John', '100000', '6', str_to_date('4/1/2006', '%c/%e/%Y'));

INSERT INTO SalesPerson (sales_id, name, salary, commission_rate, hire_date)
VALUES ('2', 'Amy', '12000', '5', str_to_date('5/1/2010', '%c/%e/%Y'));

INSERT INTO SalesPerson (sales_id, name, salary, commission_rate, hire_date)
VALUES ('3', 'Mark', '65000', '12', str_to_date('12/25/2008', '%c/%e/%Y'));

INSERT INTO SalesPerson (sales_id, name, salary, commission_rate, hire_date)
VALUES ('4', 'Pam', '25000', '25', str_to_date('1/1/2005', '%c/%e/%Y'));

INSERT INTO SalesPerson (sales_id, name, salary, commission_rate, hire_date)
VALUES ('5', 'Alex', '5000', '10', str_to_date('2/3/2007', '%c/%e/%Y'));

TRUNCATE TABLE Company;

INSERT INTO Company (com_id, name, city)
VALUES ('1', 'RED', 'Boston');

INSERT INTO Company (com_id, name, city)
VALUES ('2', 'ORANGE', 'New York');

INSERT INTO Company (com_id, name, city)
VALUES ('3', 'YELLOW', 'Boston');

INSERT INTO Company (com_id, name, city)
VALUES ('4', 'GREEN', 'Austin');

TRUNCATE TABLE Orders;

INSERT INTO Orders (order_id, order_date, com_id, sales_id, amount)
VALUES ('1', str_to_date('1/1/2014', '%c/%e/%Y'), '3', '4', '10000');

INSERT INTO Orders (order_id, order_date, com_id, sales_id, amount)
VALUES ('2', str_to_date('2/1/2014', '%c/%e/%Y'), '4', '5', '5000');

INSERT INTO Orders (order_id, order_date, com_id, sales_id, amount)
VALUES ('3', str_to_date('3/1/2014', '%c/%e/%Y'), '1', '1', '50000');

INSERT INTO Orders (order_id, order_date, com_id, sales_id, amount)
VALUES ('4', str_to_date('4/1/2014', '%c/%e/%Y'), '1', '4', '25000');
