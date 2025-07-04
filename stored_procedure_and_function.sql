-- Sample Database: company
-- Table: employees

-- 1. Create Table (if not exists)
CREATE TABLE IF NOT EXISTS employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10,2),
    department VARCHAR(50)
);

-- 2. Insert sample data
INSERT INTO employees (name, salary, department) VALUES
('Alice', 50000, 'Engineering'),
('Bob', 60000, 'Engineering'),
('Carol', 70000, 'HR'),
('Dave', 80000, 'HR');

-- 3. Create a Stored Procedure: Get employees by department with min salary filter
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

-- 4. Create a Function: Calculate annual bonus based on salary and bonus percent
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