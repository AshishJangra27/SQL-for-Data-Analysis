-- Example - 1
-- Original Query
SELECT id, name, city, purchase_amount
	FROM messy_indian_dataset
		WHERE city = 'Mumbai' AND purchase_amount > 1000 AND gender = 'Male';



-- Simplified Query Using CTE


   
   
-- Example - 2
-- Simplifying Complex Queries



-- Example - 3
-- Reusing the Same Subquery




-- Example - 4
-- Improving Aggregation Performance







SELECT 
    city, 
    COUNT(*) AS num_purchases, 
    SUM(purchase_amount) AS total_purchase, 
    AVG(purchase_amount) AS avg_purchase, 
    MAX(purchase_amount) AS max_purchase
FROM messy_indian_dataset
GROUP BY city
HAVING SUM(purchase_amount) > 100;



WITH PreAggregated AS (
    SELECT 
        city, 
        COUNT(*) AS num_purchases, 
        SUM(purchase_amount) AS total_purchase, 
        AVG(purchase_amount) AS avg_purchase, 
        MAX(purchase_amount) AS max_purchase
    FROM messy_indian_dataset
    GROUP BY city)
SELECT 
    p.city, 
    p.num_purchases, 
    p.total_purchase, 
    p.avg_purchase, 
    p.max_purchase
FROM PreAggregated p
WHERE p.total_purchase > 100;


