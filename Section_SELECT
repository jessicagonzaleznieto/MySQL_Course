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
