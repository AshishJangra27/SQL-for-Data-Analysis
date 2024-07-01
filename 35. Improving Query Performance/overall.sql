
-- 1. Avoid accessing unnecessary result
select * from messy_indian_dataset;
select id,name, city, purchase_amount from messy_indian_dataset;
select id,name, city, purchase_amount from messy_indian_dataset where purchase_amount > 1000 limit 5;
select id,name, city, purchase_amount, purchase_amount * 1.18 as 'price with gst' from messy_indian_dataset where purchase_amount > 1000 limit 5;


-- 2. Use right kind of JOIN


-- 3. Use of Appropriate Data Types
create table customer_correct(id INT, name varchar(50), description varchar(255));
create table customer_correct(id INT, name varchar(50), description text);


-- 4. Query Execution Plans
explain select id, name, city , purchase_amount from messy_indian_dataset 
where purchase_amount > 1000;

-- 5. Caching
select SQL_CATCH id, name, city , purchase_amount from messy_indian_dataset 
where purchase_amount > 1000;


-- 6. Use of Temporary Tables
create temporary table high_purchase as
	(
		select id, name, city , purchase_amount from messy_indian_dataset 
		where purchase_amount > 1000
	);
    
select * from high_purchase where city = 'Mumbai' ;
select id, name, city , purchase_amount from high_purchase where city = 'Mumbai' ;

-- Partition Table, CTE & Indexing