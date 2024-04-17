--Reading Data

SELECT *
FROM pizza_sales_data

--KPI's Develoment
--E OF Orders

--Total Pizza Sold
SELECT SUM(quantity) Total_Pizza_Sold
FROM pizza_sales_data

--Total Orders
SELECT COUNT(DISTINCT order_id) Total_Orders
FROM pizza_sales_data

--Total Revenue

SELECT SUM(total_price) Total_Pizza_Price
FROM pizza_sales_data


--Average Order Value
SELECT (SUM(total_price) /COUNT(Distinct order_id)) Average_Order_Value
FROM pizza_sales_data

SELECT CAST(CAST(SUM(quantity) AS DECIMAL (10,2)) / 
CAST(COUNT(DISTINCT order_id) AS decimal (10,2)) AS DECIMAL (10,2)) Average_Pizza_Price_Order
FROM pizza_sales_data

--Daily Trend
SELECT DATENAME(DW, order_date) Order_Day, COUNT(DISTINCT order_id) Total_Orders
FROM pizza_sales_data
Group By DATENAME(DW, order_date)

--Hour Trend
SELECT DATEPART(HOUR,order_time) order_hours, COUNT(DISTINCT order_id) Total_Orders
FROM pizza_sales_data
GROUP BY DATEPART(HOUR,order_time)
ORDER BY DATEPART(HOUR,order_time)

--Category PCT
SELECT pizza_category ,CAST(SUM(total_price) AS DECIMAL(10,2)) Total_Sales,CAST(SUM(total_price)*100/
(SELECT SUM(total_price) FROM pizza_sales_data) AS DECIMAL (10,2))PCT
FROM pizza_sales_data
GROUP BY pizza_category

--Month Filter
SELECT pizza_category ,CAST(SUM(total_price) AS DECIMAL(10,2)) Total_Sales,CAST(SUM(total_price)*100/
(SELECT SUM(total_price) FROM pizza_sales_data) AS DECIMAL (10,2))PCT
FROM pizza_sales_data
WHERE MONTH(order_date) = 2
GROUP BY pizza_category

--Pizza Size
SELECT pizza_size ,CAST(SUM(total_price) AS DECIMAL(10,2)) Total_Sales,CAST(SUM(total_price)*100/
(SELECT SUM(total_price) FROM pizza_sales_data) AS DECIMAL (10,2))PCT
FROM pizza_sales_data
GROUP BY pizza_size
ORDER BY pizza_size

--Top 5 Pizza
SELECT TOP 5 pizza_name, SUM(quantity) Total_Pizza_Sold
FROM pizza_sales_data
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold desc

--Quarter Filter
SELECT DATENAME(DW, order_date) Order_Day, COUNT(DISTINCT order_id) Total_Orders
FROM pizza_sales_data
WHERE DATEPART(QUARTER,order_date) = 4
Group By DATENAME(DW, order_date)