# Company Database SQL Project

This project contains the SQL script for creating and populating a **Company Database** 
that models a simplified corporate structure. The database includes employees, branches, 
clients, suppliers, and their relationships.

Repository: [company-database-sql](https://github.com/HChristopherNaoyuki/company-database-sql.git)

---

## Table of Contents

1. [Overview](#overview)
2. [Database Structure](#database-structure)
   * [Employee Table](#employee-table)
   * [Branch Table](#branch-table)
   * [Client Table](#client-table)
   * [Works With Table](#works-with-table)
   * [Branch Supplier Table](#branch-supplier-table)
3. [Relationships and Constraints](#relationships-and-constraints)
4. [Sample Data](#sample-data)
5. [How to Use](#how-to-use)
6. [Queries](#queries)
7. [Disclaimer](#disclaimer)

---

## Overview

This SQL project sets up a relational database for a fictional company. It includes:

* Employees and their reporting structure
* Branches and managers
* Clients and their associated branches
* Sales relationships between employees and clients
* Suppliers for each branch

The schema simulates a real-world business environment and is suitable for practice or as a base for more advanced applications.

---

## Database Structure

### Employee Table

Stores employee data including personal details, salary, reporting manager, and branch affiliation.

| Column                | Type        | Description                   |
| --------------------- | ----------- | ----------------------------- |
| employee\_id          | INT (PK)    | Unique ID for each employee   |
| employee\_first\_name | VARCHAR(40) | First name of the employee    |
| employee\_last\_name  | VARCHAR(40) | Last name of the employee     |
| employee\_birth\_day  | DATE        | Date of birth                 |
| employee\_sex         | VARCHAR(1)  | Gender ('M' or 'F')           |
| employee\_salary      | INT         | Salary amount                 |
| employee\_super\_id   | INT         | Supervisor's employee\_id     |
| employee\_branch\_id  | INT (FK)    | References branch(branch\_id) |

### Branch Table

Contains branch-specific data and links to the manager.

| Column                   | Type        | Description                    |
| ------------------------ | ----------- | ------------------------------ |
| branch\_id               | INT (PK)    | Unique branch ID               |
| branch\_name             | VARCHAR(40) | Name of the branch             |
| branch\_mgr\_id          | INT (FK)    | Manager's employee\_id         |
| branch\_mgr\_start\_date | DATE        | Manager's start date at branch |

### Client Table

Stores client information and their associated branch.

| Column             | Type        | Description                   |
| ------------------ | ----------- | ----------------------------- |
| client\_id         | INT (PK)    | Unique client ID              |
| client\_name       | VARCHAR(40) | Name of the client            |
| client\_branch\_id | INT (FK)    | References branch(branch\_id) |

### Works With Table

Represents sales relationships between employees and clients.

| Column                    | Type     | Description                   |
| ------------------------- | -------- | ----------------------------- |
| works\_with\_emp\_id      | INT (FK) | Employee involved in the deal |
| works\_with\_client\_id   | INT (FK) | Client involved               |
| works\_with\_total\_sales | INT      | Total sales value             |

Composite Primary Key: `(works_with_emp_id, works_with_client_id)`

### Branch Supplier Table

Stores supplier details specific to each branch.

| Column                       | Type        | Description               |
| ---------------------------- | ----------- | ------------------------- |
| branch\_supplier\_branch\_id | INT (FK)    | Branch receiving supplies |
| branch\_supplier\_name       | VARCHAR(40) | Name of the supplier      |
| branch\_supplier\_type       | VARCHAR(40) | Type of products supplied |

Composite Primary Key: `(branch_supplier_branch_id, branch_supplier_name)`

---

## Relationships and Constraints

* **Foreign Keys**:

  * `employee_branch_id` → `branch(branch_id)`
  * `branch_mgr_id` → `employee(employee_id)`
  * `client_branch_id` → `branch(branch_id)`
  * `works_with_emp_id` → `employee(employee_id)`
  * `works_with_client_id` → `client(client_id)`
  * `branch_supplier_branch_id` → `branch(branch_id)`

* **On Delete Behavior**:

  * Most foreign keys are set to `ON DELETE SET NULL` or `ON DELETE CASCADE` to preserve referential integrity.

---

## Sample Data

Preloaded data includes:

* 9 employees across 3 branches (Corporate, Scranton, Stamford)
* 7 suppliers for 2 branches
* 7 clients
* Multiple sales records in the `works_with` table

The data reflects a realistic hierarchy and network of business interactions.

---

## How to Use

1. Clone the repository:

   ```bash
   git clone https://github.com/HChristopherNaoyuki/company-database-sql.git
   ```

2. Open your preferred SQL environment (e.g., MySQL Workbench, DBeaver).

3. Run the script `company_database.sql` (or copy from the provided file) to:

   * Create the database
   * Create tables and relationships
   * Insert sample data

---

## Queries

At the end of the script, sample `SELECT` queries are included to inspect each table:

```sql
SELECT * FROM employee;
SELECT * FROM branch;
SELECT * FROM client;
SELECT * FROM works_with;
SELECT * FROM branch_supplier;
```

These queries can be modified or extended for further exploration.

---

## DISCLAIMER

UNDER NO CIRCUMSTANCES SHOULD IMAGES OR EMOJIS BE INCLUDED DIRECTLY 
IN THE README FILE. ALL VISUAL MEDIA, INCLUDING SCREENSHOTS AND IMAGES 
OF THE APPLICATION, MUST BE STORED IN A DEDICATED FOLDER WITHIN THE 
PROJECT DIRECTORY. THIS FOLDER SHOULD BE CLEARLY STRUCTURED AND NAMED 
ACCORDINGLY TO INDICATE THAT IT CONTAINS ALL VISUAL CONTENT RELATED TO 
THE APPLICATION (FOR EXAMPLE, A FOLDER NAMED IMAGES, SCREENSHOTS, OR MEDIA).

I AM NOT LIABLE OR RESPONSIBLE FOR ANY MALFUNCTIONS, DEFECTS, OR ISSUES 
THAT MAY OCCUR AS A RESULT OF COPYING, MODIFYING, OR USING THIS SOFTWARE. 
IF YOU ENCOUNTER ANY PROBLEMS OR ERRORS, PLEASE DO NOT ATTEMPT TO FIX THEM 
SILENTLY OR OUTSIDE THE PROJECT. INSTEAD, KINDLY SUBMIT A PULL REQUEST 
OR OPEN AN ISSUE ON THE CORRESPONDING GITHUB REPOSITORY, SO THAT IT CAN 
BE ADDRESSED APPROPRIATELY BY THE MAINTAINERS OR CONTRIBUTORS.

---
