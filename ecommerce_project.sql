DROP DATABASE IF EXISTS ecommerce_db;
CREATE DATABASE ecommerce_db;
USE ecommerce_db;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    city VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2) NOT NULL,
    stock INT
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers VALUES
(1,'Rahul Sharma','rahul@gmail.com','Bangalore'),
(2,'Priya Nair','priya@gmail.com','Chennai'),
(3,'Arjun Mehta','arjun@gmail.com','Mumbai'),
(4,'Sneha Rao','sneha@gmail.com','Bangalore'),
(5,'Karan Singh','karan@gmail.com','Delhi'),
(6,'Ananya Iyer','ananya@gmail.com','Hyderabad'),
(7,'Rohit Verma','rohit@gmail.com','Pune'),
(8,'Neha Kapoor','neha@gmail.com',NULL),
(9,'Vikram Das','vikram@gmail.com','Kolkata'),
(10,'Meera Joshi','meera@gmail.com','Bangalore');

INSERT INTO products VALUES
(101,'Laptop','Electronics',65000,15),
(102,'Smartphone','Electronics',30000,25),
(103,'Headphones','Electronics',2500,50),
(104,'Smart Watch','Electronics',5000,30),
(105,'Keyboard','Accessories',1500,40),
(106,'Mouse','Accessories',800,60),
(107,'Backpack','Bags',2200,35),
(108,'Running Shoes','Footwear',3500,20),
(109,'T-Shirt','Clothing',900,75),
(110,'Jeans','Clothing',1800,45),
(111,'Bluetooth Speaker','Electronics',3200,25),
(112,'Power Bank','Accessories',1200,50);

INSERT INTO orders VALUES
(1001,1,'2026-01-05',67300),
(1002,2,'2026-01-08',30000),
(1003,3,'2026-01-12',2500),
(1004,1,'2026-01-20',5000),
(1005,4,'2026-02-02',2200),
(1006,5,'2026-02-10',3500),
(1007,6,'2026-02-15',900),
(1008,7,'2026-02-20',3200),
(1009,8,'2026-03-01',1500),
(1010,9,'2026-03-05',65000),
(1011,10,'2026-03-10',30000),
(1012,3,'2026-03-15',4400),
(1013,4,'2026-03-20',3300),
(1014,5,'2026-04-01',1200),
(1015,1,'2026-04-05',3500);

INSERT INTO order_items VALUES
(1,1001,101,1,65000),
(2,1001,106,1,800),
(3,1001,105,1,1500),
(4,1002,102,1,30000),
(5,1003,103,1,2500),
(6,1004,104,1,5000),
(7,1005,107,1,2200),
(8,1006,108,1,3500),
(9,1007,109,1,900),
(10,1008,111,1,3200),
(11,1009,105,1,1500),
(12,1010,101,1,65000),
(13,1011,102,1,30000),
(14,1012,107,2,2200),
(15,1013,106,1,800),
(16,1013,103,1,2500),
(17,1014,112,1,1200),
(18,1015,108,1,3500);

SELECT * FROM customers;

SELECT * FROM products;

SELECT * FROM orders;

SELECT * FROM order_items;

SELECT customer_name, city
FROM customers;

SELECT *
FROM products
WHERE price > 5000;

SELECT *
FROM products
WHERE price BETWEEN 1000 AND 5000;

SELECT *
FROM products
WHERE category = 'Electronics';

SELECT *
FROM products
WHERE stock < 30;

SELECT *
FROM customers
WHERE city = 'Bangalore';

SELECT *
FROM products
ORDER BY price DESC;

SELECT *
FROM products
ORDER BY price ASC;

SELECT *
FROM customers
ORDER BY customer_name ASC;

SELECT COUNT(*) AS total_customers
FROM customers;

SELECT COUNT(*) AS total_products
FROM products;

SELECT AVG(price) AS average_price
FROM products;

SELECT MAX(price) AS highest_price
FROM products;

SELECT MIN(price) AS lowest_price
FROM products;

SELECT SUM(total_amount) AS total_sales
FROM orders;

SELECT category, COUNT(*) AS product_count
FROM products
GROUP BY category;

SELECT category, AVG(price) AS average_price
FROM products
GROUP BY category;

SELECT customer_id, SUM(total_amount) AS total_spending
FROM orders
GROUP BY customer_id;

SELECT customer_id, COUNT(*) AS order_count
FROM orders
GROUP BY customer_id;

SELECT category, AVG(price) AS average_price
FROM products
GROUP BY category
HAVING AVG(price) > 3000;

SELECT
    c.customer_name,
    o.order_id,
    o.order_date,
    o.total_amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

SELECT
    c.customer_name,
    SUM(o.total_amount) AS total_spending
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spending DESC;

SELECT
    oi.order_id,
    p.product_name,
    oi.quantity,
    oi.price
FROM order_items oi
INNER JOIN products p
ON oi.product_id = p.product_id;

SELECT
    o.order_id,
    c.customer_name,
    p.product_name,
    oi.quantity,
    oi.price
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id
INNER JOIN order_items oi
ON o.order_id = oi.order_id
INNER JOIN products p
ON oi.product_id = p.product_id;

SELECT
    c.customer_name,
    o.order_id,
    o.total_amount
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

SELECT
    p.product_name,
    SUM(oi.quantity) AS units_sold
FROM products p
INNER JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY units_sold DESC
LIMIT 5;

SELECT
    p.product_name,
    SUM(oi.quantity) AS units_sold
FROM products p
INNER JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY units_sold DESC
LIMIT 1;

SELECT
    p.product_name,
    SUM(oi.quantity * oi.price) AS revenue
FROM products p
INNER JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY revenue DESC;

SELECT
    c.customer_name,
    SUM(o.total_amount) AS total_spending
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spending DESC
LIMIT 1;

SELECT
    c.customer_name,
    SUM(o.total_amount) AS total_spending
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(o.total_amount) > 10000;

SELECT
    c.customer_name,
    COUNT(o.order_id) AS order_count
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) > 1;

SELECT *
FROM customers
WHERE city IS NULL;

SELECT
    customer_name,
    COALESCE(city, 'Unknown') AS city
FROM customers;

SELECT *
FROM customers
WHERE city IS NOT NULL;

SELECT *
FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
);

SELECT *
FROM products
WHERE price = (
    SELECT MAX(price)
    FROM products
);

SELECT SUM(quantity) AS total_units_sold
FROM order_items;

SELECT *
FROM orders
WHERE total_amount > (
    SELECT AVG(total_amount)
    FROM orders
);

SELECT *
FROM orders
ORDER BY total_amount DESC
LIMIT 1;

SELECT *
FROM products
WHERE stock < 25;

SELECT
    order_date,
    SUM(total_amount) AS daily_sales
FROM orders
GROUP BY order_date
ORDER BY order_date;