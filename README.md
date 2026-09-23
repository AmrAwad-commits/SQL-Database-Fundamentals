# SQL & Database Fundamentals

A collection of my **SQL Server and Database Fundamentals** notes, examples, and practice queries.

This repository documents my learning journey with relational databases using **Microsoft SQL Server / T-SQL**.

## Topics Covered

* DDL — Data Definition Language

  * `CREATE`
  * `ALTER`
  * `DROP`

* DML — Data Manipulation Language

  * `INSERT`
  * `UPDATE`
  * `DELETE`

* DQL — Data Query Language

  * `SELECT`
  * `WHERE`
  * `DISTINCT`
  * `ORDER BY`

* Joins

  * `INNER JOIN`
  * `LEFT JOIN`
  * `RIGHT JOIN`
  * `FULL OUTER JOIN`
  * `CROSS JOIN`
  * `SELF JOIN`
  * Multiple-table joins

* SQL Functions

  * `ISNULL`
  * `COALESCE`
  * `CONVERT`
  * `CONCAT`
  * `SUBSTRING`
  * `YEAR`
  * `MONTH`
  * `DAY`

* Pattern Matching

  * `LIKE`
  * `%`
  * `_`
  * Character ranges and sets

* Aggregate Functions

  * `SUM`
  * `COUNT`
  * `MIN`
  * `MAX`
  * `AVG`

* Grouping

  * `GROUP BY`
  * `HAVING`

* Subqueries

  * Scalar subqueries
  * `IN`
  * `EXISTS`
  * Nested subqueries

* Set Operations

  * `UNION`

* Database Relationships

  * Foreign keys
  * Employee-manager self relationships
  * Employee-dependent relationships
  * Employee-project relationships

## Database Used

The examples primarily use the classic **Company** database schema containing:

* `Employee`
* `Departments`
* `Dependent`
* `Project`
* `Works_for`

## Example Queries

### Find employees in a specific department

```sql
SELECT *
FROM Employee
WHERE Dno = 30;
```

### Find the total hours spent on each project

```sql
SELECT P.Pname, SUM(W.Hours) AS Total_Hours
FROM Project P
INNER JOIN Works_for W
    ON P.Pnumber = W.Pno
GROUP BY P.Pname;
```

### Find departments whose average salary is below the company average

```sql
SELECT D.Dnum,
       D.Dname,
       COUNT(E.SSN) AS NumberOfEmployees
FROM Departments D
INNER JOIN Employee E
    ON D.Dnum = E.Dno
GROUP BY D.Dnum, D.Dname
HAVING AVG(E.Salary) < (
    SELECT AVG(E2.Salary)
    FROM Employee E2
);
```

## Goal

The goal of this repository is to build a strong foundation in **SQL, relational databases, and T-SQL** and to document practical database problems and their solutions.

More advanced SQL topics will be added as I continue learning.

## Technologies

* Microsoft SQL Server
* T-SQL
* SQL Server Management Studio (SSMS)
* Git & GitHub
