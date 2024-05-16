use employees;
select * from Employees;

-- Sorting the data based on age
select * from Employees order by age;
select * from Employees order by age asc;
select * from Employees order by age desc;

-- Sorting the data based on multiple columns
select * from Employees order by department asc, age asc;

-- Sorting sales data based on age
select * from Employees where department = 'sales' order by age;

-- Sorted age data of not null values
select * from Employees where age is not null order by age asc;

-- Sorted age data of not null values with limit 5
select * from Employees 
where age is not null 
order by age asc
limit 5;

-- Sorting the data based on the length fo the name
select * from Employees order by length(name);