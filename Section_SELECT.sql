/* 
SECTION - SELECT STATEMENT
SELECT...FROM... -> Used to retrieve data
SELECT column_1, column _2,... column_n
FROM table_name;

To select all, use:
SELECT *
FROM table_name;

SELECT - FROM - exercise
1. Select the information from the “dept_no” column of the “departments” table.
2. Select all data from the “departments” table.
*/

SELECT 
    dept_no
FROM
    departments;

SELECT 
    *
FROM
    departments

/*
WHERE clause -> allows us to set conditions

SELECT column_1, column _2,... column_n
FROM table_name
WHERE condition;

WHERE - exercise
Select all people from the “employees” table whose first name is “Elvis”.
*/

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis' /* Always add '' or "" for names */
    
/* Operators to use with the WHERE clause
AND
OR
IN - NOT IN
LIKE - NOT LIKE
BETWEEN... AND...
EXISTS - NOT EXISTS
IS NULL - IS NOT NULL
comparison operators
etc.

AND -> Allows you to combine two statements in the condition code block

SELECT column_1, column _2,... column_n
FROM table_name
WHERE condition_1 AND condition_2;

AND - exercise
Retrieve a list with all female employees whose first name is Kellie. */

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' AND gender = 'F';

/*
OR -> conditions set in the same column
AND is for different columns

OR - exercise
Retrieve a list with all employees whose first name is either Kellie or Aruna.
*/

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie'
        OR first_name = 'Aruna';
        
/*
Logical operator precedence -> SQL rules stating that the operator AND needs to be applied first and OR second
AND > OR
Use parenthesis to circumvent the second condition

Operator precedence - exercise
Retrieve a list with all female employees whose first name is either Kellie or Aruna.
*/

SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND (first_name = 'Kellie'
        OR first_name = 'Aruna');

/*
IN operator allows SQL to return name written in the parentheses, if they exist in the table

SELECT 
    *
FROM
    table_name
WHERE
	column_name IN ('condition 1', 'condition 2', 'condition n')

IN - NOT IN - exercise 1
Use the IN operator to select all individuals from the “employees” table, whose first name is either “Denis”, or “Elvis”.

IN - NOT IN - exercise 2
Extract all records from the ‘employees’ table, aside from those with employees named John, Mark, or Jacob.
*/

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
    
/*
LIKE - NOT LIKE
Use % as a substitute for a sequence of characters
Use _ to match a single character

SELECT 
    *
FROM
    table_name
WHERE
	column_name LIKE ('Mar%')
    
LIKE - NOT LIKE - exercise
Working with the “employees” table, use the LIKE operator to select the data about all individuals, whose first name starts with “Mark”; specify that the name can be succeeded by any sequence of characters.

Retrieve a list with all employees who have been hired in the year 2000.

Retrieve a list with all employees whose employee number is written with 5 characters, and starts with “1000”. 
*/

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
    
/* 
Wildcard characters - exercise
Extract all individuals from the ‘employees’ table whose first name contains “Jack”.

Once you have done that, extract another list containing the names of employees that do not contain “Jack”.
*/

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
    
/* BETWEEN...AND...

SELECT 
    *
FROM
    table_name
WHERE
	column_name BETWEEN 'beg_range' AND 'end_range';
    
BETWEEN - AND - exercise
Select all the information from the “salaries” table regarding contracts from 66,000 to 70,000 dollars per year.

Retrieve a list with all individuals whose employee number is not between ‘10004’ and ‘10012’.

Select the names of all departments with numbers between ‘d003’ and ‘d006’.

*/

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

/*
IS NOT NULL/ IS NULL

IS NOT NULL - IS NULL - exercise
Select the names of all departments whose department number value is not null.
*/

SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no IS NOT NULL;

/* Other comparison operators:
=,>,<,>=,<=
<> or != ---> not equal, different from */
