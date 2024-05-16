drop table if exists employee;
create table employee (
	employee_id INT, 
    name VARCHAR(50) not null, 
    age INT check (age >= 18), 
    department VARCHAR(50));
select * from employee;

-- Adding new column in a table
alter table employee add column mail varchar(50);
select * from employee;

-- Renaming the column
alter table employee rename column employee_id to id;
select * from employee;

-- Drop the column
alter table employee drop column mail;
select * from employee;