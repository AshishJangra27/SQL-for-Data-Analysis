use employees;
select * from Employees;

select * from Employees limit 5;

select * from Employees limit 5 offset 10;

select * from Employees where department = 'Sales' limit 5 offset 0;
select * from Employees where department = 'Sales' limit 5;