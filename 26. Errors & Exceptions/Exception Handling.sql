use swiggy;

-- 1. If table doesn't exists exception handling
delimiter //
drop procedure if exists handle_non_existant_table;
create procedure handle_non_existant_table()
	begin
		declare continue handler for SQLEXCEPTION
			begin
				select 'The table "non_existant_table" does not exists' as message;
			end;
		select * from non_existant_table;
	end //
delimiter ;

call handle_non_existant_table();

-- 2. 

delimiter //
drop procedure if exists handle_unique_violation;
create procedure handle_unique_violation()
	begin
		declare continue handler for SQLEXCEPTION
			begin
				select 'Duplicate restaurant ID or name Found' as message;
			end;
		insert into restaurants(ids, name, city, rating, rating_count, cuisine, cost, link)
		values (211, 'Tandoori Hut','Banglore', 4.3, 100, 'Biryani', 300, 'https://www.swiggy.com/rest/tandoor_hut');
	end //
delimiter ;

call handle_unique_violation();