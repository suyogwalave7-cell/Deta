CREATE DATABASE bank_analysis;
USE bank_analysis;
CREATE TABLE bank_transactions(
     transaction_ID varchar(20),
	Customer_ID VARCHAR(20),
    Transaction_Date DATE,
    Account_Type VARCHAR(20),
    Transaction_Type VARCHAR(20),
    Amount DECIMAL(15,2),
    Balance DECIMAL(15,2),
    Branch VARCHAR(20),
    City VARCHAR(50),
    State VARCHAR(50),
    Payment_Mode VARCHAR(30),
    Customer_Age INT,
    Gender VARCHAR(10),
    Customer_Segment VARCHAR(20),
    Loan_Status VARCHAR(20)
);
SHOW DATABASES;
select * from bank_transactions;

SELECT COUNT(*) AS total_records
FROM bank_transactions;

SELECT SUM(amount) AS total_transaction_amount
FROM bank_transactions;

SELECT AVG(amount) AS average_transaction_amount
FROM bank_transactions;

SELECT max(amount) AS maximum_transaction_amount
FROM bank_transactions;

select min(amount) as maximum_transaction_amount
from bank_transactions;

select
  transaction_type,
  count(*) as transaction_count
from bank_transactions
group by transaction_type;

select transaction_type,
sum(amount) as total_amount
from bank_transactions
group by Transaction_type;

select payment_mode, 
sum(amount) as total_amount
from bank_transactions
group by payment_mode;

select payment_mode, 
AVG(amount) as average_amount
from bank_transactions
group by payment_mode;

select account_type,
sum(amount) as total_amount
from bank_transactions
group by account_type;

select customer_segment,
sum(amount) as total_amount
from bank_transactions
group by customer_segment;

select loan_status,
count(*) as transactions,
sum(amount) as total_amount
from bank_transactions
group by loan_status;

select customer_id,
sum(amount) as total_amount
from bank_transactions
group by customer_id
order by total_amount desc
limit 10;

select state,
count(*) as transaction_count
from bank_transactions
group by state
order by transaction_count DESC;

select state,
sum(amount) as total_amount
from bank_transactions
group by state
order by total_amount desc;

select branch,
sum(amount) as total_amount
from bank_transactions
group by branch
order by total_amount desc
limit 10;

select 
month(transaction_date) as month_number,
monthname(transaction_date) as month_name,
sum(amount) as total_amount
from bank_transactions
group by
month(transaction_date),
monthname(transaction_date)
order by month_number;

select * from bank_transactions
where transaction_type = 'deposit';

select * from bank_transactions
where amount < 100000;

select transaction_type,
sum(amount) as total_amount
from bank_transaction
group by transaction_type
having sum(amount) > 24000000;

select transaction_ID,
amount,
case
WHEN amount >=100000 THEN 'high'
WHEN amount >=50000 THEN 'medium'
ELSE 'Low'
END as amount_category
from bank_transactions;

select case
WHEN amount >= 100000 THEN 'high'
WHEN amount >= 50000 THEN 'medium'
ELSE 'low'
END as amount_category,
count(*) transaction_count,
SUM(amount) AS total_amount
from bank_transactions
group by amount_category;

select transaction_id,
amount,
CASE
WHEN amount >=100000 THEN 'high'
WHEN amount >=50000 THEN 'medium'
ELSE 'low'
END AS amount_category
from bank_transactions
order by amount DESC
limit 10;

CREATE TABLE customers (
    Customer_ID VARCHAR(20),
    Customer_Name VARCHAR(100),
    Customer_City VARCHAR(50),
    Customer_Type VARCHAR(30)
);

INSERT INTO customers
(Customer_ID, Customer_Name, Customer_City, Customer_Type)
VALUES
('CUST0001', 'Rahul Sharma', 'Mumbai', 'Retail'),
('CUST0002', 'Amit Patil', 'Pune', 'Premium'),
('CUST0003', 'Sneha Joshi', 'Nashik', 'Retail'),
('CUST0004', 'Priya Deshmukh', 'Nagpur', 'Corporate'),
('CUST0005', 'Suyog Kulkarni', 'Pune', 'Premium');

select * from customers;
SELECT
    Customer_ID,
    COUNT(*) AS record_count
