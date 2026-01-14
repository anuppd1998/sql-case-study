USE data_bank;

-- Q1
SELECT
	COUNT(DISTINCT(node_id)) AS [num of different nodes]
FROM customer_nodes;

-- Q2
WITH cte AS (
	SELECT
		cn.region_id,
		node_id,
		r.region_name
	FROM customer_nodes cn
	JOIN regions r
	ON cn.region_id = r.region_id
)
SELECT
	region_name,
	COUNT(node_id) AS num_of_nodes
FROM cte
GROUP BY region_name;

-- Q3
SELECT
	region_name,
	COUNT(customer_id) AS num_of_customers
FROM customer_nodes cn
JOIN regions r ON cn.region_id = r.region_id
GROUP BY region_name
ORDER BY COUNT(customer_id) DESC;

-- Q4
SELECT
	region_name,
	SUM(txn_amount) AS total_transaction
FROM customer_nodes cn
JOIN customer_transactions ct ON cn.customer_id = ct.customer_id
JOIN regions r ON cn.region_id = r.region_id
GROUP BY region_name
ORDER BY SUM(txn_amount) DESC;

-- Q5
SELECT
	AVG (DATEDIFF (DAY, start_date, end_date)) AS [avg day on a node]
FROM customer_nodes
WHERE end_date != '9999-12-31';

-- Q6
SELECT
	txn_type,
	COUNT(txn_type) AS count_txn_type,
	SUM(txn_amount) AS total_txn
FROM customer_transactions
GROUP BY txn_type;

-- Q7
SELECT
	CAST((COUNT(*) * 1.0) / COUNT( DISTINCT (customer_id)) AS DECIMAL(10, 2)) AS avg_num_deposits,
	CAST(AVG(txn_amount) AS DECIMAL(10, 2)) AS avg_size
FROM customer_transactions
WHERE txn_type = 'deposit';

-- Q8
WITH cte AS (
	SELECT
		customer_id, MONTH(txn_date) AS month_id,
		DATENAME (MONTH, txn_date) AS txn_month,
		SUM (CASE WHEN txn_type = 'deposit' THEN 1 ELSE 0 END) AS deposit_count,
		SUM (CASE WHEN txn_type = 'withdrawal' THEN 1 ELSE 0 END) AS withdraw_count,
		SUM (CASE WHEN txn_type = 'purchase' THEN 1 ELSE 0 END) AS purchase_count
	FROM customer_transactions
	GROUP BY DATENAME (MONTH, txn_date), MONTH(txn_date), customer_id
)
SELECT
	txn_month,
	COUNT(customer_id) AS customer_count
FROM cte
WHERE deposit_count > 1
	AND (withdraw_count >= 1
	OR purchase_count >= 1)
GROUP BY txn_month, month_id
ORDER BY month_id;