-- Data Cleaning
SELECT
	week_date,
	CASE
		WHEN DAY(week_date) BETWEEN 1 AND 7 THEN 1
		WHEN DAY(week_date) BETWEEN 8 AND 14 THEN 2
		WHEN DAY(week_date) BETWEEN 15 AND 21 THEN 3
		ELSE 4
	END AS week_number,
	MONTH(week_date) AS month_number,
	YEAR(week_date) AS calendar_year,
	region, 
	platform,
	CASE
		WHEN segment = 'null' OR segment IS NULL THEN 'Unknown'
		ELSE segment
	END AS segment,
	CASE
		WHEN LEFT(segment, 1) = 'C' THEN 'Couples'
		WHEN LEFT(segment, 1) = 'F' THEN 'Families'
		ELSE 'Unknown'
	END AS demographic,
	CASE
		WHEN RIGHT(segment, 1) = '1' THEN 'Young Adults'
		WHEN RIGHT(segment, 1) = '2' THEN 'Middle Aged'
		WHEN RIGHT(segment, 1) IN ('3', '4') THEN 'Retirees'
		ELSE 'Unknown'
	END AS age_band,
	customer_type,
	transactions,
	sales,
	CAST(((sales * 1.0) / NULLIF(transactions, 0)) AS DECIMAL(10, 2)) AS avg_transaction
INTO clean_weekly_sales
FROM weekly_sales;