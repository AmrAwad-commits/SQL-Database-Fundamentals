--============================================
-- Utility & String Functions
--============================================

-- ISNULL(x, y) -> if x is NULL, return y
select isnull(Superssn, 0)
from Employee

-- COALESCE(x, y, z, ...) -> returns the first non-NULL value in the list
select coalesce(Superssn, Dno, 0)
from Employee

-- CONVERT(datatype, column) -> cast a column to another type
select Fname + ' ' + Lname + ' ' + convert(varchar(50), SSN) as Fullname
from Employee

-- CONCAT(c1, c2, c3, ...) -> concatenates and auto-converts all args to string
select concat(Fname + ' ' + Lname, ' ', SSN) as Fullname
from Employee

--============================================
-- Date / Misc Functions
--============================================

select year(getdate())
select month(getdate())
select day(getdate()) as day
select substring('Amr Mohamed', 1, 3) -- substring(column, start, num_of_chars)
select db_name()
select suser_name()
