use swiggy;

-- 1. Syntax Errors
select * form restaurants;

-- 2. Logical Exception
select * from restaurants where rating > 4.0 and rating < 2.0;

-- 3.Data Type Exception
select * from restaurants where rating = 'high';

-- 4. Performance Exception
select * from restaurants where rating = 4.5;

-- 5. Aggregate Function Errors
select city, count(*) from restaurants;

-- 6. Subquery Exception
select * from restaurants where id = (select id from restaurants where city = 'NonExistedCity');

-- 7. Constraint Errors
INSERT into restaurants (id, name, city, rating) 
	values (301,'Invalid','Mumbai',6)

-- Function Errors
-- Indexing Errors
-- Transaction Errors
-- Permission and Access Errors
-- Temporary Table Errors
-- Data Import/Export Errors