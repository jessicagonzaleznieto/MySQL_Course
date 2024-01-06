# SECTION - SQL VIEWS

**SQL View**

- A virtual table whose contents are obtained from an existing table or tables, called *base tables*

- Think of a view object as a view into the base table:

The view itself does not contain any real data; the data is physically stored in the base table. The view simply shows the data contained in the base table


CREATE VIEW view_name AS
SELECT column_1, column_2...
FROM table_name;

- Typically named starting with v or w to indicate it's a view (e.g v_dept_emp_lastest_date)

- A view acts as a shortcut for writing the same SELECT statement every time a new request has been made

- Saves a lot of coding time and occupies no extra memory

- Acts as a dynamic table because it instantly reflects data and structural changes in the base table
<br><br>

**Views - exercise**
Create a view that will extract the average salary of all managers registered in the database. Round this value to the nearest cent.

If you have worked correctly, after executing the view from the “Schemas” section in Workbench, you should obtain the value of 66924.27.

```sql
CREATE VIEW v_avg_mngr_salary AS
    SELECT 
        ROUND(AVG(s.salary), 2) AS avg_mngr_salary
    FROM
        dept_manager dm
            JOIN
        salaries s ON dm.emp_no = s.emp_no;
```
