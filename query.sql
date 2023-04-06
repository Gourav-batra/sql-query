              --sql queries i used 



-- 1 which store genrates more revenue

select sum(amount), staff_id from payment group by staff_id

-- 2 customers who have purchased the maxiumum no of times 

select count(customer_id) as purchases , customer_id from rental  group by customer_id  having purchases > 30 order by purchases desc

-- 3 most popular movie category

select count(rental_id) as no_of_rentals, name from rental r join  inventory i on r.inventory_id = i.inventory_id join film_category fc on i.film_id = fc.film_id join category c on fc.category_id = c. category_id group by name order by no_of_rentals desc


-- 4 which actor movie was most rented out

select CONCAT(first_name, ' ', last_name) AS full_name , count(rental_duration) as rental_duration  from film_actor fa join actor a on fa.actor_id = a.actor_id join film  f on fa.film_id = f.film_id  group by full_name order by rental_duration desc



-- 5 email id of customers with most rentals to reward them.



select COUNT(r.rental_id) as no_of_rentals, r.customer_id, email from rental R JOIN customer C ON R.customer_id = C.customer_id group by r.customer_id  order by no_of_rentals desc

 


-- 6 email id of customers with least rental to give them exciting offers



select COUNT(r.customer_id) as no_of_rentals, r.customer_id, email from rental R JOIN customer C ON R.customer_id = C.customer_id group by r.customer_id  order by no_of_rentals


-- 7 name and email id of the customer who spennd maximum amount of money

select sum(amount) money_spend, CONCAT(first_name, ' ', last_name) AS full_name,email  from payment p join customer c on p.customer_id = c.customer_id  group by p.customer_id order by money_spend desc


-- 8 avg rental duration for each category of movie

select  avg(rental_duration) as rental_duration , name  from film_category fc join 

film f on fc.film_id = f.film_id join category c on fc.category_id = c.category_id  

group by name order by rental_duration desc


-- 9 city with most no of rentals

select count(rental_id) as no_of_rentals ,city from rental R JOIN customer C ON R.customer_id = C.customer_id join address  a on c.address_id = a.address_id join city on a.city_id = city.city_id  group by city.city order by no_of_rentals desc

 



-- 10 which rated movie has most rentals

select count(rental_id) as no_of_rentals , rating from rental  r join  inventory i on r.inventory_id = i.inventory_id  join film on i.film_id = film.film_id group by rating order by no_of_rentals desc


-- 11 which language has most movies rented

select count(rental_id) as no_of_rentals , name from rental  r join  inventory i on r.inventory_id = i.inventory_id  join film f on i.film_id = f.film_id join language l on f.language_id = l.language_id group by name order by no_of_rentals desc




-- 12 which actor movie was most rented out

select count(rental_id) as no_of_rentals , concat(first_name, ' ' , last_name) as fullname from rental r join  inventory i on r.inventory_id = i.inventory_id  join film f on i.film_id = f.film_id join film_actor fa on f.film_id = fa.film_id join actor a on fa.actor_id = a.actor_id  group by a.actor_id order by no_of_rentals desc





-- 13 average rental duration
select  avg(rental_duration) as rental_duration from film




-- 

  