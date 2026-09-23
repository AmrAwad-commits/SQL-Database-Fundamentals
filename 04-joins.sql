--============================================
-- JOINS
--============================================

-- Cross Join
select *
from Work, Project

select *
from Work cross join Project

-- Inner Join
select *
from Work, Project
where Project.Pnum = Work.Pnumber

select *
from Work inner join Project
on Project.Pnum = Work.Pnumber

-- Outer Joins
select Pnumber, Pnum
from Work a left outer join Project b
on a.Pnumber = b.Pnum

select Pnumber, Pnum
from Work a right outer join Project b
on a.Pnumber = b.Pnum

select Pnumber, Pnum
from Work a full outer join Project b
on a.Pnumber = b.Pnum

-- Self Join
select x.Fname, y.Fname
from Employee x, Employee y
where y.SSN = x.Superssn

select x.Fname, y.*
from Employee x, Employee y
where y.SSN = x.Superssn

-- Multi-table Join
select E.Fname + ' ' + E.Lname as Full_Name, P.Pname, P.Plocation
from Employee E, Works_for W, Project P
where E.SSN = W.ESSn and P.Pnumber = W.Pno

-- Same result, written with explicit JOIN syntax
select E.Fname + ' ' + E.Lname as Full_Name, P.Pname, P.Plocation
from Employee E inner join Works_for W
	on E.SSN = W.ESSn
inner join Project P
	on P.Pnumber = W.Pno


use Company_SD

--============================================
-- JOIN combined with DML
--============================================

update Employee
set Salary += 100
from Employee e, Departments d
where d.Dnum = e.Dno and d.Dname = 'DP1'
