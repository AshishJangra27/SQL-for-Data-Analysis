
-- 1. Simple Index
drop index idx_city on messy_indian_dataset;
create index idx_city on messy_indian_dataset(city);
select name,city,purchase_amount from messy_indian_dataset where city = "Mumbai";


-- 2. Composite Index
drop index idx_city on messy_indian_dataset;
create index idx_city on messy_indian_dataset(city, gender);
select name,city,purchase_amount from messy_indian_dataset where city = "Mumbai";

-- 3. Unique Index
drop index idx_city on messy_indian_dataset;
create unique index idx_city on messy_indian_dataset(id);
select name,city,purchase_amount from messy_indian_dataset where city = "Mumbai";

-- 4. Full-Text Index
drop index idx_city on messy_indian_dataset;
create fulltext index idx_city on messy_indian_dataset(name, email);
select name,city,purchase_amount from messy_indian_dataset where match(name,email) against('Rajesh');


-- This query searches for the exact phrase "Rajesh Patel" in the name and email columns.
select name,city,purchase_amount from messy_indian_dataset where match(name,email) against('Patel');

-- + operator ensures 'Rajesh' must be present, and the - operator ensures 'example' must be absent.
select name,city,purchase_amount from messy_indian_dataset where match(name,email) 
	against('+Patel -Pooja' in boolean mode);