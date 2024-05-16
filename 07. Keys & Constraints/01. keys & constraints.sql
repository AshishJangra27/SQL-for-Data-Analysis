-- Primary Key
DROP Table if EXISTS Employees;
CREATE TABLE if not exists Employees (
    employee_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50));
Select * from Employees; 

-- Composite Key
DROP Table if EXISTS Orders;
CREATE TABLE Orders (
    order_id SERIAL,
    customer_id INT,
    order_date DATE,
    PRIMARY KEY (order_id, customer_id));
Select * from Orders; 
DROP Table if EXISTS Orders;

-- Foreign Key
CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Employees (employee_id));
Select * from Orders; 

-- Unique Constrains
DROP Table if EXISTS Employees;
CREATE TABLE if not exists Employees (
    employee_id SERIAL PRIMARY KEY,
    email VARCHAR(50) UNIQUE,
    name VARCHAR(50),
    department VARCHAR(50));
Select * from Employees; 

-- Unique Constrains as Composite Key
DROP Table if EXISTS Employees;
CREATE TABLE if not exists Employees (
    employee_id SERIAL PRIMARY KEY,
    email VARCHAR(50) UNIQUE,
    phone INT UNIQUE,
    name VARCHAR(50),
    department VARCHAR(50),
    UNIQUE (email,phone));
Select * from Employees; 

-- Check Constraint
DROP Table if EXISTS Employees;
CREATE TABLE if not exists Employees (
    employee_id SERIAL PRIMARY KEY,
    email VARCHAR(50) UNIQUE,
    age INT CHECK (age >= 18),
    phone INT UNIQUE,
    name VARCHAR(50),
    department VARCHAR(50),
    UNIQUE (email,phone));
Select * from Employees; 


