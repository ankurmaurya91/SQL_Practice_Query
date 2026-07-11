-- Problem: Customer Placing the Largest Number Orders
-- Difficulty: Easy
-- Source: LeetCode (https://leetcode.com/problems/customer-placing-the-largest-number-of-orders/)
-- Topics: GROUP BY, MAX, CTE, Subquery

-- ============================================================
-- PROBLEM STATEMENT
-- ============================================================
-- Find the customer_number who has placed the largest number
-- of orders. It is guaranteed that exactly one customer will
-- have placed more orders than any other customer.

-- ============================================================
-- TABLE SCHEMA
-- ============================================================
-- Table: Orders
-- order_number (INT): Primary key, unique order identifier
-- customer_number (INT): Customer who placed the order

-- ============================================================
-- SAMPLE DATA
-- ============================================================
-- Orders:
-- +--------------+-----------------+
-- | order_number | customer_number |
-- +--------------+-----------------+
-- | 1            | 1               |
-- | 2            | 2               |
-- | 3            | 3               |
-- | 4            | 3               |
-- +--------------+-----------------+

-- Expected Output:
-- +-----------------+
-- | customer_number |
-- +-----------------+
-- | 3               |
-- +-----------------+
-- (Customer 3 has 2 orders, more than any other customer)

-- ============================================================
-- SOLUTION (Method 1: Using CTE)
-- ============================================================
WITH customer_orders AS (
    SELECT 
        customer_number,
        COUNT(*) AS order_count
    FROM 
        Orders
    GROUP BY 
        customer_number
)
SELECT 
    customer_number
FROM 
    customer_orders
WHERE 
    order_count = (SELECT MAX(order_count) FROM customer_orders);

-- ============================================================
-- SOLUTION (Method 2: Using Subquery)
-- ============================================================
SELECT 
    customer_number
FROM 
    Orders
GROUP BY 
    customer_number
HAVING 
    COUNT(*) = (
        SELECT MAX(order_count)
        FROM (
            SELECT 
                customer_number,
                COUNT(*) AS order_count
            FROM 
                Orders
            GROUP BY 
                customer_number
        ) AS counts
    );

-- ============================================================
-- SOLUTION (Method 3: Using ORDER BY and LIMIT)
-- ============================================================
SELECT 
    customer_number
FROM 
    Orders
GROUP BY 
    customer_number
ORDER BY 
    COUNT(*) DESC
LIMIT 1;

-- ============================================================
-- EXPLANATION
-- ============================================================
-- Method 1 (Recommended - Most Readable):
-- 1. Create CTE with count of orders per customer
-- 2. Find the maximum order count
-- 3. Return customer(s) with maximum order count
--
-- Method 2 (Subquery - More Complex):
-- 1. GROUP BY groups orders by customer
-- 2. HAVING clause filters using a subquery
-- 3. Subquery calculates order counts and finds max
--
-- Method 3 (Simplest - ORDER BY LIMIT):
-- 1. GROUP BY groups orders by customer
-- 2. COUNT(*) counts orders per customer
-- 3. ORDER BY DESC sorts by count descending
-- 4. LIMIT 1 returns only the top customer
--
-- Key Concepts:
-- - GROUP BY customer_number: Groups all orders by customer
-- - COUNT(*): Counts number of orders in each group
-- - MAX(): Finds the maximum count value
-- - Problem guarantees exactly one customer has max orders