FROM customers
GROUP BY Customer_ID
HAVING COUNT(*) > 1;

TRUNCATE TABLE customers;

TRUNCATE TABLE customers;

INSERT INTO customers
(Customer_ID, Customer_Name, Customer_City, Customer_Type)
VALUES
('CUST0001', 'Rahul Sharma', 'Mumbai', 'Retail'),
('CUST0002', 'Amit Patil', 'Pune', 'Premium'),
('CUST0003', 'Sneha Joshi', 'Nashik', 'Retail'),
('CUST0004', 'Priya Deshmukh', 'Nagpur', 'Corporate'),
('CUST0005', 'Suyog Kulkarni', 'Pune', 'Premium');

select * from customers;

select
 b.Transaction_ID,
    b.Customer_ID,
    c.Customer_Name,
    c.Customer_City,
    c.Customer_Type,
    b.Amount
    from bank_transactions b
    INNER JOIN customers c
    on b.Customer_ID = c.Customer_ID;
    
select
 c.Customer_ID,
    c.Customer_Name,
    c.Customer_City,
    c.Customer_Type,
    sum(b.amount) as total_amount
    from bank_transactions b
    inner join Customers c
    on b.Customer_ID = c.Customer_ID
    group by
     c.Customer_ID,
    c.Customer_Name,
    c.Customer_City,
    c.Customer_Type
    order by total_amount DESC;
    
    select 
    c.Customer_ID,
    c.Customer_Name,
    c.Customer_City,
    b.Transaction_ID,
    b.Amount
    from customers c 
    left join bank_transactions b  
    ON c.Customer_ID = b.Customer_ID;
    
    select
      c.Customer_ID,
    c.Customer_Name,
    c.Customer_City
    from Customers c 
    left join bank_transactions b 
    ON c.Customer_ID = b.Customer_ID
    where b.Customer_ID IS NULL;
    
    select
     c.Customer_ID,
    c.Customer_Name,
    c.Customer_City,
    b.Transaction_ID,
    b.Amount
    from customers c 
    right join bank_transactions b 
    on c.Customer_ID = b.Customer_ID;
    
    select 
     b.Transaction_ID,
    b.Amount
    from customers c
    right join bank_transactions b 
    on c.Customer_ID = b.Customer_ID
    where c.Customer_ID IS NULL;
    
    select
    c.Customer_type,
    count(b.transaction_ID) AS transaction_count,
    sum(b.amount) as total_amount,
    avg(b.amount) as average_amount
    from customers c 
    inner join bank_transactions b 
    on c.Customer_ID = b.Customer_ID
    group by c.Customer_Type
    order by total_amount DESC;
    
    CREATE TABLE branches(
       Branch VARCHAR(20),
       Branch_Manger VARCHAR(100),
       Branch_City VARCHAR(50)
    );
    
INSERT INTO branches (Branch, Branch_Manager, Branch_City)
VALUES
('BR-001', 'Amit Sharma', 'Mumbai'),
('BR-002', 'Rahul Patil', 'Pune'),
('BR-003', 'Sneha Joshi', 'Nashik'),
('BR-004', 'Priya Deshmukh', 'Nagpur'),
('BR-005', 'Vikas Kulkarni', 'Aurangabad');
    
DESCRIBE branches;

ALTER TABLE branches
CHANGE COLUMN Branch_Manger Branch_Manager VARCHAR(100);

INSERT INTO branches (Branch, Branch_Manager, Branch_City)
VALUES
('BR-001', 'Amit Sharma', 'Mumbai'),
('BR-002', 'Rahul Patil', 'Pune'),
('BR-003', 'Sneha Joshi', 'Nashik'),
('BR-004', 'Priya Deshmukh', 'Nagpur'),
('BR-005', 'Vikas Kulkarni', 'Aurangabad');

SELECT
    c.Customer_Name,
    c.Customer_Type,
    b.Transaction_ID,
    b.Amount,
    br.Branch,
    br.Branch_Manager,
    br.Branch_City
From Customers c 
inner join bank_transactions b 
on c.Customer_ID = b.Customer_ID
inner join Branches br 
on b.Branch = br.Branch;

SELECT
    Branch,
    COUNT(*) AS branch_count
FROM branches
GROUP BY Branch
HAVING COUNT(*) > 1;

