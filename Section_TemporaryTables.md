# SECTION - TEMPORARY TABLES

- Each query (or subquery) in SQL produces a temporary dataset. Only the data in our default database is permanent, unless we drop some of its' tables or the database itself

- Temporary tables are useful when we will need to refer to the result of a query.

Syntax:

```sql
CREATE TEMPORARY TABLE temporary_table_name
SELECT...
FROM...
;
```
<br><br>

- If you want to see/use the values of that temporary table:

```sql
SELECT *
FROM temporary_table_name
```

- Temporary tables are valid only within the scope of a MySQL session and not beyond

- Temporary tables cannot be invoked more than once. They cannot be used in self-joins, UNION or UNION ALL. We need to use in a combination with ctes.

**MySQL Temporary Tables in Action - Exercise**

Exercise #1:

Store the highest contract salary values of all male employees in a temporary table called male_max_salaries.

```sql
CREATE TEMPORARY TABLE male_max_salaries
SELECT 
	s.emp_no,
    MAX(s.salary)
FROM salaries s
JOIN employees e ON e.emp_no = s.emp_no AND e.gender = 'M'
GROUP BY s.emp_no;
```

Exercise #2:

Write a query that, upon execution, allows you to check the result set contained in the male_max_salaries temporary table you created in the previous exercise.

```sql
SELECT * 
FROM male_max_salaries;
```