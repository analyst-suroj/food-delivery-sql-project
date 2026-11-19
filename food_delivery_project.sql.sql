CREATE DATABASE food_delivery_db;
USE food_delivery_db;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    restaurant_name VARCHAR(50),
    food_item VARCHAR(50),
    city VARCHAR(30),
    price INT,
    rating DECIMAL(2,1),
    delivery_time_min INT,
    status VARCHAR(20)
);
INSERT INTO orders (order_id, customer_name, restaurant_name, food_item, city, price, rating, delivery_time_min, status) VALUES
(1, 'Amit Sharma', 'Pizza Hut', 'Margherita Pizza', 'Kolkata', 350, 4.2, 35, 'Delivered'),
(2, 'Riya Das', 'Burger King', 'Chicken Burger', 'Mumbai', 220, 3.8, 25, 'Delivered'),
(3, 'Karan Mehta', 'Dominos', 'Farmhouse Pizza', 'Kolkata', 400, NULL, 40, 'Cancelled'),
(4, 'Neha Roy', 'KFC', 'Chicken Bucket', 'Delhi', 550, 4.5, NULL, 'Delivered'),
(5, 'Suraj Ghosh', 'Pizza Hut', 'Pasta Alfredo', 'Kolkata', 300, 4.0, 30, 'Delivered'),
(6, 'Priya Sen', 'McDonalds', 'Veg Burger', 'Mumbai', 150, NULL, 20, 'Pending'),
(7, 'Manav Kapoor', 'Dominos', 'Cheese Garlic Bread', 'Delhi', 180, 3.9, 28, 'Delivered'),
(8, 'Divya Iyer', 'Subway', 'Veggie Delight Sub', 'Bangalore', 250, NULL, NULL, 'Pending'),
(9, 'Rohit Verma', 'KFC', 'Zinger Burger', 'Kolkata', 210, 4.3, 22, 'Delivered'),
(10, 'Simran Kaur', 'Burger King', 'Whopper', 'Mumbai', 260, 4.1, 27, 'Cancelled');

select * from orders 
where city = 'Kolkata' ;

select * from orders 
where city = 'Kolkata' and status = 'Delivered';

select * from orders 
where city ='kolkata' or city ='Delhi';

select * from orders 
Where food_item like '%Burger%';

select * from orders 
where customer_name like 'R%';

select * from orders 
where rating is null ;

select * from orders 
where delivery_time_min is null;

select * from orders 
order by price desc;

select * from orders
order by price desc limit 3;

update orders
 set rating = 4.0
 where order_id = 3;
 
 update orders 
 set status = 'Delivered' 
 where status = 'Pending';
 
 alter table orders modify column price decimal(6,2);

DELETE FROM orders
WHERE customer_name IS NULL
   OR restaurant_name IS NULL
   OR food_item IS NULL
   OR city IS NULL 
   OR price IS NULL
   OR rating IS NULL
   OR delivery_time_min IS NULL 
   OR status IS NULL ;

select sum(price) As total_revenue 
from orders;

select city, count(*) AS total_orders 
from orders 
group by city;

select city, avg(price) as avg_price
from orders 
group by city 
having avg(price) > 200;

select customer_name,
case 
WHEN price >= 500 THEN 'High'
        WHEN price >= 200 THEN 'Medium'
        ELSE 'Low'
    END AS order_category
FROM orders;

select city , count(order_id) as city_order
from orders 
group by city ;

select city, sum(price) as revenue_city 
from orders 
group by city ;

select city , avg(price) as avg_price 
from orders
group by city ;
   
   SELECT * FROM orders ; 
 
 


