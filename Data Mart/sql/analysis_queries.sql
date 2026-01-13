USE data_mart;

SELECT * FROM clean_weekly_sales;

-- Q1
WITH all_weeks AS (
	SELECT 1 AS week_number
	UNION ALL SELECT 2
	UNION ALL SELECT 3
	UNION ALL SELECT 4
)
SELECT a.week_number
FROM all_weeks a
LEFT join (
	SELECT DISTINCT week_number
	FROM clean_weekly_sales
) w
ON a.week_number = w.week_number
WHERE w.week_number IS NULL;

-- Q2
SELECT
	calendar_year,
	SUM(transactions) AS total_transaction
FROM clean_weekly_sales
GROUP BY calendar_year
ORDER BY calendar_year;

-- Q3
SELECT
	region,
	DATENAME(month, DATEFROMPARTS(2000, month_number, 1)) AS month_name,
	SUM(CAST(sales AS BIGINT)) AS total_sales
FROM clean_weekly_sales
GROUP BY region, month_number
ORDER BY region, month_number;

-- Q4
SELECT
	platform,
	COUNT(*) AS count_transactions
FROM clean_weekly_sales
GROUP BY platform;

-- Q5
SELECT * FROM clean_weekly_sales;

WITH cte AS (
	SELECT
		platform,
		DATENAME(month, DATEFROMPARTS(2000, month_number, 1)) AS month_name,
		SUM(CAST(sales AS BIGINT)) AS total_sales
	FROM clean_weekly_sales
	GROUP BY platform, month_number
)
SELECT
	platform,
	month_name,
	CAST(((total_sales * 1.0) / (SELECT SUM(total_sales) FROM cte)) * 100 AS DECIMAL(10, 2)) AS 'sale_%'
FROM cte
ORDER BY platform, month_name;

-- Q6
WITH demographic_cte AS (
	SELECT
		demographic,
		calendar_year,
		SUM(CAST(sales AS BIGINT)) AS total_sales
	FROM clean_weekly_sales
	GROUP BY demographic, calendar_year
)
SELECT
	demographic,
	calendar_year,
	CAST(
		(
			(total_sales * 1.0) / (SELECT SUM(total_sales) FROM demographic_cte)
		) * 100 AS DECIMAL(10, 2)
	) AS 'sale_%'
FROM demographic_cte
ORDER BY demographic, calendar_year;

-- Q7
SELECT TOP 1
	age_band,
	demographic,
	SUM(CAST(sales AS BIGINT)) AS total_sales
FROM clean_weekly_sales
WHERE platform = 'Retail'
GROUP BY age_band, demographic
ORDER BY SUM(CAST(sales AS BIGINT)) DESC;