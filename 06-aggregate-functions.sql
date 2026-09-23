--============================================
-- Aggregate Functions
--============================================
use Company_SD

select sum(salary) from Employee
select count(salary) from Employee
select min(salary) from Employee
select max(salary) from Employee

select avg(salary) from Employee          -- sum(salary) / count(salary)  -> e.g. 1621

select sum(salary) / count(*) from Employee    -- e.g. 1418 — slower: 2 aggregate functions

select avg(isnull(salary, 0)) from Employee    -- e.g. 1418 — NULLs treated as 0,
                                                -- so count(salary) = count(*); faster: 1 aggregate function

update Employee
set salary = NULL
where Fname = 'Ahmed'

--============================================
-- Aggregate + GROUP BY
--============================================

select min(Salary), Dno
from Employee
group by Dno

select count(Salary), Dno
from Employee
group by Dno

--============================================
-- Aggregate + GROUP BY + WHERE + HAVING
--============================================

select sum(salary), Dno
from Employee
where Dno in (10, 30)
group by Dno
having sum(Salary) >= 1000

select isnull(salary, 0) as salary
from Employee

-- Aggregate + multiple grouping columns
select sum(Salary), D.MGRSSN, D.Dname
from Employee E inner join Departments D
	on D.Dnum = E.Dno
group by D.MGRSSN, D.Dname

-- Updating multiple columns at once
update Employee
set Fname = 'Mona', Sex = 'F'
where SSN = 112233
