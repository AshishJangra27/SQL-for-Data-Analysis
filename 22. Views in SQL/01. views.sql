use swiggy;
select * from restaurants;

-- 1. Create the view

drop view if exists rest;
create view rest as (
		select name, city, rating, rating_count as 'orders', 
        cuisine, cost, cost*rating_count as 'revenue' from restaurants);
select * from rest;

-- 2. Create a view for end_user
drop view if exists user_view;
create view user_view as (
		select name, city, rating, rating_count as 'orders', 
        cuisine, cost from restaurants);
select * from user_view;

-- 3. Create a view of sweet dishes
drop view if exists rest_of_sweet_dishes;
create view rest_of_sweet_dishes as (
		select * from restaurants where cuisine in ('Sweets', 'Desserts','Bakery','Ice Cream'));
select * from rest_of_sweet_dishes;

-- 4. Create a view of top 100 restaurants
drop view if exists top_100;
create view top_100 as (
		select * from restaurants order by rating_count desc limit 100);
select * from top_100;

-- 5. Create a view of restaurant atleast 100 people visited
drop view if exists least_100;
create view least_100 as (
		select * from restaurants order by rating_count asc limit 100);
select * from least_100;

-- 6. Create a view of top 1000 most expensive restaurants
drop view if exists top_1000_exp;
create view top_1000_exp as (
		select * from restaurants order by cost desc limit 1000);
select * from top_1000_exp;

-- 7. Create a view for top-rated restaurants in each city
drop view if exists top_rated_rest_per_city;
create view top_rated_rest_per_city as (
		select * from ( 
			select *,  row_number() over(partition by city order by rating*rating_count desc) as 'rank' 
				from restaurants) 
			as ranked_table
		where ranked_table.rank = 1);
select * from top_rated_rest_per_city;