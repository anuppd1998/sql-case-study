# 🛒 SQL Case Study 1 – Data Mart Analysis

This repository contains my complete solution to the **Data Mart Analysis SQL case study**.

The project focuses on cleaning, transforming, and analyzing weekly sales data to measure the business impact of supply‑chain changes introduced in **June 2020**, where Data Mart switched to sustainable packaging across all products.



## 📌 Project Objectives

- Perform full **data cleansing and feature engineering** on raw sales data
- Create a reusable analytics table: `clean_weekly_sales`
- Explore sales performance by:

  - Time (weeks, months, years)
  - Region
  - Platform (Retail vs Shopify)
  - Customer demographics and age bands
- Identify key contributors to Retail sales


## 🗂 Dataset Information

**Table name:** `weekly_sales`
```
| Column       | Description            |
| ------------ | ---------------------- |
| week_date    | Date of the week       |
| region       | Sales region           |
| platform     | Retail / Shopify       |
| segment      | Customer segment code  |
| customer     | Customer type          |
| transactions | Number of transactions |
| sales        | Total sales            |
```


## 🧹 Data Cleansing Performed

A new table `clean_weekly_sales` was created with the following enhancements:

- `week_number` – week of year
- `month_number` – calendar month
- `calendar_year` – year (2018–2020)
- `age_band` – derived from segment

  - 1 → Young Adults
  - 2 → Middle Aged
  - 3 or 4 → Retirees
- `demographic` – derived from segment

  - C → Couples
  - F → Families
- Replaced NULL values with `"unknown"`
- `avg_transaction` = sales / transactions (rounded to 2 decimals)



## 🔍 Analysis Questions Answered

### Data Exploration

1. Missing week numbers in the dataset
2. Total transactions per year
3. Monthly sales by region
4. Transaction count by platform
5. Monthly sales percentage: Retail vs Shopify
6. Yearly sales percentage by demographic
7. Highest contributing **age_band + demographic** combination for Retail sales

All answers are implemented using optimized SQL queries.



## 🧠 Skills Demonstrated

* SQL data cleaning
* Date manipulation
* CASE statements
* Aggregations & grouping
* Window functions
* Business analytics
* Performance optimization


## 🛠 Technologies Used

* SQL (PostgreSQL / SQL Server compatible)
* Git & GitHub


## 📁 Repository Structure

```
├── sql/
│   ├── schema_making.sql
│   ├── data_cleansing.sql
│   └── analysis_queries.sql
├── dataset/
│   └── weekly_sales.csv
├── README.md
```


## 📬 Contact

**Anup Prasad**
Junior SQC Officer | Learning SQL, Python & Data Engineering | Building projects with LeetCode & real-world datasets

---

⭐ If you find this project useful, feel free to star the repository!
