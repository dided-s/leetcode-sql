DROP TABLE IF EXISTS Employee;

CREATE TABLE
	IF NOT EXISTS Employee (
		id INT,
		name VARCHAR(255),
		salary INT,
		managerId INT
	);

TRUNCATE TABLE Employee;

INSERT INTO
	Employee (id, name, salary, managerId)
VALUES
	('1', 'Joe', '70000', '3');

INSERT INTO
	Employee (id, name, salary, managerId)
VALUES
	('2', 'Henry', '80000', '4');

INSERT INTO
	Employee (id, name, salary, managerId)
VALUES
	('3', 'Sam', '60000', NULL);

INSERT INTO
	Employee (id, name, salary, managerId)
VALUES
	('4', 'Max', '90000', NULL);