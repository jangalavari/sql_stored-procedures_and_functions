# SQL Stored Procedure & Function Example

## Objective

Demonstrate how to modularize SQL logic using a stored procedure and a function in MySQL.

## Contents

- `stored_procedure_and_function.sql`: SQL file with table creation, a stored procedure, and a function.
- This `README.md`

## Requirements

- MySQL Workbench (or any MySQL-compatible database)

## Setup & Usage

### 1. Create the Table and Insert Data

Run the following commands (or run the entire `.sql` file):

```sql
CREATE TABLE IF NOT EXISTS employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10,2),
    department VARCHAR(50)
);

INSERT INTO employees (name, salary, department) VALUES
('Alice', 50000, 'Engineering'),
('Bob', 60000, 'Engineering'),
('Carol', 70000, 'HR'),
('Dave', 80000, 'HR');
```

### 2. Create the Stored Procedure

This procedure returns employees in a given department with a minimum salary:

```sql
DELIMITER //
CREATE PROCEDURE GetEmployeesByDepartment(
    IN dept_name VARCHAR(50),
    IN min_salary DECIMAL(10,2)
)
BEGIN
    SELECT id, name, salary, department
    FROM employees
    WHERE department = dept_name AND salary >= min_salary;
END //
DELIMITER ;
```

#### Usage Example:

```sql
CALL GetEmployeesByDepartment('Engineering', 55000);
```

### 3. Create the Function

This function calculates a bonus based on salary and a percentage:

```sql
DELIMITER //
CREATE FUNCTION CalculateBonus(
    base_salary DECIMAL(10,2),
    bonus_percent DECIMAL(5,2)
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE bonus DECIMAL(10,2);
    SET bonus = base_salary * bonus_percent / 100;
    RETURN bonus;
END //
DELIMITER ;
```

#### Usage Example:

```sql
SELECT name, salary, CalculateBonus(salary, 10) AS bonus
FROM employees;
```

## Outcomes

- Understand how to modularize SQL logic using procedures and functions.
- Learn to use parameters and basic control logic.

---

_You can copy these files into your GitHub repository._