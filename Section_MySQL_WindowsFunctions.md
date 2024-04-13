# SECTION - MYSQL WINDOWS FUNCTIONS

**MySQL Windows Functions**

An advanced SQL tool performing a calculation for every record in the data set, using other records associated with the specified one from the table.

MySQL Window Functions can be separated into two types:

- Aggregate window functions: aggregate functions used in the context of window functions
- Non-aggregate window functions: divided into Ranking or Value window functions.
<br><br>

**ROW_NUMBER() RANKING WINDOW FUNCTION**

One of the syntax available for applying window functions:
SELECT
    ...,
    ROW_NUMBER() OVER () AS...
FROM
    ...
;

*The OVER clause relates to the window over which the function evaluation will occur. The OVER clause will lead to a window specification (we will define how we want to organize the rows where the ROW NUMBER function will be providing rank values)*

PARTITION BY -> The data will be organized into partitions

SELECT
    ...,
    ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary DESC) AS...
FROM
    ...
;
<br><br>

**The ROW_NUMBER() Ranking Window Function - Exercises**

Exercise #1 :

Write a query that upon execution, assigns a row number to all managers we have information for in the "employees" database (regardless of their department).

Let the numbering disregard the department the managers have worked in. Also, let it start from the value of 1. Assign that value to the manager with the lowest employee number.

```sql
SELECT
	emp_no,
    dept_no,
    ROW_NUMBER() OVER (ORDER BY emp_no) AS row_num
FROM dept_manager;
```
<br><br>

Exercise #2:

Write a query that upon execution, assigns a sequential number for each employee number registered in the "employees" table. Partition the data by the employee's first name and order it by their last name in ascending order (for each partition).

```sql
SELECT
	emp_no,
    first_name,
    last_name,
    ROW_NUMBER() OVER(PARTITION BY first_name ORDER BY last_name ASC) AS row_num
FROM employees;
```

**RANK() and DENSE_RANK()**

- They all require the use of the OVER clause
- The rank values they provide are always assigned sequentially
- The first rank is always equal to the integer 1, and the subsequent rank values grow incrementally by 1, except for the duplicate records potentially

**The MySQL RANK() and DENSE_RANK() Window Functions - Exercises**
<br><br>

Exercise #1:

Write a query containing a window function to obtain all salary values that employee number 10560 has ever signed a contract for.

Order and display the obtained salary values from highest to lowest.

```sql
SELECT
	emp_no,
    salary,
    ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary DESC) AS row_num
FROM salaries
WHERE emp_no = '10560';
```
<br><br>

Exercise #2:

Write a query that upon execution, displays the number of salary contracts that each manager has ever signed while working in the company.

```sql
SELECT
    dm.emp_no, (COUNT(salary)) AS no_of_salary_contracts
FROM
    dept_manager dm
        JOIN
    salaries s ON dm.emp_no = s.emp_no
GROUP BY emp_no
ORDER BY emp_no;
```
<br><br>

Exercise #3:

Write a query that upon execution retrieves a result set containing all salary values that employee 10560 has ever signed a contract for. Use a window function to rank all salary values from highest to lowest in a way that equal salary values bear the same rank and that gaps in the obtained ranks for subsequent rows are allowed.

```sql
SELECT
    emp_no,
    salary,
    RANK() OVER w AS rank_num
FROM
    salaries
WHERE emp_no = 10560
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);
```
<br><br>

Exercise #4:

Write a query that upon execution retrieves a result set containing all salary values that employee 10560 has ever signed a contract for. Use a window function to rank all salary values from highest to lowest in a way that equal salary values bear the same rank and that gaps in the obtained ranks for subsequent rows are not allowed.


```sql
SELECT
	emp_no,
	salary,
	DENSE_RANK() OVER w AS rank_num
FROM
	salaries
WHERE emp_no = 10560
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);
```