-- Select all columns from the 'restaurants' table with alias 'r'
SELECT * FROM restaurants;

drop table if exists sirsa_restaurants;
drop table if exists city_statistics;
drop table if exists expensive_restaurants;

-- Create a new table names 'sirsa_restaurants' containing restaurants of sirsa only
create table if not exists sirsa_restaurants as SELECT * FROM restaurants where city = 'sirsa';
select * from sirsa_restaurants;

-- Create a new table named 'city_statistics' containing aggregated statistics for each city
create table if not exists city_statistics as 
	SELECT city , avg(rating) as avg_rating, count(*) as num_of_restaurants FROM restaurants group by city;
select * from city_statistics;

-- Create a new table named 'expensive_restaurants' containing restaurants with a cost greater than 500
create table if not exists expensive_restaurants as 
	SELECT * from restaurants where cost > 500;
select * from expensive_restaurants;
