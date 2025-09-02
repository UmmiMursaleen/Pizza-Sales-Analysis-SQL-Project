use [Pizza Sales]

--Basic Questions

--Retrieve the total number of orders placed
select 
	COUNT(order_id) as total_order 
from 
	orders

--Calculate the total revenue generated from pizza sales
select 
sum(quantity*price) as total_revenue

from order_details as o
inner join pizzas as p on p.pizza_id = o.pizza_id

--Identify the highest-priced pizza.
select pizza_type_id,size,max(price) from pizzas
group by pizza_type_id,size
order by 3 Desc

--Identify the most common pizza size ordered.

select 
size,
count(size) as total_quantity

from order_details as o
inner join pizzas as p on p.pizza_id = o.pizza_id
group by size

--List the top 5 most ordered pizza types along with their quantities.

select 
top 5 pizza_type_id,count(quantity) as total_qunatity

from order_details as o
inner join pizzas as p on p.pizza_id = o.pizza_id
group by pizza_type_id

--Intermediate Questions

--Join the necessary tables to find the total quantity of each pizza category ordered.




--Join relevant tables to find the category-wise distribution of pizzas.
select 
category,
sum(price*quantity) as total_revenue

from pizza_types p
inner join pizzas as z on z.pizza_type_id = p.pizza_type_id
inner join order_details as o on o.pizza_id = z.pizza_id
group by category



--find the total quantity sold pizza.

select sum(cast(quantity as int)) as total_pizza_sold from order_details

--Join the necessary tables to find the total quantity of each pizza category ordered.

select 
category, SUM(cast (o.quantity as int)) total_qunatity

from pizza_types as p
inner join pizzas as z on z.pizza_type_id = p.pizza_type_id
inner join order_details as o on o.pizza_id = z.pizza_id
group by category

--Determine the distribution of orders by hour of the day.



--Determine the top 3 most ordered pizza types based on revenue.

select 
top 3 pizza_type_id, SUM(cast(quantity as int)*price) as total_revenue

from order_details as o 
inner join pizzas as p on p.pizza_id = o.pizza_id
group by pizza_type_id

--Determine the top 3 most ordered pizza types based on revenue for each pizza category.

select 
top 3 pt.pizza_type_id,pt.category, SUM(cast(o.quantity as int)*price) as total_revenue
from pizza_types as pt
inner join pizzas as p on p.pizza_type_id = pt.pizza_type_id
inner join order_details as o on o.pizza_id=p.pizza_id
group by pt.pizza_type_id,pt.category



--total pizzas sold
--total orders

select count(distinct order_id) as total_orders from order_details
select sum(cast(quantity as int)) as total_pizzas_sold from order_details



--Join relevant tables to find the category-wise distribution of pizzas.
select 
category,
count(order_id) as total_orders

from pizza_types as pt
inner join pizzas as p on p.pizza_type_id = pt.pizza_type_id
inner join order_details o on o.pizza_id = p.pizza_id
group by category