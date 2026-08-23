use mydatabase;

select * from customers;

-- Filtering customer from Canada
Select * from customers where country = 'Canada';

-- Filtering customer are not from Canada

Select * from customers where country <> 'Canada';
Select * from customers where country != 'Canada';

-- Filtering customer with a score greater than 50

select * from customers where score > 50;

-- Filtering customer with a score equal to or greater than 50

select * from customers where score >= 50;

-- Filtering customer with a score lesser than 75

select * from customers where score < 75;

-- Filtering customer with a score equal to or less than 

select * from customers where score <= 75;










