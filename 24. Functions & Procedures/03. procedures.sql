SELECT * FROM messy_indian_dataset;

-- 1. Creating your first procedure
drop procedure if exists GetUserByID;
delimiter //
	create procedure GetUserByID(IN userID INT)
		begin
			select * from messy_indian_dataset where id = userID;
		end //
delimiter ;
call GetUserByID(1);

-- 2. Procedure to Update Purchase Amount by Percentage

drop procedure if exists UpdatePurchaseAmount;
delimiter //
	create procedure UpdatePurchaseAmount(IN percentage decimal(5,2))
		begin
			update messy_indian_dataset
				set purchase_amount = purchase_amount * (1+percentage/100);
			select * from messy_indian_dataset;
		end //
delimiter ;

call UpdatePurchaseAmount(10);

-- 3. Deleting Low-Rated Restaurants and Logging

create table if not exists deleted_rest_log(
								id int,
                                name varchar(255),
                                rating decimal(3,2),
                                deletion_time timestamp);

drop procedure if exists delete_low_rate_rest;
delimiter //
	create procedure delete_low_rate_rest(min_rating decimal(3,2))
		begin
			
            insert into deleted_rest_log (id, name, rating, deletion_time)
				select id, name, rating, now() from swiggy.restaurants
					where rating < min_rating;
				
			delete from swiggy.restaurants
            where rating < min_rating;
		end //
delimiter ; 

call delete_low_rate_rest(3.0);

select * from swiggy.restaurants;