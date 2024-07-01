drop table if exists temp_restaurants;
drop table if exists temp_restaurants_sirsa;
drop table if exists temp_city_statistics;
drop table if exists temp_expensive_restaurants;

-- Creatae your first temporary table
create temporary table temp_restaurants as SELECT * FROM restaurants;
select * from temp_restaurants;

-- Drop temporary tables if they exist
drop table if exists temp_restaurants;

-- Create a new temporary table named 'sirsa_restaurants' containing restaurants of Sirsa only
create temporary table temp_restaurants_sirsa as SELECT * FROM restaurants where city = 'sirsa';
select * from temp_restaurants_sirsa;

-- Create a new temporary table named 'city_statistics' containing aggregated statistics for each city
create temporary table if not exists temp_city_statistics as 
	SELECT city , avg(rating) as avg_rating, count(*) as num_of_restaurants FROM restaurants group by city;
select * from city_statistics;

-- Create a new temporary table named 'expensive_restaurants' containing restaurants with a cost greater than 500
create temporary table if not exists temp_expensive_restaurants as 
	SELECT * from restaurants where cost > 500;
select * from temp_expensive_restaurants;