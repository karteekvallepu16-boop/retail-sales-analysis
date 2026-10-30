select*from retail_sales


--Find total revenue by product category

select category,
	sum(unit_price*quantity) as total_revenue
	from retail_sales
	group by category
	order by total_revenue desc;


--Find the number of transactions in each category

select category,
	count(*) as total_transactions
	from retail_sales
	group by category
	order by total_transactions desc;

--Find the top-selling product

select product,
	sum(quantity) as total_quantity
	from retail_sales
	group by product
	order by total_quantity desc
	limit 1;

--Find total profit by category

	select category,
		sum((unit_price-unit_cost)*quantity) as total_profit
		from retail_sales
		group by category
		order by total_profit desc;

--Find monthly revenue
select 
		DATE_TRUNC('month',order_date) as sales_month,
		sum(unit_price*quantity) as monthly_revenue
		from retail_sales
		group by sales_month
		order by monthly_revenue asc;

--Find the highest-profit product

select product,
	sum((unit_price-unit_cost)*quantity) as total_profit
from retail_sales
	group by product
	order by total_profit desc
	limit 1;

--Calculate revenue by region

select region,
	sum(unit_price*quantity) as total_revenue
from retail_sales
	group by region
	order by total_revenue desc;

--Find the highest-revenue product category

select category,
	sum(unit_price*quantity) as total_revenue
	from retail_sales
	group by category
	order by total_revenue desc
	limit 1

--Find the most profitable region

select region,
	sum((unit_price-unit_cost)*quantity) as total_profit
	from retail_sales
	group by region
	order by total_profit desc
	limit 1;

--Find monthly revenue

select 
	date_trunc('month',order_date) as sales_month,
	sum(unit_price*quantity) as monthly_revenue
	from retail_sales
	group by sales_month
	order by monthly_revenue asc;

--Find the top 3 products by total revenue

select product,
	sum(unit_price*quantity) as total_revenue
	from retail_sales
	group by product
	order by total_revenue desc
	limit 3;

--Count orders by region

select region,
		count(*) as order_count
		from retail_sales
		group by region;
		
--Which product generates the highest total profit?

select product,
	sum((unit_price-unit_cost)*quantity) as total_profit
	from retail_sales
	group by product
	order by total_profit desc
	limit 1;

--Calculate profit margin by product
SELECT
    product,
    ROUND(
        ((unit_price - unit_cost) / NULLIF(unit_price, 0)) * 100,
        2
    ) AS profit_margin_percentage
FROM retail_sales;

--Calculate total revenue and total profit by region

select region,
 	sum(unit_price*quantity) as total_revenue,
	sum((unit_price-unit_cost)*quantity) as total_profit
	from retail_sales
	group by region
	order by total_profit desc;


--Find the best-selling category by quantity

select category,
	sum(quantity) as total_quantity
	from retail_sales
	group by category
	order by total_quantity desc;

--Find the average selling price by product

select product,
 	avg(unit_price) as average_price
	from retail_sales
	group by product
	order by average_price desc;

--Find products with total revenue greater than 10,000

select product,
	sum(unit_price*quantity) as total_revenue
	from retail_sales
	group by product
	having(sum(unit_price*quantity)>10000)
	order by total_revenue desc;

--Profit by region above 5,000
select region,
	sum((unit_price-unit_cost)*quantity) as total_profit
	from retail_sales
	group by region
	having(sum((unit_price-unit_cost)*quantity)>5000)
	order by total_profit desc;

--Find each category's revenue and quantity sold

select category,
	sum(unit_price*quantity) as total_revenue,
	sum(quantity) as quantity_sold
	from retail_sales
	group by category
	order by total_revenue desc;

--find the top 3 regions by total profit.

select region,
	sum((unit_price-unit_cost)*quantity) as total_profit
	from retail_sales
	group by region
	order by total_profit desc
	limit 3;

--Find the product with the lowest total revenue

select product,
	sum(unit_price*quantity) as total_revenue
	from retail_sales
	group by product
	order by total_revenue asc
	limit 1;

--Calculate overall profit
select
	sum((unit_price-unit_cost)*quantity) as total_profit
	from retail_sales;

--Calculate total revenue and total profit

select
	sum(unit_price*quantity) as total_revenue,
	sum((unit_price-unit_cost)*quantity) as total_profit
	from retail_sales;

--Calculate profit margin percentage

SELECT
    SUM(unit_price * quantity) AS total_revenue,
    SUM((unit_price - unit_cost) * quantity) AS total_profit,
    ROUND(
        SUM((unit_price - unit_cost) * quantity) * 100.0
        / NULLIF(SUM(unit_price * quantity), 0),
        2
    ) AS profit_margin_percentage
FROM retail_sales;

--Find profit margin by product category.

select category,
	sum(unit_price*quantity) as total_revenue,
	sum((unit_price-unit_cost)*quantity) as total_profit,
	round(sum((unit_price-unit_cost)*quantity)*100.0
	/nullif(sum(unit_price*quantity),0),2) as profit_margin_percentage
	from retail_sales
	group by category
	order by profit_margin_percentage;

--Find monthly total profit
select 
	date_trunc('month',order_date) as sales_month,
	sum((unit_price-unit_cost)*quantity) as total_profit
	from retail_sales
	group by sales_month
	order by total_profit asc;

--Find the best-selling product in each category

SELECT
    category,
    product,
    SUM(quantity) AS total_quantity
FROM retail_sales
GROUP BY category, product
ORDER BY category ASC, total_quantity DESC;

--Find the top 5 products by total profit.

select product,
	sum((unit_price-unit_cost)*quantity) as total_profit
	from retail_sales
	group by product
	order by total_profit desc
	limit 5;
