DROP TABLE IF EXISTS Employees;

CREATE TABLE IF NOT EXISTS Employees (
    employee_id   INT,
    employee_name VARCHAR(100),
    manager_id    INT,
    salary        INT,
    department    VARCHAR(50)
);

TRUNCATE TABLE Employees;

INSERT INTO Employees (employee_id, employee_name, manager_id, salary, department)
VALUES ('1', 'Alice', NULL, '12000', 'Executive');

INSERT INTO Employees (employee_id, employee_name, manager_id, salary, department)
VALUES ('2', 'Bob', '1', '10000', 'Sales');

INSERT INTO Employees (employee_id, employee_name, manager_id, salary, department)
VALUES ('3', 'Charlie', '1', '10000', 'Engineering');

INSERT INTO Employees (employee_id, employee_name, manager_id, salary, department)
VALUES ('4', 'David', '2', '7500', 'Sales');

INSERT INTO Employees (employee_id, employee_name, manager_id, salary, department)
VALUES ('5', 'Eva', '2', '7500', 'Sales');

INSERT INTO Employees (employee_id, employee_name, manager_id, salary, department)
VALUES ('6', 'Frank', '3', '9000', 'Engineering');

INSERT INTO Employees (employee_id, employee_name, manager_id, salary, department)
VALUES ('7', 'Grace', '3', '8500', 'Engineering');

INSERT INTO Employees (employee_id, employee_name, manager_id, salary, department)
VALUES ('8', 'Hank', '4', '6000', 'Sales');

INSERT INTO Employees (employee_id, employee_name, manager_id, salary, department)
VALUES ('9', 'Ivy', '6', '7000', 'Engineering');

INSERT INTO Employees (employee_id, employee_name, manager_id, salary, department)
VALUES ('10', 'Judy', '6', '7000', 'Engineering');
