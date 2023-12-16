# SECTION - Aggregate functions

Aggregate functions gather data from many rows of a table, then aggregate it into a single value
<br><br>
INPUT -> the information contained in multiple rows

OUTPUT -> the single vlaue they provide 
<br><br>
COUNT()

SUM()

MIN()

MAX()

AVG()
<br><br>

Aggregate functions allow us to present summarized information
<br><br>

**COUNT**

Applicable to both numeric and non-numeric data.

COUNT(DISTICT) -> allows to find the number of times unique values are encountered in a given column.

*Aggregate functions typically ignore null values throughout the field to which they are applied*

("typically" because it is only if you have indicated a specific column name within the parentheses)
<br><br>

COUNT(*) -> returns the number of all rows of the table, NULL values included

For COUNT, the parenthesis and the argument must be attached to the name of the aggregate function. No spaces between COUNT and ().
<br><br>

**COUNT() - exercise**

How many departments are there in the “employees” database? Use the ‘dept_emp’ table to answer the question.
<br><br>

```sql
SELECT 
    COUNT(DISTINCT dept_no)
FROM
    dept_emp;
```

**SUM**

SUM and all other aggregate functions, except COUNT, work only with numerical data.
<br><br>

**SUM() - exercise**

What is the total amount of money spent on salaries for all contracts starting after the 1st of January 1997?
<br><br>

```sql
SELECT 
    SUM(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
```
<br><br>

**MIN() and MAX()**

Return the minimum and maximum value of a column
<br><br>

**MIN() and MAX() - exercise**

1. Which is the lowest employee number in the database?

2. Which is the highest employee number in the database?
<br><br>

```sql
SELECT 
    MIN(emp_no)
FROM
    employees;


SELECT 
    MAX(emp_no)
FROM
    employees;
```
<br><br>

**AVG()**

Extracts the average value of all non-null values in a field

**AVG() - exercise**

What is the average annual salary paid to employees who started after the 1st of January 1997?
<br><br>

```sql
SELECT 
    AVG(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';

```
<br><br>

**ROUND()**

ROUND(#,decimal_places)
<br><br>

**ROUND() - exercise**

Round the average amount of money spent on salaries for all contracts that started after the 1st of January 1997 to a precision of cents.
<br><br>

```sql
SELECT 
    ROUND(AVG(salary), 2)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
```
<br><br>

**IFNULL() and COALESCE()**


IFNULL(empression_1,expression_2) -> returns the first of the two indicated values if the data value found in the table is not null, and returns the second value if there is a null value.
*IFNULL(false, true)*

IFNULL cannot contain more than two parameters
<br><br>

COALESCE(expression_1, expression_2, expression_3...expression_n) -> allows to insert n arguments in the parentheses.

COALESCE() will always return a single value of the ones we have within the parentheses, and this value will be the first non-null value of this list, reading left to right

IFNULL() and COALESCE() do not make any changes to the database, they simply show outputs where certain data values appear in place of NULL values
<br><br>

**Another example of using COALESCE() - exercise 1**

Select the department number and name from the ‘departments_dup’ table and add a third column where you name the department number (‘dept_no’) as ‘dept_info’. If ‘dept_no’ does not have a value, use ‘dept_name’.
<br><br>

```sql
SELECT
    dept_no,
    dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    departments_dup
ORDER BY dept_no ASC;
```
<br><br>

**Another example of using COALESCE() - exercise 2**

Modify the code obtained from the previous exercise in the following way. Apply the IFNULL() function to the values from the first and second column, so that ‘N/A’ is displayed whenever a department number has no value, and ‘Department name not provided’ is shown if there is no value for ‘dept_name’.
<br><br>

```sql
SELECT
    IFNULL(dept_no, 'N/A') as dept_no,
    IFNULL(dept_name,
            'Department name not provided') AS dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    departments_dup
ORDER BY dept_no ASC;
```
<br><br>




