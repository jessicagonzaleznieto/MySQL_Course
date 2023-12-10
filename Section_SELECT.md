/* 
#SECTION - SELECT STATEMENT#
**SELECT...FROM...** -> Used to retrieve data
SELECT column_1, column _2,... column_n
FROM table_name;

To select all, use:
SELECT *
FROM table_name;

**SELECT - FROM - exercise**
1. Select the information from the “dept_no” column of the “departments” table.
2. Select all data from the “departments” table.
*/

```sql
SELECT 
    dept_no
FROM
    departments;

SELECT 
    *
FROM
    departments
```
/*
**WHERE** clause -> allows us to set conditions

SELECT column_1, column _2,... column_n
FROM table_name
WHERE condition;

**WHERE - exercise**
Select all people from the “employees” table whose first name is “Elvis”.
*/
```sql
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis' /* Always add '' or "" for names */
```    
/* 
**Operators to use with the WHERE clause**
AND
OR
IN - NOT IN
LIKE - NOT LIKE
BETWEEN... AND...
EXISTS - NOT EXISTS
IS NULL - IS NOT NULL
comparison operators
etc.

**AND** -> Allows you to combine two statements in the condition code block

SELECT column_1, column _2,... column_n
FROM table_name
WHERE condition_1 AND condition_2;

**AND - exercise**
Retrieve a list with all female employees whose first name is Kellie. */
```sql
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' AND gender = 'F';
```
/*
**OR** -> conditions set in the same column
AND is for different columns

**OR - exercise**
Retrieve a list with all employees whose first name is either Kellie or Aruna.
*/
```sql
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie'
        OR first_name = 'Aruna';
```       
/*
**Logical operator precedence** -> SQL rules stating that the operator AND needs to be applied first and OR second
AND > OR
Use parenthesis to circumvent the second condition

**Operator precedence - exercise**
Retrieve a list with all female employees whose first name is either Kellie or Aruna.
*/
```sql
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND (first_name = 'Kellie'
        OR first_name = 'Aruna');
```
/*
**IN** operator allows SQL to return name written in the parentheses, if they exist in the table

SELECT 
    *
FROM
    table_name
WHERE
	column_name IN ('condition 1', 'condition 2', 'condition n')

**IN - NOT IN - exercise 1**
Use the IN operator to select all individuals from the “employees” table, whose first name is either “Denis”, or “Elvis”.

**IN - NOT IN - exercise 2**
Extract all records from the ‘employees’ table, aside from those with employees named John, Mark, or Jacob.
*/
```sql
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Denis' , 'Elvis');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('John' , 'Mark', 'Jacob');
```    
/*
**LIKE - NOT LIKE**
Use % as a substitute for a sequence of characters
Use _ to match a single character

SELECT 
    *
FROM
    table_name
WHERE
	column_name LIKE ('Mar%')
    
**LIKE - NOT LIKE - exercise**
Working with the “employees” table, use the LIKE operator to select the data about all individuals, whose first name starts with “Mark”; specify that the name can be succeeded by any sequence of characters.

Retrieve a list with all employees who have been hired in the year 2000.

Retrieve a list with all employees whose employee number is written with 5 characters, and starts with “1000”. 
*/
```sql
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mark%');
    
SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE ('%2000%');


SELECT 
    *
FROM
    employees
WHERE
    emp_no LIKE ('1000_');
```    
/* 
**Wildcard characters - exercise**
Extract all individuals from the ‘employees’ table whose first name contains “Jack”.

Once you have done that, extract another list containing the names of employees that do not contain “Jack”.
*/
```sql
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%Jack%');

SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%Jack%');
```    
/* 
**BETWEEN...AND...**

SELECT 
    *
FROM
    table_name
WHERE
	column_name BETWEEN 'beg_range' AND 'end_range';
    
**BETWEEN - AND - exercise**
Select all the information from the “salaries” table regarding contracts from 66,000 to 70,000 dollars per year.

Retrieve a list with all individuals whose employee number is not between ‘10004’ and ‘10012’.

Select the names of all departments with numbers between ‘d003’ and ‘d006’.

*/
```sql
SELECT 
    *
FROM
    salaries
WHERE
    salary BETWEEN '66000' AND '70000';
    
SELECT 
    *
FROM
    employees
WHERE
    emp_no NOT BETWEEN '10004' AND '10012';

SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no BETWEEN 'd003' AND 'd006';
```
/*
**IS NOT NULL/ IS NULL**

**IS NOT NULL - IS NULL - exercise**
Select the names of all departments whose department number value is not null.
*/
```sql
SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no IS NOT NULL;
```
/* 
**Other comparison operators:**
=,>,<,>=,<=
<> or != ---> not equal, different from

**Other comparison operators - exercise**
Retrieve a list with data about all female employees who were hired in the year 2000 or after.

Hint: If you solve the task correctly, SQL should return 7 rows.

Extract a list with all employees’ salaries higher than $150,000 per annum.
*/
```sql
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND hire_date >= '2000-01-01';
```
/* 
**SELECT DISTINCT** -> selects all distinct, different data values

SELECT DISTINCT column_1, column_2,... column_n
FROM table_name;

**SELECT DISTINCT - exercise**
Obtain a list with all different “hire dates” from the “employees” table.

Expand this list and click on “Limit to 1000 rows”. This way you will set the limit of output rows displayed back to the default of 1000.

In the next lecture, we will show you how to manipulate the limit rows count. 
*/
```sql
SELECT DISTINCT
    hire_date
FROM
    employees;
```
/* 
**Aggregate Functions** -> They are applied to multiple rows of a single column of a table and return an output of a single values

COUNT() -> counts the number of non-null records in a field. Frequently used with DISTINCT

SELECT COUNT(column_name)  <-parentheses after COUNT, with no spaces
FROM table_name;

Use SELECT COUNT(DISTINCT column_name) to obtain the count of unique values

SUM() -> sums all the non-null values in a column
MIN() -> returns the minimum value from the entire list	
MAX() -> returns the maximum value from the entire list	
AVG() -> calculates the average of all the non-null values of a certain column

- Aggregate functions ignore NULL values unless told not to

**Introduction to aggregate functions - exercise**
How many annual contracts with a value higher than or equal to $100,000 have been registered in the salaries table?

How many managers do we have in the “employees” database? Use the star symbol (*) in your code to solve this exercise.
*/
```sql
SELECT 
    COUNT(*)
FROM
    salaries
WHERE
    salary >= '100000';

SELECT 
    COUNT(*)
FROM
    dept_manager;
```    
/*
**ORDER BY** -> to specify an order ASC or DESC for a column

SELECT 
	column_name
FROM 
	table_name
ORDER BY column_1 DESC; <- *ASC order is default if not specified*

Add column names in the ORDER BY clause to order by multiple columns

SELECT 
	column_name
FROM 
	table_name
ORDER BY column_1, column_2; <-ASC is default

Works for strings and values, too

**ORDER BY - exercise**
Select all data from the “employees” table, ordering it by “hire date” in descending order.
*/
```sql
SELECT 
    *
FROM
    employees
ORDER BY hire_date DESC;
```
/* 
**GROUP BY** -> results can be grouped according to a specific field or fields
GROUP BY must be placed immidiately after the WHERE conditions, if any, and just before the ORDER BY clause
GROUP BY is one of the most powerful and useful tools in SQL

SELECT column_name(s)
FROM table_name
WHERE conditions
GROUP BY column_name(s)
ORDER BY column_name(s);

Example:
SELECT 
	first_name
FROM
	employees
	GROUP BY first name; <- Only distinct values will be selected. Basically same as SELECT DISTINCT but GROUP BY will show sorted results

Also, GROUP BY takes longer to execute
**Even though both are similar, in most cases, when you need an aggregate function, GROUP BY must be added in the query, too**

SELECT
	COUNT(first_name)
FROM
	employees
GROUP BY first_name; <- this query would show the count per name without showing the name. 
*Always include the field you have grouped your results by in the select statement*

SELECT
	first_name, COUNT(first_name)
FROM
	employees
GROUP BY first_name;

**Aliases** -> used to rename a selection from your query

SELECT
	first_name, COUNT(first_name) AS names_count <- changes column name from 'COUNT(first_name)' to 'names_count'
FROM
	employees
GROUP BY first_name;

**Using Aliases (AS) - exercise**
This will be a slightly more sophisticated task.

Write a query that obtains two columns. 
The first column must contain annual salaries higher than 80,000 dollars. 
The second column, renamed to “emps_with_same_salary”, must show the number of employees contracted to that salary. 
Lastly, sort the output by the first column.
*/
```sql
SELECT 
    salary, COUNT(emp_no) AS 'emps_with_same_salary'
FROM
    salaries
WHERE
    salary > '80000'
GROUP BY salary
ORDER BY salary;
```
/*
**HAVING** -> refines the output from records that do not satisfy a certain condition.
Frequently implemented with GROUP BY

SELECT column_name(s)
FROM table_name
WHERE conditions
GROUP BY column_name(s)
HAVING conditions
ORDER BY column_name(s);

HAVING is like WHERE but applied to the GROUP BY block
After HAVING, you can have a condition with an aggregate function, while WHERE cannot use aggregate functions within its conditions

SELECT first_name, COUNT(first_name) AS names_count
FROM employees
GROUP BY first_name
HAVING COUNT(first_name) > 250. <- only possible with HAVING, WHERE would show a syntax error
ORDER BY first_name;

**If the condition is an aggregate function, go with HAVING**

**HAVING - exercise**
Select all employees whose average salary is higher than $120,000 per annum.

Hint: You should obtain 101 records.
*/
```sql
SELECT 
    salary, COUNT(emp_no) AS 'emp_salary_count'
FROM
    salaries
GROUP BY salary
HAVING AVG(salary) > '120000'
ORDER BY salary; 
```
 
/*
**WHERE vs HAVING Summary**
WHERE allows us to set conditions that refer to individual subsets of individual rows
						*conditions applied before re-organizing the output into groups*
Aggregate functions - GROUP BY and HAVING
General conditions - WHERE

**WHERE vs HAVING - Part II - exercise**
Select the employee numbers of all individuals who have signed more than 1 contract after the 1st of January 2000.

Hint: To solve this exercise, use the “dept_emp” table.
*/
```sql
SELECT 
    emp_no
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) > 1
ORDER BY emp_no;
```
/*
**LIMIT** -> To limit the number of rows in an query output
SELECT column_name(s)
FROM table_name
WHERE conditions
GROUP BY column_name(s)
HAVING conditions
ORDER BY column_name(s)
LIMIT number; <- enter 10 to see only 10 rows, for example. Useful for top 10, top 5 etc.

**LIMIT - exercise**
Select the first 100 rows from the ‘dept_emp’ table. 
*/
```sql
SELECT 
    *
FROM
    dept_emp
LIMIT 100;
```