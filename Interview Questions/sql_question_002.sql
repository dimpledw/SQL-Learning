-- You have a table customer_logins:

-- customer_id	login_date
--  101	        2026-01-01
--  101	        2026-01-02
--  101	        2026-01-03
--  101	        2026-01-05
--  102	        2026-01-01
--  102     	2026-01-03
--  102	        2026-01-04
--  103	        2026-01-10
--  103	        2026-01-11

-- Find customers who logged in for at least 3 consecutive days.

with cte as 
(select customer_id, login_date, lag(login_date) over (partition by customer_id order by login_date) as lag_date
from customer_logins),
cte1 as
(select customer_id, login_date, lag_date,
datediff(day, lag_date, login_date) as difference_date
from cte),
cte2 as 
(select customer_id, login_date, lag_date, difference_date, case when difference_date = 1 then 0 else 1 end as group_flag from cte1),
cte3 as 
(select customer_id, login_date, lag_date, difference_date,
sum(group_flag) over (partition by customer_id order by login_date) as sum_group from cte2)
select customer_id, sum_group, count(*) from cte3 group by customer_id, sum_group having count(*) >= 3