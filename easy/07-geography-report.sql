-- Problem: Geography Report
-- Difficulty: Easy
-- Source: LeetCode (https://leetcode.com/problems/unpivot-names-and-countries/)
-- Topics: CASE Expression, Window Functions, Pivoting, ROW_NUMBER

-- ============================================================
-- PROBLEM STATEMENT
-- ============================================================
-- Pivot the continent column so each name is sorted alphabetically
-- and displayed underneath its corresponding continent.
-- Output headers should be: America, Asia, Europe
-- Each row should show one name from each continent (sorted)

-- ============================================================
-- TABLE SCHEMA
-- ============================================================
-- Table: Student
-- name (VARCHAR): Student name
-- continent (VARCHAR): Continent where student is from
--                     Values: 'America', 'Asia', 'Europe'

-- ============================================================
-- SAMPLE DATA
-- ============================================================
-- Student:
-- +---------+-----------+
-- | name    | continent |
-- +---------+-----------+
-- | Jack    | America   |
-- | Pascal  | Europe    |
-- | Xi      | Asia      |
-- | Jane    | America   |
-- +---------+-----------+

-- Expected Output:
-- +---------+------+---------+
-- | America | Asia | Europe  |
-- +---------+------+---------+
-- | Jack    | Xi   | Pascal  |
-- | Jane    | NULL | NULL    |
-- +---------+------+---------+

-- ============================================================
-- SOLUTION
-- ============================================================
SELECT 
    MAX(CASE WHEN continent = 'America' THEN name END) AS America,
    MAX(CASE WHEN continent = 'Asia' THEN name END) AS Asia,
    MAX(CASE WHEN continent = 'Europe' THEN name END) AS Europe
FROM (
    SELECT 
        name,
        continent,
        ROW_NUMBER() OVER (PARTITION BY continent ORDER BY name) AS rn
    FROM 
        Student
) t
GROUP BY 
    rn
ORDER BY 
    rn;

-- ============================================================
-- EXPLANATION
-- ============================================================
-- 1. Subquery with ROW_NUMBER():
--    - PARTITION BY continent: Groups students by continent
--    - ORDER BY name: Sorts names alphabetically within each group
--    - ROW_NUMBER(): Assigns 1, 2, 3... to each name within group
--    - For America: Jack=1, Jane=2
--    - For Asia: Xi=1
--    - For Europe: Pascal=1
--
-- 2. Main Query - Pivoting:
--    - CASE WHEN continent = 'America': Creates America column
--      Returns name if continent is America, NULL otherwise
--    - CASE WHEN continent = 'Asia': Creates Asia column
--    - CASE WHEN continent = 'Europe': Creates Europe column
--
-- 3. MAX() Aggregate:
--    - MAX() selects non-NULL value from CASE statement
--    - When multiple rows have same rn, MAX returns the name
--    - Simplest pivot approach using aggregate + CASE
--
-- 4. GROUP BY rn:
--    - Groups by row number so students are paired correctly
--    - Row 1 has one student per continent
--    - Row 2 has only America student (others are NULL)
--
-- 5. Result:
--    - Columns are continents
--    - Rows show students sorted alphabetically within continents
--    - NULL values appear when continent has fewer students

-- ============================================================
-- KEY CONCEPTS
-- ============================================================
-- - Window Functions: ROW_NUMBER() assigns sequence per partition
-- - PARTITION BY: Divides rows into groups
-- - CASE Expression: Creates conditional columns
-- - MAX() with CASE: Simple pivot technique
-- - Sorting: Names are alphabetically sorted within continents
