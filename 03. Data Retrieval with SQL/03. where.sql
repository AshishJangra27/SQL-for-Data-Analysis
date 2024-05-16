use employees;
select * from Employees;

-- Employees with age more than 30
select * from Employees where age > 30;

-- Employees with age more than 30 from sales
select * from Employees where age > 30 and department = 'sales';

-- Employees with age in range 30 - 40 years
select * from Employees where age >= 30 and age <= 40;
select * from Employees where age between 30 and 40;

 -- Employees from Sales or Marketing
 select * from Employees where department = 'Marketing' or department = 'Sales';
 
 -- Searching for name starting with Jo
 select * from Employees where name like 'Jo%';
 
 -- Getting only not null data of departments
 select * from Employees where department is not null;
 
 -- Getting only not null data throught the table
 select * from Employees where department is not null and age is not null;
 
 -- Getting data using IN command
 select * from Employees where department in ('Sales','Marketing');

-- Getting data using NOT IN command 
 select * from Employees where department not in ('Sales','Marketing');
 
 -- Marketing or Sales people witha ge more than 30
 select * from Employees where (department in ('Sales','Marketing')) and age > 30;