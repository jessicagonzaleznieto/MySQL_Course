# SECTION - STORED ROUTINES

**Stored routine**

An SQL statement, or a set of SQL statements, that can be stored on the database server

There are two types of stored routines:
- stored procedures
- functions


**Stored Procedures**

When writing a stored procedure, you may need to use a deliminator ($$ or //) to allow SQL to understand that the procedure itself has multiple queries

Query #1;
Query #2;

^When calling the stored routines, SQL would execute query #1 but not #2.

To avoid that:

DELIMITER $$
Query #1;
Query #2
END$$

**Syntax for Stored Procedures**

USE database_name;
DELIMITER $$ (or //)
CREATE PROCEDURE procedure_name() 1*always open and close parentheses*
BEGIN
    SELECT * from employees
    LIMIT 1000;
END$$

DEMILITER ; *reassigning the semicolon as the delimeter*

1*Within the parentheses, you might need to enter parameters; but a procedure can be created without parameters too.*

**Parameters** *represent certain values that the procedure will use to complete the calculation it is supposed to execute*

Example:

Stored procedures to return the first 1000 rows from the employees table

```sql
USE employees;

DROP PROCEDURE IF EXISTS select_employees;

DELIMITER $$
CREATE PROCEDURE select_employees()
BEGIN
    SELECT * FROM employees
    LIMIT 1000;
END$$

DELIMETER ;

CALL employees.select_employees();

```

*When dropping a nonparameterized procedure, we should not write the parentheses at the end*

**Stored procedures - Example - Part II - exercise**

Create a procedure that will provide the average salary of all employees.

Then, call the procedure.

```sql
USE employees;

DROP PROCEDURE IF EXISTS avg_emp_salary;

DELIMITER $$
CREATE PROCEDURE avg_emp_salary()
BEGIN
	SELECT AVG(salary)
    FROM salaries;
END $$

DELIMITER ;

CALL avg_emp_salary;
```

**Stored Procedures with Input Parameters**

A stored routine can perform a calculation that transforms an input value in an output value.

Stored procedures can take an input value and then use it in the query or queries written in the body of the procedure.

The input value is represented by the IN parameter

To add a parameter include (IN paramenter_name parameter_data_type):

```sql
USE employees;

DROP PROCEDURE IF EXISTS avg_emp_salary;

DELIMITER $$
CREATE PROCEDURE avg_emp_salary(IN p_emp_no INTEGER)
BEGIN
	SELECT e.first_name, e.last_name, s.salary, s.from_date, s.to_date
    FROM employees e
        JOIN salaries s ON e.emp_no = s.emp_no
    WHERE e.emp_no = p_emp_no;
END $$

DELIMITER ;

CALL avg_emp_salary(11300);
```

To execute, you can also look for the stored procedure and click on the Execute button, then enter an input value for the parameter

**Stored Procedures with Output Parameters**

```sql
USE employees;

DROP PROCEDURE IF EXISTS avg_emp_salary_out;

DELIMITER $$
CREATE PROCEDURE avg_emp_salary_out(IN p_emp_no INTEGER, OUT p_avg_salary DECIMAL(10,2))
BEGIN
	SELECT AVG(s.salary)
INTO p_avg_salary
    FROM employees e
        JOIN salaries s ON e.emp_no = s.emp_no
    WHERE e.emp_no = p_emp_no;
END $$

DELIMITER ;

CALL avg_emp_salary_out(11300);
```

*Every time you create a procedure containing both IN and OUT parameters, use the SELECT...INTO... structure*

**Stored procedures with an output parameter - exercise**

Create a procedure called ‘emp_info’ that uses as parameters the first and the last name of an individual, and returns their employee number.

```sql
USE employees;

DROP PROCEDURE IF EXISTS emp_info;

DELIMITER $$
CREATE PROCEDURE emp_info(IN p_emp_first_name VARCHAR(255), p_emp_last_name VARCHAR(255), OUT p_emp_no INTEGER)
BEGIN
SELECT
	e.emp_no
INTO p_emp_no
	FROM employees e
WHERE e.first_name = p_emp_first_name
	AND e.last_name = p_emp_last_name;
END$$

DELIMITER ;
```

**Variables**

Input parameter = argument

Output parameter = variable

To create a variable:

```sql

SET @v_avg_salary = 0
CALL employees.avg_emp_salary_out('11300', @v_avg_salary);
SELECT @v_avg_salary;

```

MySQL does exactly the same operation when clicking on the Execute button right next to the stored procedure

**Variables - exercise**

Create a variable, called ‘v_emp_no’, where you will store the output of the procedure you created in the last exercise.

Call the same procedure, inserting the values ‘Aruna’ and ‘Journel’ as a first and last name respectively.

Finally, select the obtained output.

```sql
SET @v_emp_no = 0;
CALL emp_info('Aruna','Journel',@v_emp_no);
SELECT @v_emp_no;
```

**User-Defined Functions**

Syntax:

DELIMETER $$
CREATE FUNCTION function_name(parameter data_type) RETURNS data_type
BEGIN
DECLARE variable_name data_type

    SELECT...
RETURN variable_name
END$$
DELIMITER ;

*No out parameters to define between the parentheses*
*There are no OUT parameters but there is a RETURN value*

MySQL might give Error 1418 after executing. In this case, write DETERMINISTIC or NO SQL or READS SQL DATA after CREATE FUNCTION row

**User-defined functions in MySQL - exercise**

Create a function called ‘emp_info’ that takes for parameters the first and last name of an employee, and returns the salary from the newest contract of that employee.

Finally, select this function.

```sql

DELIMITER $$

CREATE FUNCTION f_emp_info(p_emp_first_name VARCHAR(255), p_emp_last_name VARCHAR(255)) RETURNS INTEGER
DETERMINISTIC
BEGIN
DECLARE v_newest_salary INTEGER;

SELECT MAX(s.salary)
INTO v_newest_salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
WHERE e.first_name = p_emp_first_name
	AND e.last_name = p_emp_last_name;
    
RETURN v_newest_salary;
END$$

DELIMITER ;

SELECT f_emp_info('aruna','journel');
```

**Stored Procedures vs User-Defined Functions**

Stored Procedures

-Does not return a value
-CALL procedure;
-Can have multiple OUT parameters
Functions

-Return a value
-SELECT function;
-Can return a single value only