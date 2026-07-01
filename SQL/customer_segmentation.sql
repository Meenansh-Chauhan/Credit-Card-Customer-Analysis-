/*===========================================================================
1. CUSTOMER SPENDING SUMMARY
Purpose:
Calculate total spending, transaction frequency and average transaction value
for each customer.
===========================================================================*/

SELECT

customer_id,

COUNT(*) AS total_transactions,

ROUND(SUM(amount)::numeric,2) AS total_spending,

ROUND(AVG(amount)::numeric,2) AS average_transaction

FROM transactions

GROUP BY customer_id

ORDER BY total_spending DESC;

/*===========================================================================
2. CUSTOMER SEGMENTATION
Purpose:
Divide customers into Low, Medium and High spending groups.
===========================================================================*/

WITH customer_summary AS (

SELECT

customer_id,

COUNT(*) AS total_transactions,

SUM(amount) AS total_spending,

AVG(amount) AS average_transaction

FROM transactions

GROUP BY customer_id

)

SELECT

customer_id,

ROUND(total_spending::numeric,2) AS total_spending,

total_transactions,

ROUND(average_transaction::numeric,2) AS average_transaction,

CASE NTILE(3) OVER(ORDER BY total_spending)

WHEN 1 THEN 'Low Spending'

WHEN 2 THEN 'Medium Spending'

ELSE 'High Spending'

END AS spending_segment

FROM customer_summary

ORDER BY total_spending DESC;

/*===========================================================================
3. SEGMENT SUMMARY
Purpose:
Summarize customers and revenue by spending segment.
===========================================================================*/

WITH customer_summary AS (

SELECT

customer_id,

SUM(amount) AS total_spending

FROM transactions

GROUP BY customer_id

),

segments AS (

SELECT

customer_id,

total_spending,

CASE NTILE(3) OVER(ORDER BY total_spending)

WHEN 1 THEN 'Low Spending'

WHEN 2 THEN 'Medium Spending'

ELSE 'High Spending'

END AS spending_segment

FROM customer_summary

)

SELECT

spending_segment,

COUNT(*) AS total_customers,

ROUND(SUM(total_spending)::numeric,2) AS total_revenue,

ROUND(AVG(total_spending)::numeric,2) AS average_customer_revenue

FROM segments

GROUP BY spending_segment

ORDER BY average_customer_revenue;

/*===========================================================================
4. SEGMENT REVENUE CONTRIBUTION
Purpose:
Measure each customer segment's contribution to overall revenue.
===========================================================================*/

WITH customer_summary AS (

SELECT

customer_id,

SUM(amount) AS total_spending

FROM transactions

GROUP BY customer_id

),

segments AS (

SELECT

customer_id,

total_spending,

CASE NTILE(3) OVER(ORDER BY total_spending)

WHEN 1 THEN 'Low Spending'

WHEN 2 THEN 'Medium Spending'

ELSE 'High Spending'

END AS spending_segment

FROM customer_summary

)

SELECT

spending_segment,

ROUND(SUM(total_spending)::numeric,2) AS revenue,

ROUND(
100*SUM(total_spending)/SUM(SUM(total_spending)) OVER()
,2) AS revenue_percentage

FROM segments

GROUP BY spending_segment

ORDER BY revenue DESC;

/*===========================================================================
5. TOP CUSTOMERS
Purpose:
Identify the highest-value customers.
===========================================================================*/

WITH customer_summary AS (

SELECT

customer_id,

COUNT(*) AS total_transactions,

SUM(amount) AS total_spending

FROM transactions

GROUP BY customer_id

)

SELECT

customer_id,

total_transactions,

ROUND(total_spending::numeric,2) AS total_spending

FROM customer_summary

ORDER BY total_spending DESC

LIMIT 20;