-- You have a table transactions:

-- transaction_id	customer_id	transaction_date	amount
-- 1	                101	    2026-01-01	        500
-- 2	                101	    2026-01-05	        300
-- 3	                101	    2026-01-10	        700
-- 4	                102	    2026-01-02	        200
-- 5	                102	    2026-01-08	        400
-- 6	                103	    2026-01-03	        100
-- 7	                103	    2026-01-04      	600


-- Find the first transaction and the most recent transaction for each customer.

select customer_id, min(transaction_date) as first_transaction, max(transaction_date) as latest_transaction  
from trasactions group by customer_id;

-- Also give the amount for the first transaction and the amount for the latest transaction.

select distinct customer_id, first_value(transaction_date) over (partition by customer_id order by transaction_date) as first_transaction,
first_value(amount) over (partition by customer_id order by transaction_date) as first_amount, 
first_value(transaction_date) over (partition by customer_id order by transaction_date desc) as latest_transaction,
first_value(amount) over (partition by customer_id order by transaction_date desc) as latest_amount
from transactions