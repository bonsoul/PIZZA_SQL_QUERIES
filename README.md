# 🍕 Pizza Sales SQL Analysis  

## 📌 **Project Overview**  
This project analyzes **pizza sales data** using **SQL queries** to extract key business insights. The queries help track performance metrics, identify sales trends, and evaluate the best and worst-selling pizzas.  

## 📊 **Key Metrics (KPIs)**  
1. **Total Revenue** – Sum of all sales revenue.  
2. **Average Order Value** – Revenue per order.  
3. **Total Pizzas Sold** – Total number of pizzas sold.  
4. **Total Orders** – Number of unique orders.  
5. **Average Pizzas Per Order** – Average number of pizzas per order.  

## 📅 **Sales Trends & Insights**  
- **Daily & Hourly Sales Trends** – Orders grouped by day of the week and hour of the day.  
- **Sales by Pizza Category & Size** – Revenue and percentage contribution per category/size.  
- **Top & Bottom Selling Pizzas** – Best and least-selling pizzas by quantity sold.  

## 🔍 **Filtering Options**  
- Queries can be filtered by **Month, Quarter, or Week** using the `WHERE` clause.  
- Example: To get January sales trends:  
  ```sql
  SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
  FROM pizza_sales
  WHERE MONTH(order_date) = 1
  GROUP BY DATENAME(DW, order_date);
  ```

## 🚀 **Usage**  
- Run queries in **SQL Server, PostgreSQL, or MySQL** (adjust syntax if needed).  
- Use results for **dashboard visualization** in **Power BI or Tableau**.  
