/*
Practice Queries — Set 2 (Aggregate / Subquery focus)

1.  Using UNION: (a) name + gender of female dependents depending on a female employee,
    and (b) male dependents depending on a male employee.
2.  For each project, list the project name and the total weekly hours (all employees)
    spent on it.
3.  Display the data of the department whose employees include the smallest employee ID
    overall.
4.  For each department, retrieve the department name and the max, min, and average
    salary of its employees.
5.  List the last name of all managers who have no dependents.
6.  For each department whose average salary is less than the company-wide average
    salary, display its number, name, and number of employees.
7.  Retrieve employees and the projects they work on, ordered by department, then
    alphabetically by last name, first name, within each department.
8.  Get the second-highest salary using a subquery.
9.  Get the names of employees that match any dependent's name.
10. Display the employee number and name of employees who have no dependents (use EXISTS)
    — self-study.
*/

-- 1. Female dependents of female employees UNION male dependents of male employees
select D.Dependent_name, D.Sex
from Employee E inner join Dependent D
	on E.SSN = D.ESSN
where E.Sex = 'F' and D.Sex = 'F'
union
select D.Dependent_name, D.Sex
from Employee E inner join Dependent D
	on E.SSN = D.ESSN
where E.Sex = 'M' and D.Sex = 'M'

-- 2. Total hours per project
select P.Pname, sum(W.Hours) as Total_Hours
from Project P inner join Works_for W
	on P.Pnumber = W.Pno
group by P.Pname

-- 3. Department containing the employee with the smallest SSN
select D.*
from Departments D inner join Employee E
	on D.Dnum = E.Dno
where E.SSN = (select min(E.SSN) from Employee E)

-- 4. Max / min / avg salary per department
select max(E.Salary) as MaxSalary, min(E.Salary) as MinSalary,
       avg(isnull(E.Salary, 0)) as AvgSalary, D.Dname
from Departments D inner join Employee E
	on D.Dnum = E.Dno
group by D.Dname

-- 5. Managers with no dependents
select Y.Lname
from Employee X inner join Employee Y
	on Y.SSN = X.Superssn and Y.SSN not in (select D.ESSN from Dependent D)

-- 6. Departments with below-average salary
select D.Dnum, D.Dname, count(E.SSN) as NumberOfEmployees
from Departments D inner join Employee E
	on D.Dnum = E.Dno
group by D.Dnum, D.Dname
having avg(isnull(Salary, 0)) < (select avg(isnull(Salary, 0)) from Employee)

-- 7. Employees + projects, ordered by department, then last/first name
-- (left as an exercise — combine Employee/Works_for/Project with ORDER BY Dno, Lname, Fname)

-- 8. Second-highest salary via subquery
select E.Salary as H_salary
from Employee E
where E.Salary >= (
	select max(E.Salary) from Employee E
	where E.salary != (select max(E.Salary) from Employee E)
)

-- 9. Employees whose first name matches a dependent's first name
select E.Fname
from Employee E
where E.Fname in (
	select LEFT(D.Dependent_name, CHARINDEX(' ', D.Dependent_name + ' ') - 1)
	from Dependent D
)

-- 10. Employees with no dependents (using EXISTS) — self-study exercise
