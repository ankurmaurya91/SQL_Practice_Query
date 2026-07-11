-- Problem: Find the Team Size
-- Difficulty: Easy
-- Source: LeetCode (https://leetcode.com/problems/find-the-team-size/)
-- Topics: Window Functions, GROUP BY, JOIN

-- ============================================================
-- PROBLEM STATEMENT
-- ============================================================
-- Write an SQL query to find the team size of each employee.
-- Each employee belongs to a team, and we need to count how many
-- employees are in the same team.

-- ============================================================
-- TABLE SCHEMA
-- ============================================================
-- Table: Employee
-- employee_id (INT): Primary key, employee ID
-- team_id (INT): Team ID that the employee belongs to

-- ============================================================
-- SAMPLE DATA
-- ============================================================
-- Employee:
-- +-------------+------------+
-- | employee_id | team_id    |
-- +-------------+------------+
-- |     1       |     8      |
-- |     2       |     8      |
-- |     3       |     8      |
-- |     4       |     7      |
-- |     5       |     9      |
-- |     6       |     9      |
-- +-------------+------------+

-- Expected Output:
-- +-------------+------------+
-- | employee_id | team_size  |
-- +-------------+------------+
-- |     1       |     3      |
-- |     2       |     3      |
-- |     3       |     3      |
-- |     4       |     1      |
-- |     5       |     2      |
-- |     6       |     2      |
-- +-------------+------------+

-- ============================================================
-- SOLUTION (Method 1: Using CTE with GROUP BY and JOIN)
-- ============================================================
WITH team_counts AS (
    SELECT 
        team_id,
        COUNT(*) AS team_size
    FROM 
        Employee
    GROUP BY 
        team_id
)
SELECT 
    e.employee_id,
    tc.team_size
FROM 
    Employee e
    JOIN team_counts tc ON e.team_id = tc.team_id
ORDER BY 
    e.employee_id;

-- ============================================================
-- SOLUTION (Method 2: Using Window Function)
-- ============================================================
-- This is more efficient as it does a single pass through data
SELECT 
    employee_id,
    COUNT(*) OVER (PARTITION BY team_id) AS team_size
FROM 
    Employee
ORDER BY 
    employee_id;

-- ============================================================
-- EXPLANATION
-- ============================================================
-- Method 1: CTE with GROUP BY and JOIN
-- 1. Create a CTE that counts employees per team
-- 2. Join Employee table with the team_counts CTE
-- 3. Returns employee_id with corresponding team_size
--
-- Method 2: Window Function (RECOMMENDED)
-- 1. COUNT(*) OVER (PARTITION BY team_id) counts all employees
--    in the same team as the current row
-- 2. More efficient - single pass through data
-- 3. Window function approach is preferred for performance
--
-- Key Concepts:
-- - PARTITION BY: Divides rows into groups based on team_id
-- - COUNT(*) OVER: Counts total rows in each partition
-- - This ensures each employee gets the team size
