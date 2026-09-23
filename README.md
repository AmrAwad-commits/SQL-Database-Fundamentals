# SQL Database Fundamentals

A personal study summary covering the core fundamentals of SQL and relational databases — written and organized while learning database concepts (based on the classic "Company" schema: `Employee`, `Departments`, `Project`, `Works_for`, `Dependent`).

## 📚 Topics Covered

- **DDL (Data Definition Language)** — `CREATE`, `ALTER`, `DROP` table statements
- **DML (Data Manipulation Language)** — `INSERT`, `UPDATE`, `DELETE`
- **DQL (Data Query Language)** — `SELECT`, `DISTINCT`, `WHERE`, `ORDER BY`
- **Joins** — Cross Join, Inner Join, Left/Right/Full Outer Join, Self Join, Multi-table Join
- **String & Utility Functions** — `ISNULL`, `COALESCE`, `CONVERT`, `CONCAT`, `LIKE` (with wildcard pattern cheatsheet)
- **Aggregate Functions** — `SUM`, `COUNT`, `MIN`, `MAX`, `AVG`, combined with `GROUP BY` and `HAVING`
- **Subqueries & Set Operators** — `UNION`, correlated subqueries, `EXISTS`
- **Practice Queries** — Two full sets of hands-on exercises with solutions, based on a company database (departments, projects, employees, dependents)

## 📂 Files

| File | Description |
|---|---|
| [`01-ddl.sql`](01-ddl.sql) | Creating, altering, and dropping tables |
| [`02-dml.sql`](02-dml.sql) | Inserting, updating, and deleting data |
| [`03-dql-basics.sql`](03-dql-basics.sql) | Basic SELECT queries, DISTINCT, WHERE, LIKE, ORDER BY |
| [`04-joins.sql`](04-joins.sql) | Cross, inner, outer, self, and multi-table joins |
| [`05-functions.sql`](05-functions.sql) | ISNULL, COALESCE, CONVERT, CONCAT, date/string functions |
| [`06-aggregate-functions.sql`](06-aggregate-functions.sql) | SUM, COUNT, AVG, MIN, MAX with GROUP BY / HAVING |
| [`07-practice-queries-1.sql`](07-practice-queries-1.sql) | 12 practice queries (joins-focused) with solutions |
| [`08-practice-queries-2.sql`](08-practice-queries-2.sql) | 10 practice queries (aggregate/subquery-focused) with solutions |
| [`09-dml-exercises.sql`](09-dml-exercises.sql) | Real-world style DML scenarios (hiring, promotions, terminations) |

## 🗄️ Sample Schema

These examples are based on the well-known **Company database** schema, commonly used in database courses:

- `Employee` (SSN, Fname, Lname, Sex, Salary, Superssn, Dno, ...)
- `Departments` (Dnum, Dname, MGRSSN, ...)
- `Project` (Pnumber, Pname, Plocation/City, Dnum, ...)
- `Works_for` (ESSN, Pno, Hours)
- `Dependent` (ESSN, Dependent_name, Sex, ...)

## 🎯 Purpose

This repository is a personal learning log meant for revision and reference. Contributions, corrections, and suggestions are welcome!

## 📝 License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.
