# SECTION -  SQL JOINS

Joins -> SQL tool that allows us to construct relationships between objects.

A join shows a result set, containing fields derived from two or more tables.


For joins:

We must find a related column from the two tables that contain the same type of data.

We will be free to add columns from these two tables to our output.

The columns you use to relate tables must represent the same object, such as id.

The tables you are considering need not be logically adjacent.
<br><br>

SELECT
    table_1.column_name(s), table_2.column_name(s)
FROM
    table_1
JOIN
    table_2 ON table_1.column_name = table_2.column_name;
<br><br>

**INNER JOINS**
<br><br>
Inner joins extract only records in which the values in the related columns match.

Null values, or values appearing in just one of the two tables and not appearing in the other, are not displayed.

Only non-null matching values are in play.
<br><br>

**INNER JOIN - Part II - exercise**

Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date. 
<br><br>

```sql
SELECT 
    m.emp_no, e.first_name, e.last_name, m.dept_no, m.from_date
FROM
    dept_manager_dup m
INNER JOIN employees e ON m.emp_no = e.emp_no
ORDER BY emp_no;
```
<br><br>

INNER JOIN = JOIN -> SQL will proceed in the same way
<br><br>

To avoid seeing duplicate records on your result:

GROUP BY the field that differs the most among records (emp_id for example)


**LEFT JOIN**
<br><br>

1. Includes all matching values of the two tables and
2. All values from the left table that match no values from the right table
<br><br>

When working with LEFT JOINs, the order in which you join tables matters.


LEFT JOIN = LEFT OUTER JOIN
<br><br>

Picture JOINs as a Venn Diagram. Inner joins are the middle of both circles. Left joins are center and left circle.

**LEFT JOIN - Part II - exercise**

Join the 'employees' and the 'dept_manager' tables to return a subset of all the employees whose last name is Markovitch. See if the output contains a manager with that name.  

Hint: Create an output containing information corresponding to the following fields: ‘emp_no’, ‘first_name’, ‘last_name’, ‘dept_no’, ‘from_date’. Order by 'dept_no' descending, and then by 'emp_no'.


```sql
SELECT 
    e.emp_no, e.first_name, e.last_name, m.dept_no, m.from_date
FROM
    employees e
        LEFT JOIN
    dept_manager_dup m ON e.emp_no = m.emp_no
WHERE
    e.last_name = 'Markovitch'
ORDER BY emp_no;
```
<br><br>
*Inner join would give me the result of the employees who are also managers with last name 'Markovitch' but left join gives me a list of employees with that last name, with dept_no and from_date as null, (because they are not managers) and then a not null result for the employee whose last name is 'Markovitch' AND is a manager.
<br><br>

**RIGHT JOIN**
<br><br>
Their functionality is identical to LEFT JOINs, with the only difference being that the direction of the operation is inverted (right side of the Venn Diagram)


RIGHT JOIN = RIGHT OUTER JOIN
<br><br>

**The new and the old join syntax - exercise**

Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date. Use the old type of join syntax to obtain the result.

```sql
SELECT 
    e.emp_no, e.first_name, e.last_name, m.dept_no, m.from_date
FROM
    dept_manager_dup m,
    employees e
WHERE
    m.emp_no = e.emp_no;
```
<br><br>

**JOIN and WHERE Used Together**
<br><br>

**JOIN and WHERE Used Together - exercise**

Select the first and last name, the hire date, and the job title of all employees whose first name is “Margareta” and have the last name “Markovitch”.


```sql
SELECT 
    e.first_name, e.last_name, e.hire_date, t.title
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    e.first_name = 'Margareta'
        AND e.last_name = 'Markovitch'
ORDER BY e.emp_no;
```
<br><br>

**CROSS JOIN**

A cross join will take the values from a certain table and connect them with all the values from the tables we want to join it with

INNER JOIN -> typically connects only the matching values

CROSS JOIN
<br><br>

A Cross Join, also known as a Cartesian Join, is a type of join in SQL that produces the Cartesian product of two tables involved in the join. It generates a result set in which each row from the first table is combined with every row from the second table. In other words, it creates all possible combinations of rows between the tables.
<br><br>

**Syntax of Cross Join:**
The syntax for a Cross Join in SQL typically involves specifying the tables involved in the join without any specific join condition:


```sql
Copy code
SELECT * 
FROM table1
CROSS JOIN table2;
```
<br><br>

Example:
Consider two hypothetical tables: products and customers.

```sql
SELECT *
FROM products
CROSS JOIN customers;
```
<br><br>

This query would produce a result set where each row from the products table is combined with every row from the customers table, resulting in a Cartesian product of the two tables.

**Characteristics and Considerations:**
- Size of Result Set: A cross join between two tables with 'm' and 'n' rows respectively would produce 'm x n' rows in the resulting Cartesian product.

- No Join Condition: Unlike other joins (e.g., INNER JOIN, LEFT JOIN, etc.), a Cross Join does not require or use any specific join condition. It combines every row from the first table with every row from the second table.

- Performance Impact: Cross Joins can generate a large result set, which can have performance implications, especially when working with tables containing a large number of rows.

- Common Use Cases:
Generating Combinations: Cross Joins are used when you need to generate all possible combinations between rows in two tables.

- Data Exploration: They can be helpful in some analytical scenarios when exploring data relationships or producing data sets for further processing.
<br><br>

JOIN without ON is not considered a best practice

In that case, best practice would be to use a CROSS JOIN
<br><br>

**CROSS JOIN - exercise 1**

Use a CROSS JOIN to return a list with all possible combinations between managers from the dept_manager table and department number 9.
<br><br>

```sql
SELECT 
    *
FROM
    dept_manager m
        CROSS JOIN
    departments_dup d
WHERE
    d.dept_no = 'd009'
ORDER BY d.dept_no;
```
<br><br>

**CROSS JOIN - exercise 2**
Return a list with the first 10 employees with all the departments they can be assigned to.

Hint: Don’t use LIMIT; use a WHERE clause.
<br><br>

```sql
SELECT 
    *
FROM
    employees e
        CROSS JOIN
    departments_dup d
WHERE
    e.emp_no < '10011'
ORDER BY e.emp_no, d.dept_name;
```
<br><br>

**Join more than two tables in SQL - exercise**

Select all managers’ first and last name, hire date, job title, start date, and department name.
<br><br>


```sql
SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    t.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
        JOIN
    departments d ON dm.dept_no = d.dept_no
WHERE t.title = 'Manager';
```
<br><br>

**Tips and tricks for joins - exercise**

How many male and how many female managers do we have in the ‘employees’ database?
<br><br>

```sql
SELECT
    e.gender, COUNT(dm.emp_no)
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
GROUP BY gender;
```
<br><br>

**UNION ALL**

Used to combine a few SELECT statements in a single output

- You can think of it as a tool that allows you to unify tables

SELECT N columns
FROM table_1
UNION ALL SELECT N columns
FROM table_2;

*We have to select the same number of columns from each table.*

*These columns should have the same name, should be in the same order and should contain related data types.*

When uniting two identically organized tables

- UNION displays only distinct values in the output
- UNION ALL retrieves the duplicates as well