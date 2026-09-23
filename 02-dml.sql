--============================================
-- DML (Data Manipulation Language) — Insert / Update / Delete
--============================================

insert into emp
values (1, 'Amr', null, 26)

insert into emp (name, id)
values ('X', 55), ('Y', 19)

select * from emp

update emp
	set name = 'Y'

update emp
	set name = 'Y'
where id = 1

select * from emp

-- Delete all data
delete from emp

-- Delete one row by PK
delete from emp
where id = 1
