/* Basic:
Retrieve the total number of orders placed.
Calculate the total revenue generated from pizza sales.
Identify the highest-priced pizza.
Identify the most common pizza size ordered.
List the top 5 most ordered pizza types along with their quantities.
*/

-- 1) Retrieve the total number of orders placed.
	  select count(order_id) as total_orders from orders ;
      
-- 2) Calculate the total revenue generated from pizza sales
	SELECT 
    ROUND(SUM(order_details.quantity * pizzas.price)) AS total_revenue
FROM
    order_details
        JOIN
    pizzas ON pizzas.pizza_id = order_details.pizza_id;
    
-- 3) Identify the highest-priced pizza.
	select pizza_types.name,pizzas.price
    from pizza_types join pizzas
    on pizza_types.pizza_type_id = pizzas.pizza_type_id 
    order by price desc
    limit 1;
    
-- 4) Identify the most common pizza size ordered.
       
    select pizzas.size,count(order_details.order_details_id) as order_count
    from pizzas join order_details
    on pizzas.pizza_id = order_details.pizza_id 
    group by pizzas.size 
    order by order_count desc
    limit 1;

-- 5) List the top 5 most ordered pizza types along with their quantities.
SELECT 
    pizza_types.name, SUM(order_details.quantity) AS quantities
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY quantities DESC 
LIMIT 5;

