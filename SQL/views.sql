
/*===========================================================================
1. CUSTOMER SUMMARY VIEW
Purpose:
Create a reusable customer-level summary containing key spending metrics.
===========================================================================*/

DROP VIEW IF EXISTS customer_segments;
DROP VIEW IF EXISTS customer_summary;

CREATE VIEW customer_summary AS

SELECT

    customer_id,

    COUNT(*) AS total_transactions,

    ROUND(SUM(amount)::numeric,2) AS total_spending,

    ROUND(AVG(amount)::numeric,2) AS average_transaction,

    MIN(date) AS first_transaction,

    MAX(date) AS last_transaction

FROM transactions

GROUP BY customer_id;

/*===========================================================================
2. CUSTOMER SEGMENTS VIEW
Purpose:
Categorize customers into spending segments using total spending.
===========================================================================*/

CREATE VIEW customer_segments AS

SELECT

    customer_id,

    total_transactions,

    total_spending,

    average_transaction,

    first_transaction,

    last_transaction,

    CASE NTILE(3) OVER(ORDER BY total_spending)

        WHEN 1 THEN 'Low Spending'

        WHEN 2 THEN 'Medium Spending'

        ELSE 'High Spending'

    END AS spending_segment

FROM customer_summary;