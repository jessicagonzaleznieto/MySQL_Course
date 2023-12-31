# SECTION - SUBQUERIES

**SQL Subqueries with IN Nested Inside WHERE**

Subqueries -> queries embedded in a query (subqueries = inner queries = nested queries)

They are part of another query called outer query

(inner select / outer select)
<br><br>

From a processing POV:
1. the SQL engine starts by running the inner query (always included within parentheses)
2. then it uses its returned output, which is intermediate, to execute the outer query

*an outer query can include multiple subqueries, and it is possible to nest inner queries within other inner queries. SQL would execute the innermost query first*
<br><br>

**SQL Subqueries with IN nested inside WHERE - exercise**

Extract the information about all department managers who were hired between the 1st of January 1990 and the 1st of January 1995.

```sql
SELECT 
    *
FROM
    dept_manager
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            employees
        WHERE
            hire_date BETWEEN '1990-01-01' AND '1995-01-01');
```
<br><br>

**SQL Subqueries with EXISTS-NOT EXISTS Nested inside WHERE**

EXISTS

- Checks row by row
- Returns a Boolean value

EXISTS tested row values for existence, while IN searches among values. EXISTS is quicker with large amounts of data, while IN is faster in smaller dataset.
<br><br>
ORDER BY should be included in the outer select.
<br><br>

Subqueries

1. allow for better structuring of the outer query
    - each inner query can be thought of in isolation
2. in some situations, the use of subqueries is much more intuitive compared to the use of complex joins and unions
3. many users prefer subqueries because they offer enhanced code readability
<br><br>

**SQL Subqueries with EXISTS-NOT EXISTS nested inside WHERE - exercise**

Select the entire information for all employees whose job title is “Assistant Engineer”. 

Hint: To solve this exercise, use the 'employees' table.
<br><br>

```sql
SELECT 
    *
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            t.emp_no
        FROM
            titles t
        WHERE
            t.title = 'Assistant Engineer');
```

**SQL Subqueries nested in SELECT and FROM - exercise 1**

Starting your code with “DROP TABLE”, create a table called “emp_manager” (emp_no – integer of 11, not null; dept_no – CHAR of 4, null; manager_no – integer of 11, not null). 

```sql
DROP TABLE IF EXISTS emp_manager;

CREATE TABLE emp_manager (
	emp_no INT(11) NOT NULL,
    dept_no CHAR(4) NULL,
    manager_no INT(11) NOT NULL
);
```

**SQL Subqueries nested in SELECT and FROM - exercise 2**

Fill emp_manager with data about employees, the number of the department they are working in, and their managers.

Your query skeleton must be:

Insert INTO emp_manager SELECT

U.*

FROM

                 (A)

UNION (B) UNION (C) UNION (D) AS U;

A and B should be the same subsets used in the last lecture (SQL Subqueries Nested in SELECT and FROM). In other words, assign employee number 110022 as a manager to all employees from 10001 to 10020 (this must be subset A), and employee number 110039 as a manager to all employees from 10021 to 10040 (this must be subset B).

Use the structure of subset A to create subset C, where you must assign employee number 110039 as a manager to employee 110022.

Following the same logic, create subset D. Here you must do the opposite - assign employee 110022 as a manager to employee 110039.

Your output must contain 42 rows.

Good luck!

```sql
INSERT INTO emp_manager 
SELECT U.*
FROM (
    SELECT A.*
    FROM (
        SELECT 
            e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT emp_no
             FROM dept_manager
             WHERE emp_no = '110022') AS manager_ID
        FROM employees e
        JOIN dept_emp de ON e.emp_no = de.emp_no
        WHERE e.emp_no <= '10020'
        GROUP BY e.emp_no
        ORDER BY e.emp_no
    ) AS A
    
    UNION 
    
    SELECT B.*
    FROM (
        SELECT 
            e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT emp_no
             FROM dept_manager
             WHERE emp_no = '110039') AS manager_ID
        FROM employees e
        JOIN dept_emp de ON e.emp_no = de.emp_no
        WHERE e.emp_no > '10020'
        GROUP BY e.emp_no
        ORDER BY e.emp_no
        LIMIT 20
    ) AS B 
    
    UNION 
    
    SELECT C.*
    FROM (
        SELECT 
            e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT emp_no
             FROM dept_manager
             WHERE emp_no = '110039') AS manager_ID
        FROM employees e
        JOIN dept_emp de ON e.emp_no = de.emp_no
        WHERE e.emp_no = '110022'
        GROUP BY e.emp_no
        ORDER BY e.emp_no
    ) AS C 
    
    UNION 
    
    SELECT D.*
    FROM (
        SELECT 
            e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT emp_no
             FROM dept_manager
             WHERE emp_no = '110022') AS manager_ID
        FROM employees e
        JOIN dept_emp de ON e.emp_no = de.emp_no
        WHERE e.emp_no = '110039'
        GROUP BY e.emp_no
        ORDER BY e.emp_no
    ) AS D
) AS U;
```