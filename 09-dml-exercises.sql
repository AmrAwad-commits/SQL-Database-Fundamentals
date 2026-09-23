/*
DML Scenario Exercises

1. Insert a new department "DEPT IT" (id = 100) into the department table, with the
   employee whose SSN = 112233 as its manager. The manager's start date is '1-11-2006'.

2. Mrs. Noha Mohamed (SSN = 968574) moved to manage the new department (id = 100), and
   you (SSN = 102672) take over her old position (Dept. 20 manager):
      a. Update her record in the department table.
      b. Update your record to be department 20's manager.
      c. Update employee number 102660 to be supervised by you (SSN = 102672).

3. The company ended its contract with Mr. Kamel Mohamed (SSN = 223344). Delete his data
   from the database, given that you will temporarily take over his position.
   Hint: check whether Mr. Kamel has dependents, is a department manager, supervises any
   employees, or works on any projects — and handle each case before deleting.

4. Update the salaries of all employees working on the "AlRabwah" project by +30%.
*/

-- 1. New department + manager assignment
-- insert into Departments (Dnum, Dname, MGRSSN, MGRSTARTDATE)
-- values (100, 'DEPT IT', 112233, '2006-11-01')

-- 2a. Update Noha Mohamed's department record to manage dept 100
-- update Departments
-- set MGRSSN = 968574, MGRSTARTDATE = getdate()
-- where Dnum = 100

-- 2b. Update your own record to manage dept 20
-- update Departments
-- set MGRSSN = 102672, MGRSTARTDATE = getdate()
-- where Dnum = 20

-- 2c. Put employee 102660 under your supervision
-- update Employee
-- set Superssn = 102672
-- where SSN = 102660

-- 3. Handle Kamel Mohamed's dependents / management role / supervised staff / projects
--    before deleting his employee record
-- delete from Dependent where ESSN = 223344
-- update Departments set MGRSSN = <your SSN> where MGRSSN = 223344
-- update Employee set Superssn = <your SSN> where Superssn = 223344
-- delete from Works_for where ESSn = 223344
-- delete from Employee where SSN = 223344

-- 4. Give a 30% raise to everyone working on "AlRabwah"
-- update Employee
-- set Salary = Salary * 1.3
-- where SSN in (
-- 	select W.ESSn
-- 	from Works_for W inner join Project P
-- 		on W.Pno = P.Pnumber
-- 	where P.Pname = 'AlRabwah'
-- )
