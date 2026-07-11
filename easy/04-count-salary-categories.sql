-- Problem: Count Salary Categories
-- Difficulty: Easy
-- Source: LeetCode (https://leetcode.com/problems/count-salary-categories/)
-- Topics: CASE Expression, LEFT JOIN, GROUP BY, UNION ALL

-- ============================================================
-- PROBLEM STATEMENT
-- ============================================================
-- Write an SQL query to count the number of bank accounts in
-- each salary category.
-- Categories:
-- - "Low Salary": income < $20,000
-- - "Average Salary": income between $20,000 and $50,000
-- - "High Salary": income > $50,000
-- Result must contain all three categories even if count is 0.

-- ============================================================
-- TABLE SCHEMA
-- ============================================================
-- Table: Accounts
-- account_id (INT): Primary key
-- income (INT): Monthly income for the account

-- ============================================================
-- SAMPLE DATA
-- ============================================================
-- Accounts:
-- +------------+--------+
-- | account_id | income |
-- +------------+--------+
-- | 3          | 108939 |
-- | 2          | 12747  |
-- | 8          | 87709  |
-- | 6          | 91796  |
-- +------------+--------+

-- Expected Output:
-- +----------------+----------------+
-- | category       | accounts_count |
-- +----------------+----------------+
-- | Low Salary     | 1              |
-- | Average Salary | 0              |
-- | High Salary    | 3              |
-- +----------------+----------------+

-- ============================================================
-- SOLUTION
-- ============================================================
WITH all_categories AS (
    SELECT 'Low Salary' AS category
    UNION ALL
    SELECT 'Average Salary'
    UNION ALL
    SELECT 'High Salary'
),
categorized_accounts AS (
    SELECT 
        CASE 
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income >= 20000 AND income <= 50000 THEN 'Average Salary'
            WHEN income > 50000 THEN 'High Salary'
        END AS category
    FROM 
        Accounts
)
SELECT 
    ac.category,
    COUNT(ca.category) AS accounts_count
FROM 
    all_categories ac
    LEFT JOIN categorized_accounts ca ON ac.category = ca.category
GROUP BY 
    ac.category;

-- ============================================================
-- EXPLANATION
-- ============================================================
-- 1. First CTE (all_categories):
--    - Creates a table with all three salary categories
--    - Ensures all categories appear in final result
--    - Uses UNION ALL to combine three SELECT statements
--
-- 2. Second CTE (categorized_accounts):
--    - Assigns each account to a salary category using CASE
--    - CASE evaluates income against three conditions
--    - Returns the matching category for each account
--
-- 3. Main Query:
--    - LEFT JOIN ensures all categories are included
--    - COUNT(ca.category) counts non-NULL values
--    - NULL counts become 0 (no accounts in that category)
--    - GROUP BY ac.category groups results by category
--
-- 4. Why LEFT JOIN?
--    - LEFT JOIN from all_categories ensures all three
--      categories appear in output
--    - If an account doesn't match a category, it's NULL
--    - COUNT counts only non-NULL values, so unmatched = 0

-- ============================================================
-- ALTERNATIVE APPROACHES
-- ============================================================
-- Using UNION with separate queries:
SELECT 
    'Low Salary' AS category,
    COUNT(*) AS accounts_count
FROM 
    Accounts
WHERE 
    income < 20000
UNION
SELECT 
    'Average Salary',
    COUNT(*)
FROM 
    Accounts
WHERE 
    income >= 20000 AND income <= 50000
UNION
SELECT 
    'High Salary',
    COUNT(*)
FROM 
    Accounts
WHERE 
    income > 50000;
