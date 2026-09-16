select* from actor;
desc customer;
-- 1. Get all customers whose first name starts with 'J' and who are active.
select* from customer where first_name like 'J%' and active = 1;
-- 2. Find all films where the title contains the word 'ACTION' or the description contains 'WAR'.
select* from film where title like '%action%' or description like '%war%';
-- 3. List all customers whose last name is not 'SMITH' and whose first name ends with 'a'.
select* from customer where last_name !='smith' and first_name like '%a';
--4. Get all films where the rental rate is greater than 3.0 and the replacement cost is not null.
select* from film where rental_rate > 3.0 and replacement_cost is not null;
--5. Count how many customers exist in each store who have active status = 1.
select store_id, count(customer_id) from customer where active = 1 group by store_id;
--6. Show distinct film ratings available in the film table.
select distinct(rating) from film;
--7. Find the number of films for each rental duration where the average length is more than 100 minutes.
select rental_duration, count(film_id) from film group by rental_duration having avg(length) > 100;
--8. List payment dates and total amount paid per date, but only include days where more than 100 payments were made.
select* from payment;
-- 9. Find customers whose email address is null or ends with '.org'.
select* from customer where email is null or email like '%.org';
-- 10. List all films with rating 'PG' or 'G', and order them by rental rate in descending order.
select* from film where rating = 'PG' or rating = 'G' order by rental_rate DESC;
-- 11. Count how many films exist for each length where the film title starts with 'T' and the count is more than 5.
select length, count(film_id) from film where title like 'T%' group by length having COUNT(film_id) > 5;
-- 12. List all actors who have appeared in more than 10 films.
select actor_id, count(film_id) from film_actor group by actor_id having count(film_id) > 10;
-- 13. Find the top 5 films with the highest rental rates and longest lengths combined, ordering by rental rate first and length second.
select film_id, title, rental_rate, length from film order by rental_rate desc, length desc limit 5;
-- 14. Show all customers along with the total number of rentals they have made, ordered from most to least rentals.
select customer_id, first_name, last_name from film order by
--15. List the film titles that have never been rented.
select title from film where rental_duration = 0;