TRUNCATE TABLE branches;

INSERT INTO branches (Branch, Branch_Manager, Branch_City)
VALUES
('BR-001', 'Amit Sharma', 'Mumbai'),
('BR-002', 'Rahul Patil', 'Pune'),
('BR-003', 'Sneha Joshi', 'Nashik'),
('BR-004', 'Priya Deshmukh', 'Nagpur'),
('BR-005', 'Vikas Kulkarni', 'Aurangabad');

SELECT
    Branch,
    COUNT(*) AS branch_count
FROM branches
GROUP BY Branch;

SELECT
    c.Customer_Name,
    c.Customer_Type,
    b.Transaction_ID,
    b.Amount,
    br.Branch,
    br.Branch_Manager,
    br.Branch_City
FROM customers c
INNER JOIN bank_transactions b
    ON c.Customer_ID = b.Customer_ID
INNER JOIN branches br
    ON b.Branch = br.Branch;
    
select 
Transaction_ID,
Customer_ID,
Amount,
Transaction_Type
from bank_transactions
where amount >(
select AVG(amount)
from bank_transactions

)
order by amount DESC;

select 
Customer_ID,
sum(amount) as total_amount
from bank_transactions
group by Customer_ID
having sum(amount) > (
select avg(total_amount)
from (
select
Customer_ID,
sum(amount) as total_amount
from bank_transactions
group by Customer_ID
) as Customer_totals
)
order by total_amount DESC;

with Customer_Totals as (
   select
        Customer_ID,
        sum(amount) as total_amount
	from bank_transactions
    group by Customer_ID
    
)
select
Customer_ID,
Total_Amount
from Customer_Totals
order by total_amount DESC;

with customer_totals as (
   select
     customer_id,
     sum(amount) as total_amount
from bank_transactions
group by customer_id
)
select
customer_id,
total_amount
from customer_totals
where total_amount > 500000
order by total_amount DESC;

select
  customer_id,
  sum(amount) as total_amount,
  rank() over (order by sum(amount) DESC) as customer_rank
from bank_transactions
group by customer_id
order by customer_rank;

select
  customer_id,
  sum(amount) as total_amount,
  dense_rank() over (order by sum(amount) DESC) as customer_rank
from bank_transactions
group by customer_id
order by customer_rank;

select
  customer_id,
  sum(amount) as total_amount,
  row_number() over (order by sum(amount) DESC) as customer_rank
from bank_transactions
group by customer_id
order by customer_rank;

select 
	customer_id,
    sum(amount) as total_amount
from bank_transactions
group by customer_id
order by total_amount desc
LIMIT 5;

select
	Branch,
    sum(amount) as total_amount
    from bank_transactions
    group by Branch
    order by total_amount desc
    limit 5;
    
select
	customer_id,
    max(amount) as highest_transaction
from bank_transactions
group by customer_id
order by highest_transaction desc
limit 5;

select
	customer_id,
    sum(amount) as total_amount
from bank_transactions
group by customer_id
having sum(amount) > (
	select avg(total_amount)
    from (
		select
			customer_id,
            sum(amount) as total_amount
		from bank_transactions
        group by customer_id
	) as customer_totals
	
)
order by total_amount desc;

select
	month(transaction_date) as transaction_month,
    max(amount) as highest_transaction
from bank_transactions
group by month(transaction_date)
order by transaction_month;

select
	month(transaction_date) as transaction_month,
    count(*) as transaction_count
from bank_transactions
group by month(transaction_date)
order by transaction_month;

select
	month(transaction_date) as transaction_month,
    avg(amount) as average_transaction_amount
from bank_transactions
group by month(transaction_date)
order by transaction_month;

select
	quarter(transaction_date) as quarter,
    count(*) as transaction_count,
    sum(amount) as total_amount,
    avg(amount) as average_amount
FROM bank_transactions
group by quarter(transaction_date)
order by quarter;  

select
	customer_segment,
    count(*) transaction_count,
    sum(amount) as total_amount,
    avg(amount) as average_amount
    from bank_transactions
    group by customer_segment
    order by total_amount desc;
    
select
	payment_mode,
    count(*) as transaction_count,
    sum(amount) as total_amount,
    avg(amount) as average_amount
