/*===========================================================================
1. CREATE CUSTOMERS TABLE
Purpose:
Store customer demographic and profile information.
===========================================================================*/

DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (

    id INTEGER PRIMARY KEY,

    gender VARCHAR(20),

    car_owner VARCHAR(5),

    property_owner VARCHAR(5),

    children INTEGER,

    income DOUBLE PRECISION,

    income_type VARCHAR(50),

    education VARCHAR(100),

    family_status VARCHAR(50),

    housing_type VARCHAR(100),

    age INTEGER,

    days_employed INTEGER,

    mobile_phone INTEGER,

    work_phone INTEGER,

    phone INTEGER,

    email_id INTEGER,

    occupation VARCHAR(100),

    family_members INTEGER

);



/*===========================================================================
2. CREATE TRANSACTIONS TABLE
Purpose:
Store customer transaction history.
===========================================================================*/

CREATE TABLE transactions (

    id INTEGER PRIMARY KEY,

    customer_id INTEGER NOT NULL,

    amount DOUBLE PRECISION,

    category VARCHAR(50),

    date DATE,

    month INTEGER,

    weekday VARCHAR(20),

    day INTEGER,

    CONSTRAINT fk_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(id)

);