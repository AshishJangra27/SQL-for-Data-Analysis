select * from messy_indian_dataset;

-- Update Name
update messy_indian_dataset 
	set name = trim(name),
	name = LOWER(name);
    
select * from messy_indian_dataset;

-- Update Gender
update messy_indian_dataset 
	set gender = lower(trim(gender));
    
select * from messy_indian_dataset;

-- Update City
update messy_indian_dataset 
	set city = lower(trim(city));
    
select * from messy_indian_dataset;

-- Update State
update messy_indian_dataset 
	set state = lower(trim(state));
    
select * from messy_indian_dataset;

-- Clean & Update email
update messy_indian_dataset 
	set email = trim(REGEXP_REPLACE(lower(email), '[^a-z0-9@.]+',''));

select * from messy_indian_dataset;

-- Clean Phone Number
update messy_indian_dataset 
	set phone_number = REGEXP_REPLACE(phone_number, '[^0-9]+','');

select * from messy_indian_dataset;

-- Extracting username
alter table messy_indian_dataset 
	add column username varchar(30);
    
update messy_indian_dataset 
	set username = SUBSTRING_INDEX(email, '@',1);

select * from messy_indian_dataset;

-- Create location
alter table messy_indian_dataset 
	add column location varchar(50);
    
update messy_indian_dataset 
	set location = CONCAT(city ,', ', state);

select * from messy_indian_dataset;

-- amount_without_gst
alter table messy_indian_dataset 
	add column without_gst decimal(10,2);
    
update messy_indian_dataset 
	set without_gst = purchase_amount * .82;
    
select * from messy_indian_dataset;

-- Adding Expiry Date
alter table messy_indian_dataset 
	add column exp_date DATE;
    
update messy_indian_dataset 
	set exp_date = DATE_ADD(purchase_date, INTERVAL 3 Year);
    
select * from messy_indian_dataset;

-- Removing rows with Invalid Phone Number
delete from messy_indian_dataset
	where length(phone_number) != 10 OR phone_number REGEXP '[^0-9]';
    
select * from messy_indian_dataset;

-- Cleaning Gender even further
update messy_indian_dataset
	set gender = case
					when gender in ('M' ,'m', 'Male', 'MALE','male') then 'M'
					when gender in ('F' ,'f', 'Female', 'FEMALE','female') then 'F'
					else 'other'
					end;
select * from messy_indian_dataset;

-- Cleaning/Validating Age
delete from messy_indian_dataset 
	where age <= 0  or age >= 100;
    
select * from messy_indian_dataset;
