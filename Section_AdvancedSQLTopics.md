# SECTION - ADVANCED SQL TOPICS

**Types of MySQL Variables**

Scope

The region of a computer program where a phenomenon, such as a variable, is considered valid.
<br><br>

**Local Variable**

A variable that is visible only in the BEGIN-END block in which it was created

DECLARE is a  keyword that can be used when creating local variables only
<br><br>

**Session Variable**

Session

A series of information exchange interactions, or a dialogue, between a computer and a user

**Session Variable**

A variable that exists only for the session in which you are operating

- it is defined on our server, and it lives there
- it is visible to the connection being used only

Use keyword SET for session variables -
@ indicates that we are creating a MySQL session variable

```sql
SET @s_var1 = 3;
```
<br><br>

**Global variables**

Global variables apply to all connections related to a specific server

SET GLOBAL var_name=value;

or

SET @@global.var_name=value;

*You cannot set just any variable as global - a specific group of pre-defined variables in MySQL is suitable for this job. They are called system variables*

```sql
SET GLOBAL max_connections = 1000;

SET @@global.max_connections = 1;
```
<br><br>

**User-Defined vs System Variables**

user-defined: variables that can be defined by the user manually

system: variables that are predefined on our system - the MySQL server

Only system variables can be set as global
<br><br>

**SQL Triggers**

In MySQL, a trigger is a set of instructions that are automatically executed ("triggered") in response to a specific event on a particular table or view. The basic syntax to create a trigger in MySQL is as follows:

```sql
CREATE TRIGGER trigger_name
{BEFORE | AFTER} {INSERT | UPDATE | DELETE}
ON table_name
FOR EACH ROW
BEGIN
    -- Trigger body: your SQL statements go here
END;
```

**MySQL Triggers - exercise**

Create a trigger that checks if the hire date of an employee is higher than the current date. If true, set this date to be the current date. Format the output appropriately (YY-MM-DD).

```sql
DELIMITER $$

CREATE TRIGGER emp_hire_date
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
	IF NEW.hire_date > CURRENT_DATE()
    THEN
    SET NEW.hire_date = DATE_FORMAT(CURRENT_DATE(), '%Y-%m-%d');
END IF;

END $$

DELIMITER ;
```
<br><br>

**MySQL Indexes**

The index of a table functions like the index of a book

- data is taken from a column of a table and is stored in a certain order in a distinct place, called an index
- results are delivered faster

Syntax:

CREATE INDEX index_name
ON table_name (column_1, column_2,...)

Composite indexes

Applied to multiple columns, not just a single one

Primary and unique keys are MySQL indexes:

- they represent columns on which a person would typically based their search

To see all indexes created for a specific table, you can run the following code:

```sql
SHOW INDEX FROM table_name FROM database_name;
```

You can also go to the information section for the table under the Indexes tab to find all indexes created.
<br><br>

**MySQL Indexes - exercise 1**

Select all records from the ‘salaries’ table of people whose salary is higher than $89,000 per annum.

Then, create an index on the ‘salary’ column of that table, and check if it has sped up the search of the same SELECT statement.

```sql
SELECT 
    *
FROM
    salaries
WHERE
    salary > '89000';
    
CREATE INDEX i_salary
ON salaries (salary);

SELECT 
    *
FROM
    salaries
WHERE
    salary > '89000';
```
<br><br>

**The CASE Statement**

In SQL, the CASE statement is a conditional expression that allows you to perform conditional logic within a query. It is often used to provide a way to perform different actions based on different conditions. 

The basic syntax of the CASE statement is as follows:

```sql
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    ...
    ELSE default_result
END
```

**The CASE Statement - exercise 1**

Similar to the exercises done in the lecture, obtain a result set containing the employee number, first name, and last name of all employees with a number higher than 109990. Create a fourth column in the query, indicating whether this employee is also a manager, according to the data provided in the dept_manager table, or a regular employee. 

```sql
SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    CASE
        WHEN dm.emp_no IS NOT NULL THEN 'Manager'
        ELSE 'Employee'
    END AS emp_type
FROM
    employees e
        LEFT JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
WHERE
    e.emp_no > '109990';
```

**The CASE Statement - exercise 2**

Extract a dataset containing the following information about the managers: employee number, first name, and last name. Add two columns at the end – one showing the difference between the maximum and minimum salary of that employee, and another one saying whether this salary raise was higher than $30,000 or NOT.

```sql
SELECT 
    dm.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS salary_diff,
    CASE
        WHEN MAX(s.salary) - MIN(s.salary) > '30000' THEN 'Salary increased more than 30k'
        ELSE 'Salary increased less than 30k'
    END AS salary_increase
FROM
    dept_manager dm
		JOIN
    employees e ON dm.emp_no = e.emp_no
		JOIN
    salaries s ON dm.emp_no = s.emp_no
GROUP BY s.emp_no;
```