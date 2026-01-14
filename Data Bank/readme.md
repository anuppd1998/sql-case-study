# 🏦 Case Study: Data Bank
## 📖 Introduction
Data Bank is a fictional "Neo-Bank" that operates solely online. This innovative institution connects the world of digital banking with cloud data storage. Customers are allocated cloud storage space based directly on the balances they maintain in their accounts.

The goal of this case study is to perform data analysis to help the Data Bank team calculate key metrics and accurately plan for future business growth.

## 🗄️ Database Schema
The database consists of three primary tables:

1. Regions:
    - Stores the geographical locations where nodes are distributed.
    - `region_id:` Unique identifier for each region ``(INT)``.
    - `region_name:` Name of the region `(VARCHAR)`.

2. Customer Nodes: 
    - Contains information regarding how customers are distributed across different network nodes.
    - `customer_id:` Unique identifier for each customer ``(INT)``.
    - `region_id:` Link to the Regions table ``(INT)``.
    - `node_id:` Unique identifier for the specific node `(INT)`.
    - `start_date:` The date the customer joined the node `(DATE)`.
    - `end_date:` The date the customer left the node `(DATE)`.
end_date
3. Customer Transactions
    - Logs every transaction made by customers within the system.
    - `customer_id:` Unique identifier for the customer `(INT)`.
    - `txn_date:` Date of the transaction `(DATE)`.
    - `txn_type:` Type of transaction (Deposit, Withdrawal, Purchase) `(VARCHAR)`.
    - `txn_amount:` The value of the transaction `(INT)`.

![alt text](image.png)

## 🧹 Data Cleansing Performed
Before performing the analysis, the raw data required type casting to ensure date calculations (like DATEDIFF) would function correctly. The original schema imported date columns as strings.

The following transformations were applied:
- `customer_nodes`: Converted `start_date` and `end_date`  from `VARCHAR` to `DATE`.
- `customer_transactions`: Converted `txn_date`  from `VARCHAR` to DA`TE.

## 📁 Repository Structure
```
├── sql/
│   ├── schema_making.sql
│   ├── data_cleansing.sql
│   └── analytical_queries.sql
├── dataset/
│   └── customer_nodes.csv
│   └── customer_transactions.csv
│   └── regions.csv
├── README.md
```

## 🚀 Case Study Questions Addressed
The following business questions were analyzed using SQL:
1. *Network Nodes:* How many different nodes make up the Data Bank network?
2. *Regional Distribution:* How many nodes are there in each region? 
3. *Customer Distribution:* How many customers are divided among the regions?
4. *Transaction Totals:* Determine the total amount of transactions for each region name.
5. *Node Mobility:* How long does it take on average to move clients to a new node? 
6. *Transaction Metrics:* What is the unique count and total amount for each transaction type? 
7. *Deposit Analysis:* What is the average number and size of past deposits across all customers? 
8. *Monthly Active Users:* For each month, how many Data Bank customers make more than 1 deposit and at least either 1 purchase or 1 withdrawal?

## 🛠️ Skills Used
- Data Aggregation: `SUM, COUNT, AVG`
- Common Table Expressions (CTEs)
- Date Functions: `DATEDIFF, DATENAME, MONTH`
- Data Filtering: `HAVING, WHERE`
- Joins: `INNER JOIN`

## Contact
anuppd.1998@gmail.com <br>
Junior SQC Officer | Learning SQL, Python & Data Engineering | Building projects with LeetCode & real-world datasets