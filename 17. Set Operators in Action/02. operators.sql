select * from users.users_2021;
select * from users.users_2022;
select * from users.users_2023;

-- UNION | remove duplicates
select * from users.users_2021 union select * from users.users_2022;
select * from users.users_2022 union select * from users.users_2021;
select * from users.users_2021 union select * from users.users_2023;
select * from users.users_2022 union select * from users.users_2023;
select * from users.users_2021 union select * from users.users_2022 union select * from users.users_2023;

-- UNION ALL | Dont't remove duplicates
select * from users.users_2021 union all select * from users.users_2022;
select * from users.users_2022 union all select * from users.users_2021;
select * from users.users_2021 union all select * from users.users_2023;
select * from users.users_2022 union all select * from users.users_2023;
select * from users.users_2021 union all select * from users.users_2022 union all select * from users.users_2023;
select * from users.users_2021 union all select * from users.users_2022 union select * from users.users_2023;
(select * from users.users_2021 union all select * from users.users_2022) union select * from users.users_2023;

-- EXCEPT | Show all the data of dominating table that is not there is other table
select * from users.users_2021 except select * from users.users_2022;
select * from users.users_2022 except select * from users.users_2021;
select * from users.users_2021 except select * from users.users_2023;
select * from users.users_2023 except select * from users.users_2021;
select * from users.users_2021 except select * from users.users_2022 except select * from users.users_2023;
select * from users.users_2023 except select * from users.users_2022 except select * from users.users_2021;

-- INTERSECT | Showing the common data
select * from users.users_2021 intersect select * from users.users_2022;
select * from users.users_2022 intersect select * from users.users_2023;
select * from users.users_2021 intersect select * from users.users_2023;

select * from users.users_2021 intersect select * from users.users_2022 intersect select * from users.users_2023;