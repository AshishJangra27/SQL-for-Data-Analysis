-- create database gfg;
use gfg;
-- showing the Dataset
select * from products;

-- showing specific columns
select product_name, brand_name from products;

-- showing specific column in specific order
select brand_name, product_name from products;

-- create new column with mathemtical functions | Making Discounted Amount
select product_name, brand_name, marked_price, discounted_price,  marked_price -  discounted_price AS discounted_amount from products ;

-- create new column with mathemtical functions | Making Rating Count * Rating
select product_name, brand_name, rating, rating_count,   rating*rating_count AS rating_filter from products ;

-- create new column with mathemtical functions | Making Discount Percentage
select product_name, brand_name, marked_price, discounted_price,  ((marked_price -  discounted_price)/marked_price)*100 AS discounted_percent from products ;

-- Finding UNIQUE values
select distinct(brand_name) as unique_brands from products;

-- Adding Where Clause
select product_name, brand_name, marked_price, discounted_price from products where brand_tag = 'Adidas';

-- Adding Distinct with Where | Unique Products served by Adidas
select distinct(product_tag), brand_name from products where brand_tag = 'Adidas';

-- Adding Distinct with Where | Unique Products served by Adidas
select count(distinct(product_tag)) from products where brand_tag = 'Adidas';

-- Products with Multiple Where Clause with AND
select product_name, brand_name, marked_price, discounted_price from products where brand_tag = 'Adidas' and discounted_price > 5000;
select product_name, brand_name, marked_price, discounted_price from products where discounted_price > 5000 and discounted_price < 8000;

-- Products with BETWEEN
select product_name, brand_name, marked_price, discounted_price from products where discounted_price between 5000 and 8000;

-- Adding more filters
select product_name, brand_tag, marked_price, discounted_price from products 
where (discounted_price between 5000 and 8000) and brand_tag = 'Adidas' and rating > 4;

-- Lets go one steps ahead
select product_name, brand_tag, marked_price, discounted_price from products 
where (discounted_price between 3000 and 8000) and 
brand_tag = 'Adidas' 
and rating > 4
and rating_count > 10;

-- One More
select count(distinct (product_tag)) from products where brand_tag = 'adidas';

-- Using OR
select product_name, product_tag,brand_tag, discounted_price from products
where (brand_tag = 'Adidas' or brand_tag = 'Puma') and discounted_price between 3000 and 5000;

-- Using NOT
select product_name, product_tag,brand_tag, discounted_price from products
where not(brand_tag = 'Adidas' or brand_tag = 'Puma') and discounted_price between 3000 and 5000;

-- Using IN
select product_name, product_tag,brand_tag, discounted_price from products
where brand_tag in ('Adidas', 'Puma') and discounted_price between 3000 and 5000;

-- Using NOT IN
select product_name, product_tag,brand_tag, discounted_price from products
where brand_tag not in ('Adidas', 'Puma') and discounted_price between 3000 and 5000;
