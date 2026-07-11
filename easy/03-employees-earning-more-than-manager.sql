-- Problem: Employees Earning More Than Their Manager
-- Difficulty: Easy
-- Source: LeetCode (https://leetcode.com/problems/employees-earning-more-than-their-managers/)
-- Topics: Self Join, WHERE Clause

-- ============================================================
-- PROBLEM STATEMENT
-- ============================================================
-- Find all employees who earn more than their direct manager.
-- The Employee table contains employee information including
-- their manager ID.

-- ============================================================
-- TABLE SCHEMA
-- ============================================================
-- Table: Employee
-- id (INT): Primary key, employee ID
-- name (VARCHAR): Employee name
-- salary (INT): Employee salary
-- managerId (INT): ID of the employee's manager

-- ============================================================
-- SAMPLE DATA
-- ============================================================
-- Employee:
-- +----+-------+--------+-----------+
-- | id | name  | salary | managerId |
-- +----+-------+--------+-----------+
-- | 1  | Joe   | 70000  | 3         |
-- | 2  | Henry | 80000  | 4         |
-- | 3  | Sam   | 60000  | NULL      |
-- | 4  | Max   | 90000  | NULL      |
-- +----+-------+--------+-----------+

-- Expected Output:
-- +----------+
-- | Employee |
-- +----------+
-- | Joe      |
-- +----------+
-- (Joe earns 70000, which is more than his manager Sam who earns 60000)

-- ============================================================
-- SOLUTION
-- ============================================================
SELECT 
    e.name AS Employee
FROM 
    Employee e
    JOIN Employee m ON e.managerId = m.id
WHERE 
    e.salary > m.salary;

-- ============================================================
-- EXPLANATION
-- ============================================================
-- 1. Self Join:
--    - Join Employee table with itself
--    - e represents the employee
--    - m represents the manager
--    - Join condition: e.managerId = m.id
--
-- 2. Comparison:
--    - WHERE e.salary > m.salary
--    - Compares employee's salary with manager's salary
--
-- 3. Why Self Join Works:
--    - Managers are also employees in the same table
--    - Join condition links employee with their manager
--    - Only returns matches where join condition is satisfied
--
-- 4. Important Notes:
--    - NULL managerId values are automatically excluded (no match)
--    - Employees without managers won't appear in results

-- ============================================================
-- ALTERNATIVE APPROACHES
-- ============================================================
-- Using WHERE clause with subquery:
SELECT 
    e.name AS Employee
FROM 
    Employee e
WHERE 
    e.salary > (
        SELECT salary 
        FROM Employee m 
        WHERE e.managerId = m.id
    );

-- Using IN with subquery (less efficient):
SELECT 
    e.name AS Employee
FROM 
    Employee e
WHERE 
    e.managerId IS NOT NULL
    AND e.salary > (
        SELECT salary 
        FROM Employee m 
        WHERE e.managerId = m.id
    );
