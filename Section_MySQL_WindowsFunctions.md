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
<br><br>

**LAG() and LEAD() Value Windows Functions**

As opposed to  ranking window functions, value window functions return a value that can be found in the database

LAG() -> returns the value from a specified field of a record that precedes the current row

LEAD() -> returns the value from  a specified field of a record that follows the current row

**The LAG() and LEAD() Value Window Functions - Exercise**
<br><br>
Exercise #1:

Write a query that can extract the following information from the "employees" database:

- the salary values (in ascending order) of the contracts signed by all employees numbered between 10500 and 10600 inclusive

- a column showing the previous salary from the given ordered list

- a column showing the subsequent salary from the given ordered list

- a column displaying the difference between the current salary of a certain employee and their previous salary

- a column displaying the difference between the next salary of a certain employee and their current salary

Limit the output to salary values higher than $80,000 only.

Also, to obtain a meaningful result, partition the data by employee number.
<br><br>

Exercise #2:

The MySQL LAG() and LEAD() value window functions can have a second argument, designating how many rows/steps back (for LAG()) or forth (for LEAD()) we'd like to refer to with respect to a given record.

With that in mind, create a query whose result set contains data arranged by the salary values associated to each employee number (in ascending order). Let the output contain the following six columns:

- the employee number

- the salary value of an employee's contract (i.e. which we’ll consider as the employee's current salary)

- the employee's previous salary

- the employee's contract salary value preceding their previous salary

- the employee's next salary

- the employee's contract salary value subsequent to their next salary

Restrict the output to the first 1000 records you can obtain.


```sql
SELECT
    emp_no,
    salary,
    LAG(salary) OVER w AS previous_salary,
    LEAD(salary) OVER w AS next_salary,
    salary - LAG(salary) OVER w AS diff_salary_current_previous,
    LEAD(salary) OVER w - salary AS diff_salary_next_current
FROM
salaries
    WHERE salary > 80000 AND emp_no BETWEEN 10500 AND 10600
WINDOW w AS (PARTITION BY emp_no ORDER BY salary);
```

Solution #2:

```sql
SELECT
    emp_no,
    salary,
    LAG(salary) OVER w AS previous_salary,
    LAG(salary, 2) OVER w AS 1_before_previous_salary,
    LEAD(salary) OVER w AS next_salary,
    LEAD(salary, 2) OVER w AS 1_after_next_salary
FROM
    salaries
WINDOW w AS (PARTITION BY emp_no ORDER BY salary)
LIMIT 1000;
```