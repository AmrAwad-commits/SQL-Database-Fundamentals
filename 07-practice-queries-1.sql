/*
Practice Queries — Set 1 (Joins focus)

1.  Display the department id, name, and the id and name of its manager.
2.  Display the name of the departments and the name of the projects under its control.
3.  Display the full data about all the dependents, associated with the name of the
    employee they depend on.
4.  Display the id, name and location of the projects in Cairo or Alex city.
5.  Display the full data of the projects with a name starting with the letter "a".
6.  Display all employees in department 30 whose salary is between 1000 and 2000 LE monthly.
7.  Retrieve the names of all employees in department 10 who work 10+ hours per week on
    the "AL Rabwah" project.
8.  Find the names of the employees directly supervised by Kamel Mohamed.
9.  Retrieve the names of all employees and the projects they work on, sorted by project name.
10. For each project located in Cairo, find the project number, controlling department name,
    department manager's last name, address, and birthdate.
11. Display all data of the managers.
12. Display all employee data and their dependents' data, even if they have no dependents.
*/

-- Reference: preview the base tables used below
select * from Project
select * from Works_for
select * from Departments
select * from Dependent
select * from Employee

-- 2. Department name + project name it controls
select Dname, Pname
from Departments inner join Employee
	on SSN = MGRSSN
inner join Works_for
	on SSN = ESSn
inner join Project
	on Pnumber = Pno

-- 1. Department id/name + manager id/name
select Dnum, Dname, SSN, Fname
from Departments inner join Employee
	on SSN = MGRSSN

-- 3. Dependent data + name of the employee depended on
select Fname, D.*
from Employee right join Dependent D
	on SSN = ESSN

-- 4. Projects in Cairo or Alex
select Pnumber, Pname, Plocation
from Project
where city = 'Cairo' or City = 'Alex'

-- 5. Projects starting with "a"
select *
from Project
where Pname like 'a%'

-- 6. Employees in dept 30, salary 1000–2000
select *
from Employee
where Dno = 30 and Salary between 1000 and 2000

-- 7. Employees in dept 10, working >=10 hrs on "AL Rabwah"
select Fname
from Departments inner join Employee
	on SSN = MGRSSN and Dno = 10
inner join Works_for
	on SSN = ESSn and Hours >= 10
inner join Project
	on Pnumber = Pno and Pname = 'AL Rabwah'

-- 8. Employees directly supervised by Kamel Mohamed
select x.Fname + ' ' + x.Lname as FullName
from Employee x, Employee y
where y.SSN = x.Superssn and y.Fname + ' ' + y.Lname = 'Kamel Mohamed'

-- 9. Employees + their projects, sorted by project name
select E.Fname + ' ' + E.Lname as [Full Name], P.Pname
from Employee E left join Works_for W
	on E.SSN = W.ESSn
left join Project P
	on P.Pnumber = W.Pno
order by P.Pname

-- 10. Projects in Cairo: project number, dept name, manager last name, address, birthdate
select Pnumber, Dname, Lname, Address, Bdate
from Project P inner join Departments D
	on D.Dnum = P.Dnum and P.City = 'Cairo'
inner join Employee
	on SSN = MGRSSN

-- 11. All managers
select M.*
from Employee E inner join Employee M
	on M.SSN = E.Superssn

-- 12. All employees + their dependents (even if none)
select E.*, D.*
from Employee E left join Dependent D
	on E.SSN = D.ESSN
