DROP TABLE IF EXISTS Employee;

DROP TABLE IF EXISTS Department;

CREATE TABLE IF NOT EXISTS Employee (
    id           INT,
    name         VARCHAR(255),
    salary       INT,
    departmentId INT
);

CREATE TABLE IF NOT EXISTS Department (
    id   INT,
    name VARCHAR(255)
);

TRUNCATE TABLE Employee;

INSERT INTO Employee (id, name, salary, departmentId)
VALUES ('1', 'Joe', '70000', '1');

INSERT INTO Employee (id, name, salary, departmentId)
VALUES ('2', 'Jim', '90000', '1');

INSERT INTO Employee (id, name, salary, departmentId)
VALUES ('3', 'Henry', '80000', '2');

INSERT INTO Employee (id, name, salary, departmentId)
VALUES ('4', 'Sam', '60000', '2');

INSERT INTO Employee (id, name, salary, departmentId)
VALUES ('5', 'Max', '90000', '1');

TRUNCATE TABLE Department;

INSERT INTO Department (id, name)
VALUES ('1', 'IT');

INSERT INTO Department (id, name)
VALUES ('2', 'Sales ');
