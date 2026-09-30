# E-Commerce SQL Database Project

## 📌 Project Overview

This project is a relational database system designed for an e-commerce platform using MySQL.

The database stores and manages information about customers, products, orders, and order items. SQL queries are used to analyze customer spending, product sales, order trends, inventory, and daily revenue.

## 🛠️ Technologies Used

- MySQL
- SQL
- MySQL Workbench

## 🗄️ Database Structure

The database consists of four main tables:

### 1. Customers
Stores customer information such as:
- Customer ID
- Customer Name
- Email
- City

### 2. Products
Stores product information such as:
- Product ID
- Product Name
- Category
- Price
- Stock

### 3. Orders
Stores order information such as:
- Order ID
- Customer ID
- Order Date
- Total Amount

### 4. Order Items
Stores individual products included in each order:
- Order Item ID
- Order ID
- Product ID
- Quantity
- Price

## 🔗 Relationships

- One customer can place multiple orders.
- Each order belongs to one customer.
- An order can contain multiple order items.
- Each order item is associated with a product.
- Foreign keys are used to maintain relationships between tables.

## 📊 SQL Analysis

The project includes SQL queries for:

- Finding top-selling products
- Calculating total units sold
- Calculating product revenue
- Finding customers with the highest spending
- Finding average order value
- Identifying customers with no orders
- Handling NULL values
- Finding products with prices above the average
- Finding products with low stock
- Sorting orders by total amount
- Calculating daily sales
- Using aggregate functions such as `SUM()`, `COUNT()`, and `AVG()`
- Using `GROUP BY`, `ORDER BY`, `WHERE`, and `HAVING`
- Using subqueries
- Using JOIN operations

## 📈 Key SQL Concepts Demonstrated

- Database and table creation
- Primary Keys
- Foreign Keys
- INSERT statements
- SELECT queries
- WHERE conditions
- Aggregate Functions
- GROUP BY
- ORDER BY
- HAVING
- JOINs
- Subqueries
- NULL handling
- Data analysis using SQL

## 🚀 How to Run the Project

1. Install MySQL and MySQL Workbench.
2. Open `ecommerce_project.sql`.
3. Execute the SQL script.
4. The database and required tables will be created.
5. Sample data will be inserted.
6. Run the analysis queries to view the results.

## 📁 Project Files

```text
ecommerce-sql-project/
│
├── ecommerce_project.sql
└── README.md
