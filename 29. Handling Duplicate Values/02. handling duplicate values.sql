select * from messy_indian_dataset;

-- Finding only unique rows
select distinct * from messy_indian_dataset;

-- Finding unique values based on ID
select id
from messy_indian_dataset
group by id
order by id;

-- Finding unique values based on name
select name
from messy_indian_dataset
group by name
order by name;

-- Finding unique values based on id using rank
select id, name, age, gender,email, phone_number , city, state, purchase_amount, purchase_date from (
				select *, row_number() over(partition by id order by id) as 'rank' from messy_indian_dataset
			  ) as subtable
where subtable.rank = 1;

-- Finding unique values based on multiple columns | Rajesh Patel & Patil
select id, name, age, gender,email, phone_number , city, state, purchase_amount, purchase_date from (
				select *, row_number() over(partition by id,name order by id) as 'rank' from messy_indian_dataset
			  ) as subtable
where subtable.rank = 1;

