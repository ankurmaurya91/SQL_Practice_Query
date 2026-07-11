-- Problem: IMDb Rating
-- Difficulty: Easy
-- Source: LeetCode (https://leetcode.com/problems/retrieve-the-most-recent-orders/)
-- Topics: JOIN, WHERE, LIKE Operator

-- ============================================================
-- PROBLEM STATEMENT
-- ============================================================
-- Retrieve the title and rating of movies from the IMDb dataset
-- that meet the following criteria:
-- - Released in 2014
-- - Genre starts with 'C'
-- - Budget exceeding 4 Crore (40,000,000)

-- ============================================================
-- TABLE SCHEMA
-- ============================================================
-- Table: IMDB
-- movie_id (INT): Primary key
-- title (VARCHAR): Movie title
-- rating (DECIMAL): Movie rating
-- budget (INT): Movie budget

-- Table: Genre
-- movie_id (INT): Foreign key
-- genre (VARCHAR): Genre name

-- ============================================================
-- SAMPLE DATA
-- ============================================================
-- IMDB:
-- +---------+-------------------+--------+----------+
-- | movie_id| title             | rating | budget   |
-- +---------+-------------------+--------+----------+
-- | 1       | Movie 2014        | 8.5    | 50000000 |
-- | 2       | Film 2013         | 7.2    | 45000000 |
-- | 3       | Picture 2014      | 9.0    | 35000000 |
-- +---------+-------------------+--------+----------+

-- Genre:
-- +---------+-------+
-- | movie_id| genre |
-- +---------+-------+
-- | 1       | Comedy|
-- | 2       | Crime |
-- | 3       | Drama |
-- +---------+-------+

-- ============================================================
-- SOLUTION
-- ============================================================
SELECT 
    i.title,
    i.rating
FROM 
    IMDB i
    JOIN Genre g ON i.movie_id = g.movie_id
WHERE 
    i.title LIKE '%2014%'
    AND g.genre LIKE 'C%'
    AND i.budget > 40000000
ORDER BY 
    i.rating DESC;

-- ============================================================
-- EXPLANATION
-- ============================================================
-- 1. JOIN:
--    - Join IMDB table with Genre table using movie_id
--    - Allows us to access both movie info and genre
--
-- 2. WHERE Conditions:
--    - i.title LIKE '%2014%': Title contains "2014"
--      '%' matches any characters before/after 2014
--    - g.genre LIKE 'C%': Genre starts with 'C'
--      'C%' matches 'C' at start, followed by any characters
--    - i.budget > 40000000: Budget exceeds 4 Crore
--      Direct numeric comparison
--
-- 3. LIKE Operator:
--    - '%' = wildcard for any number of characters
--    - '_' = wildcard for single character
--    - 'C%' = starts with C
--    - '%2014%' = contains 2014 anywhere
--
-- 4. SELECT:
--    - Returns only title and rating as requested
--
-- 5. ORDER BY (Optional):
--    - Sorts results by rating in descending order
--    - Highest rated movies first

-- ============================================================
-- ALTERNATIVE APPROACHES
-- ============================================================
-- Using YEAR function and SUBSTRING for date handling:
SELECT 
    i.title,
    i.rating
FROM 
    IMDB i
    JOIN Genre g ON i.movie_id = g.movie_id
WHERE 
    YEAR(i.release_date) = 2014
    AND g.genre LIKE 'C%'
    AND i.budget > 40000000;

-- Using IN clause if multiple genres start with C:
SELECT 
    i.title,
    i.rating
FROM 
    IMDB i
    JOIN Genre g ON i.movie_id = g.movie_id
WHERE 
    i.title LIKE '%2014%'
    AND g.genre IN ('Comedy', 'Crime', 'Cartoon', 'Crime-Thriller')
    AND i.budget > 40000000;
