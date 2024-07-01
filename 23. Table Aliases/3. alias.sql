-- Select all columns from the 'restaurants' table with alias 'r'
select * from restaurants as rest;

-- Select the city and the average cost of restaurants in each city using table aliases and aggregate functions
select rest.city, avg(rest.cost) as 'avg_cost' 
from restaurants as rest 
group by rest.city;

-- Select restaurants that have a higher rating than the average rating of all restaurants in the same city using self-referencing query with table aliases
select rest.*
from restaurants as rest 
where rest.rating > (select avg(rating) from restaurants where city = rest.city);
