use gfg;
SELECT * FROM products;
-- Finding the number of products in the dataset

SELECT count(*) as total_products FROM products ;
SELECT count (product_name) as total_products FROM products;

-- Finding the average discounted price of products in the dataset
SELECT avg(discounted_price) as average_price FROM products ;
SELECT avg(marked_price) as average_price FROM products;

-- Finding the most expensive product on myntra
SELECT max(discounted_price) as average_price FROM products;
SELECT max(marked_price) as average_price FROM products;

-- Finding the least expensive product on myntra
SELECT min (discounted_price) as average_price FROM products ;
SELECT min (marked_price) as average_price FROM products ;

-- Find the total rating count of all products
SELECT sum (rating_count) as total_rating FROM products ;

-- Find the total unique brands
SELECT DISTINCT (brand_name) as brands FROM products ;

-- Find the number of unique brands
SELECT count(DISTINCT(brand_name)) as total_brands FROM products ;
