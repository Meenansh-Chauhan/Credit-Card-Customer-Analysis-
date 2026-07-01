

/*===========================================================================
1. TOTAL CUSTOMERS
Purpose:
Verify that all customer records have been imported successfully.
===========================================================================*/

SELECT COUNT(*) AS total_customers
FROM customers;



/*===========================================================================
2. TOTAL TRANSACTIONS
Purpose:
Verify that all cleaned transactions have been imported successfully.
===========================================================================*/

SELECT COUNT(*) AS total_transactions
FROM transactions;



/*===========================================================================
3. TRANSACTION DATE RANGE
Purpose:
Determine the overall time period covered by the transaction dataset.
===========================================================================*/

SELECT
    MIN(transaction_date) AS first_transaction,
    MAX(transaction_date) AS last_transaction
FROM transactions;



/*===========================================================================
4. CHECK MISSING VALUES (CUSTOMERS)
Purpose:
Ensure important customer attributes contain no unexpected NULL values.
===========================================================================*/

SELECT

    COUNT(*) FILTER (WHERE income IS NULL) AS missing_income,

    COUNT(*) FILTER (WHERE occupation IS NULL) AS missing_occupation,

    COUNT(*) FILTER (WHERE age IS NULL) AS missing_age,

    COUNT(*) FILTER (WHERE gender IS NULL) AS missing_gender

FROM customers;



/*===========================================================================
5. CHECK MISSING VALUES (TRANSACTIONS)
Purpose:
Ensure transactional information is complete.
===========================================================================*/

SELECT

    COUNT(*) FILTER (WHERE amount IS NULL) AS missing_amount,

    COUNT(*) FILTER (WHERE category IS NULL) AS missing_category,

    COUNT(*) FILTER (WHERE transaction_date IS NULL) AS missing_date

FROM transactions;



/*===========================================================================
6. CHECK DUPLICATE CUSTOMER IDs
Purpose:
Customer ID should be unique because it is the primary key.
Expected Output:
No rows returned.
===========================================================================*/

SELECT

    id,
    COUNT(*) AS duplicate_count

FROM customers

GROUP BY id

HAVING COUNT(*) > 1;



/*===========================================================================
7. CHECK DUPLICATE TRANSACTION IDs
Purpose:
Transaction ID should also be unique.
Expected Output:
No rows returned.
===========================================================================*/

SELECT

    id,
    COUNT(*) AS duplicate_count

FROM transactions

GROUP BY id

HAVING COUNT(*) > 1;



/*===========================================================================
8. FOREIGN KEY VALIDATION
Purpose:
Ensure every transaction belongs to an existing customer.

Expected Result:
0 orphan records.
===========================================================================*/

SELECT

    COUNT(*) AS orphan_transactions

FROM transactions t

LEFT JOIN customers c

ON t.customer_id = c.id

WHERE c.id IS NULL;



/*===========================================================================
9. DISTINCT TRANSACTION CATEGORIES
Purpose:
Verify category standardization after data cleaning.
===========================================================================*/

SELECT DISTINCT category

FROM transactions

ORDER BY category;



/*===========================================================================
10. TRANSACTIONS PER CUSTOMER
Purpose:
Check customer transaction frequency.
Useful for segmentation and identifying highly active customers.
===========================================================================*/

SELECT

    customer_id,

    COUNT(*) AS total_transactions

FROM transactions

GROUP BY customer_id

ORDER BY total_transactions DESC;



/*===========================================================================
END OF DATA VALIDATION
===========================================================================*/