select * from messy_indian_dataset;

-- Finding outliers based on Z-Score
select *, 
	ABS(purchase_amount - avg(purchase_amount) over()) / STDDEV(purchase_amount) OVER() as 'z_score'
from messy_indian_dataset;

-- Remove outliers based on specific Z-Score
select * from
	(
		select *, 
			ABS(purchase_amount - avg(purchase_amount) over()) / STDDEV(purchase_amount) OVER() as 'z_score'
		from messy_indian_dataset
	) as sub_table where sub_table.z_score < 3;
