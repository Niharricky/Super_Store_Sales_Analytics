-- 1.Total sales & profit 
select round(sum(sales),2) as total_sales ,
round(sum(profit),2) as total_profit
FROM sales_clean;

--2. Sales by region
select region , round(sum(sales),2) as total_sales from sales_clean group by region order by total_sales desc

-- Sales by category
select category,round(sum(sales),2) as total_sales from sales_clean group by category order by total_sales desc

-- 3.Top 10 products by sales
select TOP 10 product_id,product_name, round(sum(sales),2) as total_sales from sales_clean GROUP by product_id,product_name order by total_sales desc

-- 4.Loss making products
SELECT 
    sub_category,
    round(SUM(profit),2) AS profit
FROM sales_clean
GROUP BY sub_category
HAVING SUM(profit) < 0;

select product_name,
round(sum(profit),2) as profit from 
sales_clean GROUP by product_name having SUM(profit) < 0 order by profit asc;

-- 5.Monthly sales trend
select year(order_date) as order_year,(MONTH(order_date)) as order_month,round(sum(sales),2) as total_sales from sales_clean GROUP by year(order_date),month(order_date) order by order_year,order_month asc;

-- 6.Which region has high sales but low profit
SELECT region,
       ROUND(SUM(sales), 2)  AS total_sales,
       ROUND(SUM(profit), 2) AS total_profit,
       ROUND(SUM(profit) / NULLIF(SUM(sales), 0) * 100, 2)
           AS profit_margin_pct
FROM sales_clean
GROUP BY region
ORDER BY total_sales DESC, profit_margin_pct ASC;

-- 7.Which customer segment is most profitable
SELECT segment,round(sum(profit),2) as total_profit from sales_clean GROUP by segment order by total_profit desc 

-- 8.Which Category should company focus on
SELECT category,
       ROUND(SUM(sales), 2)  AS total_sales,
       ROUND(SUM(profit), 2) AS total_profit,
       ROUND(SUM(profit) / NULLIF(SUM(sales), 0) * 100, 2)
           AS profit_margin_pct
FROM sales_clean
GROUP BY category
ORDER BY total_profit DESC;

SELECT * FROM sales_clean


