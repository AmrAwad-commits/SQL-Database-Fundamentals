--============================================
-- DQL (Data Query Language) — Basics
--============================================

-- Print all columns of a table
select * from Employee

-- Print specific columns
select SSN, Fname from Employee

-- Print by columns, DISTINCT first
select distinct Lname, Fname from Employee  -- 8 rows
select distinct Lname from Employee         -- 7 rows: duplicate last names collapse

-- Filter rows with WHERE
select SSN, Fname from Employee
where Fname = 'Amr'          -- could also use SSN >= 1 for a simple test

--============================================
-- LIKE — pattern matching ('_' = one char, '%' = 0 or more chars)
--============================================

select *
from Employee
where Fname like '%a'

/*
'%a'        ends with a
'a%'        starts with a
'%a%'       contains a anywhere
'a%h'       starts with a, ends with h
'%a_'       second-to-last char is a
'ahm%'      starts with "ahm"
'[ahm]%'    starts with a, h, or m
'[^ahm]%'   does NOT start with a, h, or m
'[a-h]%'    first char is between a and h
'[^a-h]%'   first char is NOT between a and h
'[346]%'    starts with 3, 4, or 6
'%[%]'      ends with a literal %
'%[_]%'     contains a literal underscore anywhere
'[_]%[_]'   starts and ends with a literal underscore
*/

--============================================
-- ORDER BY
--============================================

select *
from Employee
order by Dno

-- Order by column position (index)
select *
from Employee
order by 9

-- Order by more than one column — ties broken by the next column
select *
from Employee
order by 9, 8

-- Same idea using column names
select *
from Employee
order by Salary desc, Dno asc
