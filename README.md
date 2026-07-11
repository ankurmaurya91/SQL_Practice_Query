# SQL Practice Query

A comprehensive collection of SQL practice problems covering various difficulty levels and topics. This repository contains 24+ curated SQL problems from platforms like LeetCode, designed to help you master advanced SQL concepts.

## 📚 What's Included

- **24+ SQL Problems** organized by difficulty level
- **Problem Statements** with table schemas and examples
- **Multiple Solutions** demonstrating different approaches
- **Detailed Explanations** for understanding query logic
- **Real-World Scenarios** including joins, window functions, CTEs, aggregations, and more

## 🎯 Difficulty Levels

### Easy (7 problems)
Basic SQL fundamentals including simple joins, aggregations, and filtering.
- Employee Bonus
- Find the Team Size
- Employees Earning More Than Their Manager
- Count Salary Categories
- Customer Placing the Largest Number Orders
- IMDb Rating
- Geography Report

### Medium (12 problems)
Intermediate SQL concepts involving multiple joins, window functions, and CTEs.
- CN Banned
- Cumulative Sales
- Calculate Salaries
- Find the Quiet Students in All Exams
- Frequent Order
- Sales Executive
- Total Revenue
- Promotion
- Second Degree Follower
- Sailor having 2nd highest rating
- Average Transaction
- Reformat Table

### Hard (5 problems)
Advanced SQL patterns including self-joins, complex aggregations, and hierarchical queries.
- Clone Table
- Tree Node
- IMDb Genre
- Split Column
- Sale-Manager

## 📁 Directory Structure

```
sql-practice-query/
├── README.md                          # This file
├── CONTRIBUTING.md                    # Guidelines for contributing
├── .gitignore                         # Git ignore rules
├── easy/                              # Easy difficulty problems
│   ├── 01-employee-bonus.sql
│   ├── 02-find-team-size.sql
│   ├── 03-employees-earning-more-than-manager.sql
│   ├── 04-count-salary-categories.sql
│   ├── 05-customer-largest-orders.sql
│   ├── 06-imdb-rating.sql
│   └── 07-geography-report.sql
├── medium/                            # Medium difficulty problems
│   ├── 01-cn-banned.sql
│   ├── 02-cumulative-sales.sql
│   ├── 03-calculate-salaries.sql
│   ├── 04-quiet-students.sql
│   ├── 05-frequent-order.sql
│   ├── 06-sales-executive.sql
│   ├── 07-total-revenue.sql
│   ├── 08-promotion.sql
│   ├── 09-second-degree-follower.sql
│   ├── 10-sailor-2nd-highest.sql
│   ├── 11-average-transaction.sql
│   └── 12-reformat-table.sql
└── hard/                              # Hard difficulty problems
    ├── 01-clone-table.sql
    ├── 02-tree-node.sql
    ├── 03-imdb-genre.sql
    ├── 04-split-column.sql
    └── 05-sale-manager.sql
```

## 🚀 Getting Started

### Prerequisites
- SQL database (MySQL, PostgreSQL, SQL Server, etc.)
- Basic SQL knowledge

### How to Use

1. **Clone the repository**
   ```bash
   git clone https://github.com/ankurmaurya91/SQL_Practice_Query.git
   cd SQL_Practice_Query
   ```

2. **Navigate to difficulty level**
   - Start with `easy/` directory if you're new to SQL
   - Move to `medium/` for intermediate concepts
   - Challenge yourself with `hard/` problems

3. **Open a problem file**
   - Each `.sql` file contains the problem statement, table schema, and solution
   - Read the problem carefully before looking at the solution

4. **Try it yourself first**
   - Attempt to solve the problem before checking the answer
   - Use the provided sample data to test your query

5. **Review the explanation**
   - Understand the approach taken in the solution
   - Learn the SQL concepts and functions used

## 📚 Topics Covered

- **JOINs**: INNER, LEFT, RIGHT, SELF, CROSS joins
- **Aggregation**: GROUP BY, HAVING, aggregate functions
- **Window Functions**: ROW_NUMBER(), RANK(), DENSE_RANK(), SUM() OVER, etc.
- **CTEs**: Common Table Expressions (WITH clause)
- **Subqueries**: Scalar, IN, EXISTS subqueries
- **String Functions**: SUBSTRING_INDEX, CONCAT, UPPER/LOWER, etc.
- **Date Functions**: DATE_SUB, EXTRACT, DATE_DIFF, etc.
- **CASE Statements**: Conditional logic in SQL
- **Set Operations**: UNION, UNION ALL
- **Pivoting**: Unpivot/pivot operations

## 📖 File Format

Each SQL file follows this format:

```sql
-- Problem: [Problem Title]
-- Difficulty: [Easy/Medium/Hard]
-- Source: [LeetCode/Other Platform]
-- Topics: [Topic1, Topic2, Topic3]

-- ============================================================
-- PROBLEM STATEMENT
-- ============================================================
-- [Problem description]

-- ============================================================
-- TABLE SCHEMA
-- ============================================================
-- Table: [TableName]
-- [Column descriptions]

-- ============================================================
-- SAMPLE DATA
-- ============================================================
-- [Sample input]

-- ============================================================
-- SOLUTION
-- ============================================================
-- [SQL Query]

-- ============================================================
-- EXPLANATION
-- ============================================================
-- [Detailed explanation of the approach]

-- ============================================================
-- ALTERNATIVE APPROACHES
-- ============================================================
-- [Alternative solutions if available]
```

## 🤝 Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on:
- Adding new problems
- Fixing existing solutions
- Improving explanations
- Reporting issues

## 📝 License

This project is open source and available under the MIT License.

## 🔗 Resources

- [LeetCode Database Problems](https://leetcode.com/problemset/database/)
- [SQL Tutorial](https://www.w3schools.com/sql/)
- [MySQL Documentation](https://dev.mysql.com/doc/)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)

## 💡 Tips for Learning

1. **Start Simple**: Begin with easy problems to build confidence
2. **Understand First**: Read and understand the problem before coding
3. **Try Different Approaches**: There are often multiple ways to solve a problem
4. **Optimize Gradually**: Focus on correctness first, then optimization
5. **Practice Regularly**: Consistent practice is key to mastery
6. **Explain Your Code**: Understanding why a solution works is crucial

## ⭐ If You Find This Helpful

Please give this repository a star! It helps others discover this resource.

## 📧 Questions?

If you have questions or suggestions, please open an issue or reach out.

---

**Last Updated**: 2026-07-11
**Total Problems**: 24+
**Topics Covered**: 10+
