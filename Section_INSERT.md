/*
#SECTION - INSERT STATEMENT#

INSERT INTO table name (column_1, column_2...column_n)
VALUES (values_1, values_2...values_n);

To look for all column names within a table, go to 'i' (information) for the table and click on 'Columns' tab.
This will allow you to see restrictions and possible options for all columns, too

Do not write integer within '' since SQL would convert it into a string and it might affect operations later on.
Best practice is not to convert them into strings

**Values must be entered in the exact order that the columns were listed**

**The INSERT statement - exercise 1**
Select ten records from the “titles” table to get a better idea about its content.

Then, in the same table, insert information about employee number 999903. State that he/she is a “Senior Engineer”, who has started working in this position on October 1st, 1997.

At the end, sort the records from the “titles” table in descending order to check if you have successfully inserted the new record.
*/
```sql
SELECT 
    *
FROM
    titles
LIMIT 10;

INSERT INTO employees /* Added record during the lecture*/
VALUES
(
    999903,
    '1977-09-14',
    'Johnathan',
    'Creek',
    'M',
    '1999-01-01'
);
INSERT INTO titles (emp_no, title, from_date, to_date)
VALUES (999903, 'Senior Engineer', '1997-10-01',NULL);

SELECT 
    *
FROM
    titles
ORDER BY emp_no DESC
LIMIT 10;
```
/*
**The INSERT statement - exercise 2**
Insert information about the individual with employee number 999903 into the “dept_emp” table. He/She is working for department number 5, and has started work on  October 1st, 1997; her/his contract is for an indefinite period of time.

Hint: Use the date ‘9999-01-01’ to designate the contract is for an indefinite period.
*/
INSERT INTO dept_emp (emp_no, dept_no, from_date, to_date)
VALUES (999903, 'd005', '1997-10-01', '9999-01-01');
```sql
SELECT 
    *
FROM
    dept_emp
ORDER BY emp_no DESC;
```
/* 
**Inserting Data INTO a New Table - exercise**
Create a new department called “Business Analysis”. Register it under number ‘d010’.

Hint: To solve this exercise, use the “departments” table.
*/
```sql
INSERT INTO departments (dept_no, dept_name)
VALUES ('d010', 'Business Analysis');

SELECT 
    *
FROM
    departments;
```

