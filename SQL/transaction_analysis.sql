/*===========================================================================
1. TRANSACTION SUMMARY
Purpose:
Calculate overall transaction KPIs.
===========================================================================*/

SELECT

COUNT(*) AS total_transactions,

ROUND(SUM(amount)::numeric,2) AS total_revenue,

ROUND(AVG(amount)::numeric,2) AS average_transaction_value,

ROUND(MIN(amount)::numeric,2) AS minimum_transaction,

ROUND(MAX(amount)::numeric,2) AS maximum_transaction

FROM transactions;



/*===========================================================================
2. CATEGORY PERFORMANCE
Purpose:
Analyze revenue and transaction volume by spending category.
===========================================================================*/

SELECT

category,

COUNT(*) AS total_transactions,

ROUND(SUM(amount)::numeric,2) AS total_revenue,

ROUND(AVG(amount)::numeric,2) AS average_transaction

FROM transactions

GROUP BY category

ORDER BY total_revenue DESC;



/*===========================================================================
3. CATEGORY REVENUE SHARE
Purpose:
Determine each category's contribution to total revenue.
===========================================================================*/

SELECT

category,

ROUND(SUM(amount)::numeric,2) AS total_revenue,

ROUND(
100 * SUM(amount) / SUM(SUM(amount)) OVER ()
,2) AS revenue_percentage

FROM transactions

GROUP BY category

ORDER BY total_revenue DESC;



/*===========================================================================
4. MONTHLY PERFORMANCE
Purpose:
Analyze monthly transaction volume and revenue.
===========================================================================*/

SELECT

month,

COUNT(*) AS total_transactions,

ROUND(SUM(amount)::numeric,2) AS total_revenue,

ROUND(AVG(amount)::numeric,2) AS average_transaction

FROM transactions

GROUP BY month

ORDER BY month;



/*===========================================================================
5. MONTHLY REVENUE SHARE
Purpose:
Measure each month's contribution to annual revenue.
===========================================================================*/

SELECT

month,

ROUND(SUM(amount)::numeric,2) AS total_revenue,

ROUND(
100 * SUM(amount) / SUM(SUM(amount)) OVER ()
,2) AS revenue_percentage

FROM transactions

GROUP BY month

ORDER BY month;



/*===========================================================================
6. WEEKDAY PERFORMANCE
Purpose:
Evaluate revenue distribution across weekdays.
===========================================================================*/

SELECT

weekday,

COUNT(*) AS total_transactions,

ROUND(SUM(amount)::numeric,2) AS total_revenue,

ROUND(AVG(amount)::numeric,2) AS average_transaction

FROM transactions

GROUP BY weekday

ORDER BY total_revenue DESC;



/*===========================================================================
7. TOP 10 HIGHEST VALUE TRANSACTIONS
Purpose:
Identify the largest individual transactions.
===========================================================================*/

SELECT

id,

customer_id,

category,

amount,

date

FROM transactions

ORDER BY amount DESC

LIMIT 10;



/*===========================================================================
8. MOST ACTIVE CUSTOMERS
Purpose:
Identify customers with the highest transaction frequency.
===========================================================================*/

SELECT

customer_id,

COUNT(*) AS total_transactions,

ROUND(SUM(amount)::numeric,2) AS total_spending

FROM transactions

GROUP BY customer_id

ORDER BY total_transactions DESC,
         total_spending DESC

LIMIT 10;



/*===========================================================================
9. TOP SPENDING CUSTOMERS
Purpose:
Identify customers generating the highest revenue.
===========================================================================*/

SELECT

customer_id,

ROUND(SUM(amount)::numeric,2) AS total_spending,

COUNT(*) AS total_transactions,

ROUND(AVG(amount)::numeric,2) AS average_transaction

FROM transactions

GROUP BY customer_id

ORDER BY total_spending DESC

LIMIT 10;



/*===========================================================================
10. CUSTOMER REVENUE CONTRIBUTION
Purpose:
Measure each customer's percentage contribution to total revenue.
===========================================================================*/

SELECT

customer_id,

ROUND(SUM(amount)::numeric,2) AS total_spending,

ROUND(
100 * SUM(amount) / SUM(SUM(amount)) OVER ()
,2) AS revenue_percentage

FROM transactions

GROUP BY customer_id

ORDER BY total_spending DESC;



/*===========================================================================
11. TRANSACTION VALUE DISTRIBUTION
Purpose:
Group transactions into value bands.
===========================================================================*/

SELECT

CASE

WHEN amount < 1000 THEN 'Below 1K'

WHEN amount BETWEEN 1000 AND 2999 THEN '1K-3K'

WHEN amount BETWEEN 3000 AND 4999 THEN '3K-5K'

WHEN amount BETWEEN 5000 AND 6999 THEN '5K-7K'

ELSE 'Above 7K'

END AS transaction_range,

COUNT(*) AS total_transactions,

ROUND(SUM(amount)::numeric,2) AS total_revenue

FROM transactions

GROUP BY transaction_range

ORDER BY total_revenue DESC;



/*===========================================================================
12. CATEGORY-WISE AVERAGE TRANSACTION VALUE
Purpose:
Compare average transaction value across categories.
===========================================================================*/

SELECT

category,

ROUND(AVG(amount)::numeric,2) AS average_transaction

FROM transactions

GROUP BY category

ORDER BY average_transaction DESC;