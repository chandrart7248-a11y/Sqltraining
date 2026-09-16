-- 1. Identify if there are duplicates in Customer table. Don't use customer id to check the duplicates
select first_name, last_name, email, count(*) as duplicate_count from customer group by first_name, last_name, email having count(*) > 1;
-- 2. Number of times letter 'a' is repeated in film descriptions
select sum(length(description) - length(replace(lower(description), 'a', ''))) as total_a_count from film;
-- 3. Number of times each vowel is repeated in film descriptions 
select sum(length(description) - length(replace(lower(description), 'a', ''))) as total_a_count,
	   sum(length(description) - length(replace(lower(description), 'e', ''))) as total_e_count,
       sum(length(description) - length(replace(lower(description), 'i', ''))) as total_i_count,
       sum(length(description) - length(replace(lower(description), 'o', ''))) as total_o_count,
       sum(length(description) - length(replace(lower(description), 'u', ''))) as total_u_count from film;

-- 4. Display the payments made by each customer
       -- 1. Month wise
       select customer_id,
       year(payment_date) as payment_year,
       month(payment_date) as payment_month,
       sum(amount) as total_payment
from payment
group by customer_id,
         year(payment_date),
         month(payment_date)
order by customer_id, payment_year, payment_month;
       -- 2. Year wise
       select customer_id,
       year(payment_date) as payment_year,
       sum(amount) as total_payment
from payment
group by customer_id,
         year(payment_date)
order by customer_id, payment_year;
       -- 3. Week wise
       select customer_id,
       year(payment_date) as payment_year,
       week(payment_date) as payment_week,
       sum(amount) as total_payment
from payment
group by customer_id,
         year(payment_date),
         week(payment_date)
order by customer_id, payment_year, payment_week;
 -- 5. Check if any given year is a leap year or not. You need not consider any table from sakila database. Write within the select query with hardcoded date
 select case
when mod(2024, 4) = 0 then 'leap year'
else 'not a leap year'
end as result;
 -- 6. Display number of days remaining in the current year from today.
select datediff(
       concat(year(curdate()), '-12-31'),
       curdate()
       ) as days_remaining;
 -- 7. Display quarter number(Q1,Q2,Q3,Q4) for the payment dates from payment table.
 select payment_date,
       concat('Q', quarter(payment_date)) as quarter_number
from payment;