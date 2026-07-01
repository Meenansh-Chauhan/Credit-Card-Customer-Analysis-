-- Most Spending Customers and Average spend
SELECT 
	customer_id, 
	round(sum(amount)::numeric,2) as total_spend, 
	(SELECT round(Avg(amount)::numeric,2) from transactions)
FROM transactions
GROUP by customer_id
ORDER by total_spend desc
LIMIT 10;

-- Category_wise Revenue Distribution and average spending
SELECT 
	category, 
	round(sum(amount)::numeric,2) as Revenue,
	ROUND(AVG(amount)::numeric, 2) AS avg_transaction
FROM transactions 
GROUP by category
order by Revenue desc;

-- Query 3: Monthly Revenue Trend and average spending
SELECT 
	month,ROUND(SUM(amount)::numeric, 2) AS monthly_revenue,
	ROUND(AVG(amount)::numeric, 2) AS avg_transaction
FROM transactions
GROUP BY month
ORDER BY month;

-- Query 4: Customer segmentation by spending
SELECT 
	Customer_id, 
	round(sum(amount)::numeric,2) as total_spent,
    CASE
        When sum(amount) < 10000 then 'low_spender'
        when Sum(amount) between 10001 and 25000 then 'medium_spender'
        else 'High_spender'
    END as customer_segment
FROM transactions
GROUP by customer_id
ORDER by total_spent DESC;


-- Query 5: number of customers and revenue in every spending segment
SELECT
    customer_segment, 
	sum(total_spent) as Revenue,
    COUNT(*) AS total_customers
FROM (
    SELECT
        customer_id, round(sum(amount)::numeric,2) as total_spent,
        CASE
            WHEN SUM(amount) < 10000 THEN 'Low Spender'
            WHEN SUM(amount) BETWEEN 10001 AND 25000 THEN 'Medium Spender'
            ELSE 'High Spender'
        END AS customer_segment
    FROM transactions
    GROUP BY customer_id
) AS segmented_customers
GROUP BY customer_segment
ORDER BY total_customers DESC;

nsqkdn
