use employees;

DROP Table if EXISTS Employees;
CREATE TABLE if not exists Employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    hire_date DATE);
Select * from Employees; 

-- Insert values in single row
insert into Employees(employee_id,first_name, last_name, department_id, hire_date)
	values 	
		(1,'Ashish','Jangra',1,'2021-07-16');
select * from Employees;

-- Insert multiple rows
insert into Employees(employee_id,first_name, last_name, department_id, hire_date)
	values 	
		(2,'Manish','Kumar',2,'2021-10-16'),
        (3,'Sakshi','Awasthi',2,'2021-10-16'),
        (4,'Avneet','Kaur',3,'2021-10-16');
select * from Employees;

-- Add partial data
insert into Employees(first_name, last_name)
	values 	
		('Ashish','Jangra');
select * from Employees;

-- Inserting data in different order
insert into Employees(department_id,hire_date, last_name, first_name)
	values 	
		(1,'2022-10-10','Sakari','Prakash');
select * from Employees;

-- Adding data without order
insert into Employees()
	values 	
		(11,'Ashish','Jangra',5,'2024-10-10');
select * from Employees;

-- Adding current date & default values
DROP Table if EXISTS ExampleTable;
CREATE TABLE if not exists ExampleTable (
    employee_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    hire_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'Active');
Select * from ExampleTable; 

insert into ExampleTable(name) values ('Ashish');
Select * from ExampleTable; 

insert into ExampleTable(name) values ('Ashish'),('Manish'),('Parag');
Select * from ExampleTable; 

insert into ExampleTable(name,status) values ('Ashish','Inactive'),('Manish','Inactive'),('Parag','Inactive');
Select * from ExampleTable; 