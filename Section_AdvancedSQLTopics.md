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
