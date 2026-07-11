-- Problem: Employee Bonus
-- Difficulty: Easy
-- Source: LeetCode (https://leetcode.com/problems/employee-bonus/)
-- Topics: LEFT JOIN, CASE Expression, NULL Handling

-- ============================================================
-- PROBLEM STATEMENT
-- ============================================================
-- Select all employee's name and bonus whose bonus is less than 1000.
-- Display the results including employees with no bonus record.

-- ============================================================
-- TABLE SCHEMA
-- ============================================================
-- Table: Employee
-- empId (INT): Primary key, employee ID
-- name (VARCHAR): Employee name
-- supervisor (INT): Supervisor's employee ID
-- salary (INT): Employee salary

-- Table: Bonus
-- empId (INT): Primary key, employee ID
-- bonus (INT): Bonus amount

-- ============================================================
-- SAMPLE DATA
-- ============================================================
-- Employee:
-- +-------+--------+-----------+--------+
-- | empId |  name  | supervisor| salary |
-- +-------+--------+-----------+--------+
-- |   1   | John   |  3        | 1000   |
-- |   2   | Dan    |  3        | 2000   |
-- |   3   | Brad   |  null     | 4000   |
-- |   4   | Thomas |  3        | 4000   |
-- +-------+--------+-----------+--------+

-- Bonus:
-- +-------+-------+
-- | empId | bonus |
-- +-------+-------+
-- | 2     | 500   |
-- | 4     | 2000  |
-- +-------+-------+

-- Expected Output:
-- +-------+-------+
-- | name  | bonus |
-- +-------+-------+
-- | Dan   | 500   |
-- | John  | NULL  |
-- | Brad  | NULL  |
-- +-------+-------+

-- ============================================================
-- SOLUTION
-- ============================================================
SELECT 
    e.name,
    b.bonus
FROM 
    Employee e
    LEFT JOIN Bonus b ON e.empId = b.empId
WHERE 
    b.bonus < 1000 
    OR b.bonus IS NULL
ORDER BY 
    e.name;

-- ============================================================
-- EXPLANATION
-- ============================================================
-- 1. LEFT JOIN: Ensures all employees are included, even if they
--    don't have a bonus record in the Bonus table.
--
-- 2. WHERE Clause: Filters to show:
--    - Employees with bonus < 1000 (b.bonus < 1000)
--    - Employees with no bonus record (b.bonus IS NULL)
--
-- 3. Key Points:
--    - LEFT JOIN keeps all rows from the left table (Employee)
--    - When no match is found, bonus values are NULL
--    - IS NULL operator is needed to check for NULL values
--    - Can't use b.bonus = NULL in WHERE clause

-- ============================================================
-- ALTERNATIVE APPROACHES
-- ============================================================
-- Using COALESCE to treat NULL as 0:
SELECT 
    e.name,
    COALESCE(b.bonus, NULL) as bonus
FROM 
    Employee e
    LEFT JOIN Bonus b ON e.empId = b.empId
WHERE 
    COALESCE(b.bonus, 0) < 1000;
