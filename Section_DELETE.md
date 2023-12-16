# SECTION - DELETE STATEMENT

DELETE Statement -> removes records from a database

*Make sure to COMMIT before deleting to be able to ROLLBACK if necessary.*

DELETE FROM table name

WHERE conditions;
<br><br>

ON DELETE CASCADE -> if a specific value from a parent table's primary key has been deleted, all the records from the child table referring to this value will be removed as well.
<br><br>

In the course, when deleting emp_id 999903 from employees table, it removes it from titles table as well because of the ON DELETE CASCADE constraint.
<br><br>

*Make sure to ALWAYS include the conditions in the DELETE statement, or the entire table will be deleted*
<br><br>

**The DELETE Statement – Part II - exercise**


Remove the department number 10 record from the “departments” table.


```sql
USE employees;

COMMIT;

SELECT 
    *
FROM
    departments;
    
DELETE FROM departments 
WHERE
    dept_no = 'd010';
```
<br><br>

**DELETE vs TRUNCATE vs DROP**

DROP -> will remove the table. Unable to roll back to its initial state, or to the last COMMIT statement;

Use DROP TABLE only when sure, that table wont be needed anymore.
<br><br>

TRUNCATE -> will remove all values from a table (like when DELETE without conditions) but the structure of the table will remain intact.

AUTO-INCREMENT will restart.
<br><br>

DELETE -> will remove records, row by row, when conditions specified.
