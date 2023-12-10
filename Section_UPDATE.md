# SECTION - UPDATE STATEMENT

**UPDATE** -> Used to update the values of existing records in a table
<br><br>

UPDATE table name

SET column_1 = value_1, column_2 = value_2...

WHERE conditions;
<br><br>

UPDATE employees

SET

    first_name = 'Stella',

    last_name = 'Parkinson',

    birth_date = '1990-12-31',

    gender = 'F'

WHERE
    
    emp_no = 999901;
<br><br>

WHERE clause is very important here. If no conditions provided, all rows of the table will be updated
<br><br>

**The UPDATE Statement – Part II - exercise**

Change the “Business Analysis” department name to “Data Analysis”.

Hint: To solve this exercise, use the “departments” table.


```sql
USE employees;

SELECT 
    *
FROM
    departments;

UPDATE departments 
SET 
    dept_name = 'Data Analysis'
WHERE
    dept_no = 'd010';
```
