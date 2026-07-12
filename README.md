# Credit Card Customer Segmentation & Spending Analytics

## Overview

This project demonstrates an end-to-end analytics workflow for customer segmentation and spending analysis in the Financial Services domain. The project focuses on transforming raw customer and transaction data into meaningful business insights using Python, PostgreSQL, SQL, and Tableau.

The repository covers the complete analytical pipeline, including data cleaning, synthetic transaction generation, database design, SQL analysis, exploratory data analysis, and customer segmentation.

---

# Business Objective

The objective of this project is to help a financial institution better understand customer spending behaviour by:

- Identifying high-value customers
- Segmenting customers based on spending behaviour
- Understanding transaction patterns
- Supporting targeted marketing strategies
- Building a reusable analytical dataset for future predictive analytics

---

# Project Status

**Current Phase:** Phase 1 – Customer Segmentation & Spending Analytics

### Completed

- Customer Data Cleaning
- Synthetic Transaction Generation
- Transaction Data Cleaning
- PostgreSQL Database Design
- SQL Analysis
- SQL Views
- Python Exploratory Data Analysis
- Customer Segmentation
- Visualization Generation
- Tableau Dashboard

### Planned

- Business Dashboard Storytelling
- Documentation Refinement

---

# Technology Stack

- Python
- Pandas
- NumPy
- PostgreSQL
- SQL
- Jupyter Notebook
- Matplotlib
- Tableau (In Progress)

---

# Repository Structure

```
Credit Card Customer Analytics/

│
├── data/
│   ├── Credit_card.csv
│   ├── Clean_Customer.csv
│   ├── Clean_Transaction.csv
│   ├── customer_summary.csv
│   └── transactions_raw.csv
│
├── Python_src/
│   ├── customer_cleaning.py
│   ├── Transactions_cleaning.py
│   ├── generate_transactions.py
│   ├── DB_creation.py
│   ├── Table_Creation.py
│   └── EDA_Customer_Segmentation.ipynb
│
├── SQL/
│   ├── database_creation.sql
│   ├── table_creation.sql
│   ├── data_validation.sql
│   ├── customer_analysis.sql
│   ├── transaction_analysis.sql
│   ├── customer_segmentation.sql
│   └── views.sql
│
├── visuals/
│
├── .gitignore
├── requirements.txt
└── README.md
```

---

# Dataset Description

## Customer Dataset

**Rows:** 1,525

**Columns**

- id
- gender
- car_owner
- propert_owner
- children
- income
- type_income
- education
- marital_status
- housing_type
- age
- days_employed
- mobile_phone
- work_phone
- phone
- email_id
- type_occupation
- family_members

---

## Transaction Dataset

**Rows:** 1,675

**Columns**

- id
- customer_id
- amount
- category
- date
- month
- weekday
- day

---

# Project Workflow

```
Raw Customer Dataset
        │
        ▼
Customer Data Cleaning
        │
        ▼
Clean Customer Dataset
        │
        ▼
Synthetic Transaction Generation
        │
        ▼
Raw Transaction Dataset
        │
        ▼
Transaction Data Cleaning
        │
        ▼
Clean Transaction Dataset
        │
        ▼
PostgreSQL Database
        │
        ▼
SQL Analysis
        │
        ▼
Python Exploratory Data Analysis
        │
        ▼
Customer Segmentation
        │
        ▼
Customer Summary Dataset
        │
        ▼
Tableau Dashboard
```

---

# SQL Modules

The SQL folder includes:

- Database Creation
- Table Creation
- Data Validation
- Customer Analysis
- Transaction Analysis
- Customer Segmentation
- Reusable SQL Views

---

# Python Analysis

The notebook is divided into the following sections:

### Section A

Dataset Overview

- Data Loading
- Data Validation
- Descriptive Statistics

### Section B

Transaction Analysis

- Revenue KPIs
- Category Performance
- Monthly Revenue Analysis
- Monthly Transaction Analysis
- Transaction Distribution
- Top Spending Customers

### Section C

Customer Spending Analysis

- Revenue by Age Group
- Revenue by Gender
- Revenue by Income Type
- Revenue by Education
- Revenue by Occupation
- Revenue by Housing Type

### Section D

Customer Segmentation

- Customer Summary Dataset
- Spending Distribution
- Spending Segmentation
- Segment Comparison
- Tableau Dataset Export

---
# Tableau Dashboard

Dashboard page 1

![alt text](image.png)

Dashboard page 2

![alt text](image-1.png)

---

# Current Outputs

Generated visualizations include:

- Revenue by Spending Category
- Monthly Revenue Trend
- Monthly Transaction Volume
- Transaction Amount Distribution
- Top Spending Customers
- Revenue by Age Group
- Revenue by Gender
- Revenue by Income Type
- Revenue by Education
- Revenue by Occupation
- Revenue by Housing Type
- Customer Spending Distribution
- Customer Segment Distribution
- Revenue by Spending Segment
- Average Spending by Segment
- Average Transactions by Segment

---

# Future Roadmap

## Phase 1

Customer Segmentation & Spending Analytics

(Current Phase)

---

## Phase 2

Customer Churn Prediction

---

## Phase 3

Customer Retention Analytics

Potential future enhancements:

- Customer Lifetime Value (CLV)
- Credit Risk Analytics

---

# Author

**Meenansh Chauhan**

Business Analytics | Data Analytics | SQL | Python | PostgreSQL | Tableau

# Credit Card Customer Segmentation & Spending Analytics

An end-to-end Business Analytics project demonstrating customer segmentation, spending analytics, SQL data modeling, Python EDA, PostgreSQL database design, and interactive Tableau dashboards.
