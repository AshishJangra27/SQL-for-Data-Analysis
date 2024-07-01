select * from messy_indian_dataset;

-- Add new columns for day, month, and year
alter table messy_indian_dataset
	add column day int,
    add column month int,
    add column year int;
select * from messy_indian_dataset;

-- Update the new columns with the extracted day, month, and year values
update messy_indian_dataset
	set day   = DAY(purchase_date),
		month = MONTH(purchase_date),
		year  = YEAR(purchase_date);
select * from messy_indian_dataset;

-- Add a new column for the day of the week & save day name there
alter table messy_indian_dataset
	add column day_of_week varchar(10);

update messy_indian_dataset
	set day_of_week = DAYNAME(purchase_date);
select * from messy_indian_dataset;


-- Add a new column for the name of the month & save day name there
alter table messy_indian_dataset
	add column month_name varchar(10);

update messy_indian_dataset
	set month_name = MONTHNAME(purchase_date);
select * from messy_indian_dataset;
