-- SQL Queries for:

-- Total Revenue
SELECT SUM(total_price) AS total_revenue FROM pizza_sales_harmonized;

-- Average Order Value
SELECT SUM(total_price)/COUNT(DISTINCT(order_id)) AS avg_order_value  FROM pizza_sales_harmonized

-- Total Pizzas Sold
SELECT SUM(quantity) AS total_pizzas_sold FROM pizza_sales_harmonized

-- Total Orders
SELECT COUNT(DISTINCT(order_id)) AS total_Orders FROM pizza_sales_harmonized

-- Average Pizzas Per Order 
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT(order_id)) AS DECIMAL(10,2)) AS DECIMAL(10,2)) 
AS avg_pizzas_per_order 
FROM pizza_sales_harmonized

-- Daily Trend for Orders
SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT(order_id)) AS total_orders 
FROM pizza_sales_harmonized
GROUP BY DATENAME(DW, order_date)

-- Monthly Trend for Orders
SELECT DATENAME(MONTH, order_date) AS month_name, COUNT(DISTINCT(order_id)) AS total_orders
FROM pizza_sales_harmonized
GROUP BY DATENAME(MONTH, order_date)

-- % of Sales by Pizza Category
SELECT pizza_category, CAST(SUM(total_price) AS decimal(10,2)) AS total_revenue, 
CAST(SUM(total_price)*100 / (SELECT SUM(total_price) FROM pizza_sales_harmonized) 
AS decimal(10,2)) AS contribution_percentage
FROM pizza_sales_harmonized 
GROUP BY pizza_category

-- % of Sales by Pizza Size
SELECT  pizza_size, CAST(SUM(total_price) AS decimal(10,2)) AS total_revenue, 
CAST(SUM(total_price)*100 / (SELECT SUM(total_price) FROM pizza_sales_harmonized) 
AS decimal(10,2)) AS contribution_percentage
FROM pizza_sales_harmonized
GROUP BY pizza_size

-- Total Pizzas Sold by Pizza Category
SELECT  pizza_category, SUM(quantity) AS total_quantity_sold
FROM pizza_sales_harmonized
GROUP BY pizza_category

-- Top 5 Pizzas by Revenue
SELECT TOP 5 pizza_name, SUM(total_price) AS total_revenue
FROM pizza_sales_harmonized
GROUP BY pizza_name
ORDER BY total_revenue DESC

-- Bottom 5 Pizzas by Revenue
SELECT TOP 5 pizza_name, SUM(total_price) AS total_revenue
FROM pizza_sales_harmonized
GROUP BY pizza_name
ORDER BY total_revenue ASC

-- Top 5 Pizzas by Quantity
SELECT TOP 5 pizza_name, SUM(quantity) AS total_quantity
FROM pizza_sales_harmonized
GROUP BY pizza_name
ORDER BY total_quantity DESC

-- Bottom 5 Pizzas by Quantity
SELECT TOP 5 pizza_name, SUM(quantity) AS total_quantity
FROM pizza_sales_harmonized
GROUP BY pizza_name
ORDER BY total_quantity ASC

-- Top 5 Pizzas by Total Orders
SELECT TOP 5 pizza_name, COUNT(DISTINCT(order_id)) AS total_orders
FROM pizza_sales_harmonized
GROUP BY pizza_name
ORDER BY total_orders DESC

-- Bottom 5 Pizzas by Total Orders
SELECT TOP 5 pizza_name, COUNT(DISTINCT(order_id)) AS total_orders
FROM pizza_sales_harmonized
GROUP BY pizza_name
ORDER BY total_orders ASC

-- Viewing Dataset
SELECT * FROM pizza_sales_harmonized

