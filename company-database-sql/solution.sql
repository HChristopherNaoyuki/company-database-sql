CREATE DATABASE company_database;

USE company_database;

-- TABLE CREATION

CREATE TABLE employee (
  employee_id INT PRIMARY KEY,
  employee_first_name VARCHAR(40),
  employee_last_name VARCHAR(40),
  employee_birth_day DATE,
  employee_sex VARCHAR(1),
  employee_salary INT,
  employee_super_id INT,
  employee_branch_id INT
);

CREATE TABLE branch (
  branch_id INT PRIMARY KEY,
  branch_name VARCHAR(40),
  branch_mgr_id INT,
  branch_mgr_start_date DATE,
  FOREIGN KEY (branch_mgr_id) REFERENCES employee(employee_id) ON DELETE SET NULL
);

ALTER TABLE employee
ADD FOREIGN KEY (employee_branch_id) 
	REFERENCES branch(branch_id) ON DELETE SET NULL;

CREATE TABLE client (
  client_id INT PRIMARY KEY,
  client_name VARCHAR(40),
  client_branch_id INT,
  FOREIGN KEY (client_branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

CREATE TABLE works_with (
  works_with_emp_id INT,
  works_with_client_id INT,
  works_with_total_sales INT,
  PRIMARY KEY (works_with_emp_id, works_with_client_id),
  FOREIGN KEY (works_with_emp_id) REFERENCES employee(employee_id) ON DELETE CASCADE,
  FOREIGN KEY (works_with_client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

CREATE TABLE branch_supplier (
  branch_supplier_branch_id INT,
  branch_supplier_name VARCHAR(40),
  branch_supplier_type VARCHAR(40),
  PRIMARY KEY (branch_supplier_branch_id, branch_supplier_name),
  FOREIGN KEY (branch_supplier_branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);

-- DATA INSERTION

-- Corporate
INSERT INTO employee VALUES
(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);

INSERT INTO branch VALUES
(1, 'Corporate', 100, '2006-02-09');

UPDATE employee
SET employee_branch_id = 1
WHERE employee_id = 100;

INSERT INTO employee VALUES
(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);

-- Scranton
INSERT INTO employee VALUES
(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);

INSERT INTO branch VALUES
(2, 'Scranton', 102, '1992-04-06');

UPDATE employee
SET employee_branch_id = 2
WHERE employee_id = 102;

INSERT INTO employee VALUES
(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2),
(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2),
(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);

-- Stamford
INSERT INTO employee VALUES
(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);

INSERT INTO branch VALUES
(3, 'Stamford', 106, '1998-02-13');

UPDATE employee
SET employee_branch_id = 3
WHERE employee_id = 106;

INSERT INTO employee VALUES
(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3),
(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);

-- Branch Suppliers
INSERT INTO branch_supplier VALUES
(2, 'Hammer Mill', 'Paper'),
(2, 'Uni-ball', 'Writing Utensils'),
(2, 'J.T. Forms & Labels', 'Custom Forms'),
(3, 'Patriot Paper', 'Paper'),
(3, 'Uni-ball', 'Writing Utensils'),
(3, 'Hammer Mill', 'Paper'),
(3, 'Stamford Lables', 'Custom Forms');

-- Clients
INSERT INTO client VALUES
(400, 'Dunmore Highschool', 2),
(401, 'Lackawana Country', 2),
(402, 'FedEx', 3),
(403, 'John Daly Law, LLC', 3),
(404, 'Scranton Whitepages', 2),
(405, 'Times Newspaper', 3),
(406, 'FedEx', 2);

-- Works With
INSERT INTO works_with VALUES
(105, 400, 55000),
(102, 401, 267000),
(108, 402, 22500),
(107, 403, 5000),
(108, 403, 12000),
(105, 404, 33000),
(107, 405, 26000),
(102, 406, 15000),
(105, 406, 130000);

SELECT * FROM employee;

SELECT * FROM branch;

SELECT * FROM client;

SELECT * FROM works_with;

SELECT * FROM branch_supplier;