--============================================
-- DDL (Data Definition Language)
--============================================

-- Create table
create table obj
(
	id int Primary key,
	name varchar(50) default 'Ahmed',
	age tinyint not null,
)

-- Add column
alter table obj add hirdate date default getdate()

-- Edit column type
alter table obj alter column age int not null

-- Delete column
alter table obj drop column age

-- Delete table
drop table obj
