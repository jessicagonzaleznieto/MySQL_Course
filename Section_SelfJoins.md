# SECTION - SELF-JOINS

**Self-Join**

- Applied when a table must join itself

*If you'd like to combine certain rows of a table with other rows of the same table*

- The Self-Join will reference both implied tables and will treat them as two separate tables in its operations

- Using aliases is obligatory (e1 and e2, for example)

Example:

```sql
SELECT 
    e1.*
FROM
    emp_manager e1
    JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no;
```




