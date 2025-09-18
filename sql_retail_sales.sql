CREATE DATABASE sql_project_1;

-- making tabless ;
DROP TABLE IF EXISTS retail_sales;
CREATE TABLE retail_sales
					(
						transactions_id INT PRIMARY KEY,
                        sale_date DATE,
						sale_time TIME,	
						customer_id INT,
                        gender	VARCHAR (15),
						age INT,
                        category VARCHAR(15),
						quantity	FLOAT,
						price_per_unit	FLOAT,
						cogs	FLOAT,
						total_sale FLOAT
					);
SELECT*FROM retail_sales
LIMIT 10;

-- to check if correct data is imported--
SELECT
COUNT(*)
FROM retail_sales;

-- finding null--

SELECT * FROM retail_sales
WHERE transactions_id IS NULL
	OR 
	sale_date IS NULL
	OR 
	sale_time IS NULL
	OR 
	customer_id IS NULL
	OR 
	gender IS NULL
	OR 
	age IS NULL
	OR
	category IS NULL
	OR 
	quantity IS NULL
	OR
	price_per_unit IS NULL
	OR
	total_sale IS NULL;
    
DELETE FROM retail_sales
WHERE transactions_id IS NULL
	OR 
	sale_date IS NULL
	OR 
	sale_time IS NULL
	OR 
	customer_id IS NULL
	OR 
	gender IS NULL
	OR 
	age IS NULL
	OR
	category IS NULL
	OR 
	quantity IS NULL
	OR
	price_per_unit IS NULL
	OR
	total_sale IS NULL;
    
-- Data exploration--
-- how many sales we have?--
 SELECT COUNT(*)  AS total_sales FROM retail_sales;
 
 -- How many UNIQUE Customers we have?--
 SELECT COUNT( DISTINCT customer_id) AS total_sales FROM retail_sales;
 SELECT DISTINCT category FROM retail_sales;


-- DATA ANALYSIS and Key Business Problems and Answers-- 
-- Q1) Write a SQL query to retrieve all columns for sales made on '2022-11-05'
SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05' ;
-- q2) Write a SQL query to retrive all transactions where the category is clothing and quantity ordered in month of nov-2022

SELECT *
FROM retail_sales
WHERE category = 'Clothing'
  AND MONTH(sale_date) = 11
  AND YEAR(sale_date) = 2022
  AND quantity > 4;
  
SELECT *
FROM retail_sales
WHERE LOWER(category) = 'clothing'
  AND DATE_FORMAT(sale_date, '%Y-%m') = '2022-11'
 AND quantity > 4 ;
 


-- q3) Write SQL query to calculate total sales for each category

SELECT 
	Category,
    SUM(total_sale) AS net_sale,
    COUNT(*) as total_orders
FROM retail_sales
GROUP BY 1;

-- q4) write SQL query to find out age of customers who purchased from beauty category

SELECT 
	ROUND(AVG(age),2) AS avg_age
FROM retail_sales
WHERE Category = 'beauty';
     
-- q5) query for finding out all transactions where total_sale is greater than 1000
SELECT 
	*
FROM retail_sales 
WHERE total_sale > 1000;

-- q5) write an SQL query to find the total no of transactions (transaction id ) made by each gender in each category
SELECT category,
		gender,
    COUNT(*) AS total_trans
FROM retail_sales
GROUP
	BY
    category,
    gender;
-- q6) avg sale for each month. find best selling month in each year
SELECT 
	 YEAR (sale_date),
     month(sale_date),
     AVG(total_sale)
FROM retail_sales as avg_sale
GROUP BY 1,2
ORDER BY 1,2;

-- q8) write sql query to find top 5 customers based on highest total sales
SELECT customer_id,
	SUM(total_sale) as total_sale
FROM retail_sales 
GROUP BY 1
ORDER BY 2 DESC
limit 5;

-- q9) write sql query to find unique customers from each category

SELECT  CATEGORY,
		COUNT(DISTINCT customer_id) as cont_unique_cs
FROM retail_sales
GROUP BY category;


						
