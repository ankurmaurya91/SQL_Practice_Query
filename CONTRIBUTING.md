# Contributing to SQL Practice Query

Thank you for your interest in contributing to this repository! This document provides guidelines and instructions for contributing.

## 📋 Code of Conduct

- Be respectful and inclusive
- Focus on constructive feedback
- Help others learn and grow
- No harassment or discrimination

## 🐛 Reporting Issues

If you find a bug or have a suggestion:

1. Check if the issue already exists
2. Provide a clear title and description
3. Include relevant SQL code if applicable
4. Specify which problem/file is affected

## ✨ Adding New Problems

### Guidelines

1. **Problem Quality**
   - Problem should be challenging and educational
   - Should cover one or more SQL concepts
   - Real-world or interview-relevant scenarios preferred

2. **Source Attribution**
   - Clearly mention the source (e.g., LeetCode, HackerRank)
   - Provide proper attribution
   - Ensure rights to use the problem

3. **File Naming**
   - Use kebab-case: `01-problem-name.sql`
   - Include difficulty level in directory path
   - Keep names descriptive but concise

4. **File Format**
   ```sql
   -- Problem: Problem Title
   -- Difficulty: Easy/Medium/Hard
   -- Source: LeetCode/Platform URL
   -- Topics: Topic1, Topic2, Topic3

   -- ============================================================
   -- PROBLEM STATEMENT
   -- ============================================================
   -- Clear description of what needs to be solved

   -- ============================================================
   -- TABLE SCHEMA
   -- ============================================================
   -- Table: TableName
   -- Column1 (Type): Description
   -- Column2 (Type): Description

   -- ============================================================
   -- SAMPLE DATA
   -- ============================================================
   -- Input:
   -- +------+-------+
   -- | col1 | col2  |
   -- +------+-------+
   -- | val1 | val2  |
   -- +------+-------+

   -- Expected Output:
   -- +-------+
   -- | result|
   -- +-------+
   -- | output|
   -- +-------+

   -- ============================================================
   -- SOLUTION
   -- ============================================================
   SELECT ...

   -- ============================================================
   -- EXPLANATION
   -- ============================================================
   -- Step-by-step explanation of the solution

   -- ============================================================
   -- ALTERNATIVE APPROACHES
   -- ============================================================
   -- Alternative solution (optional)
   ```

5. **Multiple Solutions**
   - Include at least one working solution
   - Add alternative approaches if they provide learning value
   - Comment on performance implications if relevant

6. **Documentation**
   - Clear problem statement
   - Complete table schemas
   - Sample data and expected output
   - Detailed step-by-step explanation

## 🔧 Improving Existing Problems

### What Can Be Improved

- **Clarity**: Better explanations or problem statements
- **Efficiency**: More optimal solutions
- **Completeness**: Additional approaches or edge cases
- **Documentation**: Clearer comments and explanations
- **Correctness**: Fixing bugs or incorrect solutions

### Steps to Improve

1. Fork the repository
2. Create a new branch: `git checkout -b improve/problem-name`
3. Make your changes
4. Test thoroughly
5. Commit with clear messages
6. Create a Pull Request with detailed description

## 📝 Pull Request Process

1. **Before Submitting**
   - Test your SQL solution thoroughly
   - Verify all file names follow naming conventions
   - Check spelling and grammar
   - Ensure proper formatting

2. **PR Description Should Include**
   - What problem/area is being addressed
   - What changes were made
   - Why these changes improve the repository
   - Any relevant references or links

3. **Review Process**
   - Maintainers will review your PR
   - Feedback or requests for changes may be provided
   - Please be patient and responsive

4. **After Approval**
   - Your contribution will be merged
   - You'll be credited in the repository

## 📚 Difficulty Classification

### Easy
- Straightforward SQL concepts
- 1-2 simple joins
- Basic aggregations
- Simple WHERE clauses
- Good for beginners

### Medium
- Multiple joins or complex joins
- Window functions
- CTEs (Common Table Expressions)
- Multiple aggregations
- Moderate complexity logic

### Hard
- Self-joins
- Complex window functions
- Recursive CTEs
- Complex data transformations
- Multiple nested subqueries

## 🧪 Testing Your SQL

1. **Test Locally**
   ```sql
   -- Create test tables
   CREATE TABLE test_table (
       id INT,
       name VARCHAR(100)
   );

   -- Insert sample data
   INSERT INTO test_table VALUES (1, 'test');

   -- Run your query
   SELECT * FROM test_table;
   ```

2. **Verify Output**
   - Compare with expected output from problem
   - Test edge cases
   - Test with no results
   - Test with multiple results

3. **Performance Check**
   - Use EXPLAIN to analyze query plan (if needed)
   - Note any performance considerations

## 💬 Discussion and Feedback

- Use Issues for discussions about problems
- Share alternative solutions
- Help others understand concepts
- Ask questions if something is unclear

## 🎯 Areas Where We Need Help

- [ ] Adding more medium difficulty problems
- [ ] Creating video explanations
- [ ] Adding problems from other platforms (HackerRank, DataLemur, etc.)
- [ ] Improving explanations for existing problems
- [ ] Adding performance optimization notes
- [ ] Creating problem difficulty ratings from community feedback

## 📞 Questions?

If you have questions about contributing:
1. Check existing issues and discussions
2. Open a new issue with your question
3. Feel free to reach out to maintainers

## ✅ Checklist for Contributors

Before submitting your contribution, ensure:

- [ ] File follows naming conventions (kebab-case)
- [ ] File has `.sql` extension
- [ ] File is in correct difficulty directory
- [ ] Problem statement is clear and complete
- [ ] Table schema is documented
- [ ] Sample data and expected output provided
- [ ] Solution(s) tested and verified
- [ ] Explanation is detailed and clear
- [ ] No grammatical or spelling errors
- [ ] Proper formatting and indentation
- [ ] Source/attribution included
- [ ] Alternative approaches documented

## 🙏 Thank You!

Your contributions make this repository better for everyone learning SQL. Thank you for helping!

---

**Happy Contributing! 🚀**