from bank_transactions
group by payment_mode
order by total_amount desc;

select
	loan_status,
    count(*) as transaction_count,
    sum(amount) as total_amount,
    avg(amount) as average_amount
from bank_transactions
group by loan_status
order by total_amount desc;

select
	account_type,
    count(*) as transaction_count,
    sum(amount) as total_amount,
    avg(amount) as average_amount
from bank_transactions
group by account_type
order by total_amount desc;

select
gender,
	count(*) as transaction_count,
	sum(amount) as total_amount,
	avg(amount) as average_amount
from bank_transactions
group by gender
order by total_amount desc;

select
	state,
    count(*) as transaction_count,
    sum(amount) as total_amount,
    avg(amount) as average_amount
from bank_transactions
group by state
order by average_amount desc;

select
	customer_id,
    count(*) transaction_count,
    sum(amount) as total_amount,
    avg(amount) as average_amount
from bank_transactions
group by customer_id
order by transaction_count desc
limit 10;

use bank_analysis;

select
	transaction_type,
    count(*) transaction_count,
    sum(amount) total_amount,
    avg(amount) as average_amount
from bank_transactions
group by transaction_type
order by average_amount desc;

select
	state,
    count(*) high_value_transactions,
    sum(amount) as total_amount
from bank_transactions
where amount >= 100000
group by state
order by high_value_transactions desc;

select
	year(transaction_date) as transaction_year,
    count(*) as transaction_count,
    sum(amount) as total_amount,
    avg(amount) as average_amount
from bank_transactions
group by year(transaction_date)
order by transaction_year;

select
	case
		when customer_age between 18 and 25 then '18-25'
        when customer_age between 26 and 35 then '26-35'
        when customer_age between 36 and 45 then '36-45'
        when customer_age between 46 and 55 then '46-55'
        when customer_age between 56 and 65 then '56-65'
        else 'other'
	end as age_group,
    count(*) as transaction_count,
    sum(amount) as total_amount,
    avg(amount) as average_amount
from bank_transactions
group by age_group
order by total_amount desc;

select 
	case
		when dayofweek(transaction_date) in (1, 7)
			then 'weekend'
		else 'weekday'
	end as day_type,
    count(*) transaction_count,
    sum(amount) as total_amount,
    avg(amount) as average_amount
from bank_transactions
group by day_type
order by total_amount desc;

select
	account_type,
    count(*) transaction_count,
    avg(balance) as average_balance,
    max(balance) as maximum_balance,
    min(balance) as minimum_balance
from bank_transactions
group by account_type
order by average_balance desc;
    
select 
	month(transaction_date) as transaction_month,
    transaction_type,
    count(*) as transaction_count,
    sum(amount) as total_amount
from bank_transactions
group by 
	month(transaction_date),
    transaction_type
order by
	transaction_month,
    transaction_type;
    
select
	customer_segment,
    loan_status,
    count(*) transaction_count,
    sum(amount) as total_amount
from bank_transactions
group by
	customer_segment,
    loan_status
order by 
	customer_segment,
    total_amount desc;
    
    select
		customer_segment,
        customer_id,
        sum(amount) as total_amount
	from bank_transactions
    group by
		customer_segment,
        customer_id
	order by
		customer_segment,
        total_amount desc;
        
with customer_segment_totals as (
	select 
		customer_segment,
        customer_id,
        sum(amount) as total_amount
	from bank_transactions
    group by customer_segment, customer_id
),
ranked_customers as (
	select
		customer_segment,
        customer_id,
        total_amount,
        dense_rank() over (
			partition by customer_segment
            order by total_amount desc
		) as customer_rank
	from customer_segment_totals
)
select
	customer_segment,
    customer_id,
    total_amount,
    customer_rank
from ranked_customers
where customer_rank <= 5
order by customer_segment, customer_rank;

select 
	case
		when amount < 25000  then 'low'
        when amount < 75000 then 'medium'
        else 'high'
	end as amount_category,
    count(*) transaction_count,
    sum(amount) as total_amount,
    avg(amount) as average_amount
from bank_transactions
group by amount_category
order by total_amount desc;

select
	branch,
		count(*) transaction_count,
        sum(amount) as total_amount,
        avg(amount) as average_amount
	from bank_transactions
    group by branch
    order by total_amount desc
    limit 10;
    
