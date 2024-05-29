use swiggy;
select * from restaurants;

-- 1. Rank every restaurant from most expensive to least expensive
select * ,rank() over(order by cost desc) as 'rank' from restaurants;

-- 2. Rank every restaurant from most visited to least visited
select * ,rank() over(order by rating_count desc) as 'rank' from restaurants;

-- 3. Rank every restaurant from most expensive to least expensive as per their city
select * ,rank() over(partition by city order by cost desc) as 'rank' from restaurants;

-- 4. Dense-rank every restaurant from most expensive to least expensive as per their city
select * ,
	rank() over(order by cost desc) as 'rank' ,
	dense_rank() over(order by cost desc) as 'dense_rank' 
from restaurants;

-- 5. Row-number every restaurant from most expensive to least expensive as per their city
select * ,
	rank() over(order by cost desc) as 'rank' ,
	dense_rank() over(order by cost desc) as 'dense_rank',
    row_number() over(order by cost desc) as 'row_number' 
from restaurants;

-- 6. Rank every restaurant from most expensive to least expensive as per their city along with its city [Adilabad - 1, Adilabad - 2]
select *, concat(city,' - ' ,row_number() over(partition by city order by cost desc)) as 'rank' from restaurants;

-- 7. Find top 5 restaurants of every city as per their revenue
select * from (select *, 
				cost*rating_count as 'revenue', 
				row_number() over(partition by city order by rating_count*cost desc) as 'rank' from restaurants) t
where t.rank < 6;

-- 8. Find top 5 restaurants of every cuisine as per their revenue
select * from (select *, 
				cost*rating_count as 'revenue', 
				row_number() over(partition by cuisine order by rating_count*cost desc) as 'rank' from restaurants) t
where t.rank < 6;

