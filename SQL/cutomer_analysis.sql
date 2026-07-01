/*===========================================================================
1. TOTAL CUSTOMERS
Purpose:
Determine the total number of customers.
===========================================================================*/

SELECT COUNT(*) AS total_customers
FROM customers;



/*===========================================================================
2. GENDER DISTRIBUTION
Purpose:
Understand customer distribution by gender.
===========================================================================*/

SELECT
    gender,
    COUNT(*) AS total_customers,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),2) AS percentage
FROM customers
GROUP BY gender
ORDER BY total_customers DESC;



/*===========================================================================
3. AGE DISTRIBUTION
Purpose:
Analyze customer age spread.
===========================================================================*/

SELECT
    age,
    COUNT(*) AS total_customers
FROM customers
GROUP BY age
ORDER BY age;



/*===========================================================================
4. AGE GROUP DISTRIBUTION
Purpose:
Segment customers into business-friendly age groups.
===========================================================================*/

SELECT

CASE
    WHEN age < 25 THEN '18-24'
    WHEN age BETWEEN 25 AND 34 THEN '25-34'
    WHEN age BETWEEN 35 AND 44 THEN '35-44'
    WHEN age BETWEEN 45 AND 54 THEN '45-54'
    ELSE '55+'
END AS age_group,

COUNT(*) AS total_customers

FROM customers

GROUP BY age_group

ORDER BY age_group;



/*===========================================================================
5. AVERAGE CUSTOMER AGE
Purpose:
Calculate average customer age.
===========================================================================*/

SELECT
ROUND(AVG(age),2) AS average_age
FROM customers;



/*===========================================================================
6. INCOME STATISTICS
Purpose:
Understand income distribution.
===========================================================================*/

SELECT

MIN(income) AS minimum_income,

MAX(income) AS maximum_income,

ROUND(AVG(income),2) AS average_income,

PERCENTILE_CONT(0.5)
WITHIN GROUP (ORDER BY income) AS median_income

FROM customers;



/*===========================================================================
7. INCOME TYPE DISTRIBUTION
Purpose:
Analyze customer employment/income source.
===========================================================================*/

SELECT

income_type,

COUNT(*) AS total_customers

FROM customers

GROUP BY income_type

ORDER BY total_customers DESC;



/*===========================================================================
8. OCCUPATION DISTRIBUTION
Purpose:
Identify dominant occupations.
===========================================================================*/

SELECT

occupation,

COUNT(*) AS total_customers

FROM customers

GROUP BY occupation

ORDER BY total_customers DESC;



/*===========================================================================
9. EDUCATION DISTRIBUTION
Purpose:
Analyze education levels of customers.
===========================================================================*/

SELECT

education,

COUNT(*) AS total_customers

FROM customers

GROUP BY education

ORDER BY total_customers DESC;



/*===========================================================================
10. FAMILY STATUS DISTRIBUTION
Purpose:
Analyze marital/family status.
===========================================================================*/

SELECT

family_status,

COUNT(*) AS total_customers

FROM customers

GROUP BY family_status

ORDER BY total_customers DESC;



/*===========================================================================
11. HOUSING TYPE DISTRIBUTION
Purpose:
Understand customers' housing situations.
===========================================================================*/

SELECT

housing_type,

COUNT(*) AS total_customers

FROM customers

GROUP BY housing_type

ORDER BY total_customers DESC;



/*===========================================================================
12. PROPERTY OWNERSHIP
Purpose:
Analyze property ownership among customers.
===========================================================================*/

SELECT

property_owner,

COUNT(*) AS total_customers,

ROUND(COUNT(*)*100.0/SUM(COUNT(*)) OVER(),2) AS percentage

FROM customers

GROUP BY property_owner;



/*===========================================================================
13. CAR OWNERSHIP
Purpose:
Analyze vehicle ownership.
===========================================================================*/

SELECT

car_owner,

COUNT(*) AS total_customers,

ROUND(COUNT(*)*100.0/SUM(COUNT(*)) OVER(),2) AS percentage

FROM customers

GROUP BY car_owner;



/*===========================================================================
14. NUMBER OF CHILDREN
Purpose:
Understand household composition.
===========================================================================*/

SELECT

children,

COUNT(*) AS total_customers

FROM customers

GROUP BY children

ORDER BY children;



/*===========================================================================
15. FAMILY SIZE DISTRIBUTION
Purpose:
Analyze household size.
===========================================================================*/

SELECT

family_members,

COUNT(*) AS total_customers

FROM customers

GROUP BY family_members

ORDER BY family_members;



/*===========================================================================
16. TOP 10 HIGHEST INCOME CUSTOMERS
Purpose:
Identify highest-income customers.
===========================================================================*/

SELECT

id,
income,
occupation,
education,
family_status

FROM customers

ORDER BY income DESC

LIMIT 10;