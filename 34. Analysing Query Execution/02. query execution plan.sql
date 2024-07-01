
SELECT name, city 
	FROM messy_indian_dataset;
-- 1. FROM
-- 2. SELECT


SELECT name, city, purchase_amount
	FROM messy_indian_dataset
		WHERE purchase_amount > 1000;
-- 1. FROM
-- 2. WHERE
-- 3. SELECT



SELECT name, city, purchase_amount
	FROM messy_indian_dataset
		WHERE purchase_amount > 1000
			ORDER BY purchase_amount DESC;
-- 1. FROM
-- 2. WHERE
-- 3. SELECT
-- 4. ORDER BY
            


SELECT city, AVG(purchase_amount) AS avg_purchase
	FROM messy_indian_dataset
		GROUP BY city;
-- 1. FROM
-- 2. GROUP BY
-- 3. SELECT



SELECT city, AVG(purchase_amount) AS avg_purchase
	FROM messy_indian_dataset
		GROUP BY city
			HAVING AVG(purchase_amount) > 1000;
-- 1. FROM
-- 2. GROUP BY
-- 3. HAVING
-- 4. SELECT


DROP TABLE states;
CREATE TABLE states ( state VARCHAR(50), region VARCHAR(50) );
INSERT INTO states (state, region) VALUES 	('Maharashtra', 'West'), ('Delhi', 'North'), ('Karnataka', 'South'), 
											('West Bengal', 'East'), ('Rajasthan', 'West');
SELECT m.name, m.city, s.region
	FROM messy_indian_dataset m
		JOIN states s ON m.state = s.state;
-- 1. FROM
-- 2. JOIN
-- 3. SELECT



SELECT name, city, purchase_amount
	FROM messy_indian_dataset
		WHERE purchase_amount > (SELECT AVG(purchase_amount) FROM messy_indian_dataset);
-- 1. Subquery(FROM)
-- 2. Subquery(SELECT)
-- 3. FROM
-- 4. WHERE
-- 5. SELECT



-- Final

-- Order of Execution
-- 1. FROM: Determines the source tables and joins if any.
-- 2. WHERE: Applies row filtering.
-- 3. GROUP BY: Groups rows by specified columns.
-- 4. HAVING: Applies group filtering.
-- 5. SELECT: Determines which columns to include in the final result set.
-- 6. ORDER BY: Sorts the result set.
-- 7. LIMIT: Restricts the number of rows in the result set.