select
	city,
		count(*) as transaction_count,
        sum(amount) as total_amount,
        avg(amount) as averag_amount
	from bank_transactions
    group by city
    order by total_amount desc;
    
select
	branch,
		transaction_type,
        count(*) as transaction_count,
        sum(amount) as total_amount
	from bank_transactions
    group by
		branch,
        transaction_type
	order by
		branch,
        total_amount desc;
        
	select
		payment_mode,
        transaction_type,
        count(*) as transaction_count,
        sum(amount) as total_amount,
        avg(amount) as average_amount
	from bank_transactions
    group by 
		payment_mode,
        transaction_type
	order by
		payment_mode,
        total_amount desc;

select 
	city,
		payment_mode,
        count(*) as transaction_count,
        sum(amount) as total_amount
	from bank_transactions
    group by 
		city,
        payment_mode
    order by
		city,
        total_amount desc;
        
select
	state,
		payment_mode,
        count(*) as transaction_count,
        sum(amount) as total_amount,
        avg(amount) as average_amount
	from bank_transactions
    group by
		state,
        payment_mode
	order by
		state,
        total_amount desc;
        
select
	customer_segment,
    payment_mode,
    count(*) transaction_count,
    sum(amount) as total_amount,
    avg(amount) as average_amount
from bank_transactions
group by
	customer_segment,
    payment_mode
order by
	customer_segment,
    total_amount desc;
    
select
	customer_segment,
    count(*) high_value_transactions,
    sum(amount) as total_amount,
    avg(amount) as average_amount
from bank_transactions
where amount >= 100000
group by customer_segment
order by total_amount desc;

select
	customer_id,
    count(*) high_value_transactions,
    sum(amount) as total_high_value_amount,
    avg(amount) as average_amount
from bank_transactions
where amount >= 100000
group by customer_id
order by total_high_value_amount desc
limit 5;

select
	month(transaction_date) as transaction_month,
    count(*) as high_value_transactions,
    sum(amount) as total_amount,
    avg(amount) as average_amount
from bank_transactions
where amount >= 100000
group by month(transaction_date)
order by transaction_month desc;

select
	account_type,
    count(*) as high_value_transactions,
    sum(amount) as total_amount,
    avg(amount) as average_amount
from bank_transactions
where amount >= 100000
group by account_type
order by total_amount desc;

select
	payment_mode,
    count(*) high_value_transactions,
    sum(amount) as total_amount,
    avg(amount) as average_amount
from bank_transactions
where amount >= 100000
group by payment_mode
order by total_amount desc;

select
	transaction_type,
    count(*) high_value_transactions,
    sum(amount) as total_amount,
    avg(amount) as average_amount
from bank_transactions
where amount >= 100000
group by transaction_type
order by total_amount desc;

select
	gender,
		count(*) high_value_transactions,
        sum(amount) as total_amount,
        avg(amount) as average_amount
	from bank_transactions
    where amount >= 100000
    group by gender
    order by total_amount desc;

select 
	state,
    transaction_type,
    count(*) high_value_transactions,
    sum(amount) as total_amount
from bank_transactions
where amount >= 100000
group by 	
	state,
		transaction_type
        
order by
	state,
		total_amount desc;
        
create view segment_transaction_summary as
	select	
		customer_segment,
        count(*) as transaction_count,
        sum(amount) as total_amount,
        avg(amount) as average_amount
	from bank_transactions
    group by customer_segment;
    
select * from segment_transaction_summary;

select * from segment_transaction_summary
where customer_segment = 'premium';

select
	customer_segment,
    transaction_count,
    total_amount,
    average_amount
from segment_transaction_summary
order by total_amount desc
limit 1;        

select
	transaction_id,
    amount,
    case
		when amount >= 100000 then 'high'
        when amount >= 50000 then 'medium'
        else 'low'
	  end as transaction_category
	from bank_transactions
    limit 20;
    
select  	
	case
		when amount >= 100000 then 'high'
        when amount >= 50000 then 'medium'
        else 'low'
        end as transaction_category,
        count(*) as transaction_count,
        sum(amount) as total_amount,
        avg(amount) as average_amount
	from bank_transactions
    group by transaction_category
    order by total_amount desc;