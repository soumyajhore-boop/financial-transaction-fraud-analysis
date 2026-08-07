USE fraud_detection_db;

-- ==========================================
-- BUSINESS CASE QUERIES
-- Project: Financial Transaction Fraud Detection
-- ==========================================

-- Query 1: Top 10 Highest Value Transactions
SELECT *
FROM transactions
ORDER BY amount DESC
LIMIT 10;

------------------------------------------------

-- Query 2: Top 10 Customers by Account Balance
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    a.balance
FROM customers c
INNER JOIN accounts a
ON c.customer_id = a.customer_id
ORDER BY a.balance DESC
LIMIT 10;

------------------------------------------------

-- Query 3: Total Number of Transactions by Payment Mode
SELECT
    payment_mode,
    COUNT(*) AS total_transactions
FROM transactions
GROUP BY payment_mode;

------------------------------------------------

-- Query 4: Total Transaction Amount by Payment Mode
SELECT
    payment_mode,
    SUM(amount) AS total_amount
FROM transactions
GROUP BY payment_mode;

------------------------------------------------

-- Query 5: Total Customers by Risk Level
SELECT
    risk_level,
    COUNT(*) AS total_customers
FROM customers
GROUP BY risk_level;

------------------------------------------------

-- Query 6: Total Accounts by Account Type
SELECT
    account_type,
    COUNT(*) AS total_accounts
FROM accounts
GROUP BY account_type;

------------------------------------------------

-- Query 7: Total Balance by Account Type
SELECT
    account_type,
    SUM(balance) AS total_balance
FROM accounts
GROUP BY account_type;

------------------------------------------------

-- Query 8: Top Merchant Categories by Transaction Value
SELECT
    merchant_category,
    SUM(amount) AS total_sales
FROM transactions
GROUP BY merchant_category
ORDER BY total_sales DESC;

------------------------------------------------

-- Query 9: Total Transactions by City
SELECT
    city,
    COUNT(*) AS total_transactions
FROM transactions
GROUP BY city
ORDER BY total_transactions DESC;

------------------------------------------------

-- Query 10: Total Transaction Amount by State
SELECT
    state,
    SUM(amount) AS total_amount
FROM transactions
GROUP BY state
ORDER BY total_amount DESC;

------------------------------------------------

-- Query 11: High Risk Customers with their Account Balance
SELECT
    c.first_name,
    c.last_name,
    c.risk_level,
    a.balance
FROM customers c
INNER JOIN accounts a
ON c.customer_id = a.customer_id
WHERE c.risk_level = 'High';

------------------------------------------------

-- Query 12: Transactions Above ₹1,00,000
SELECT *
FROM transactions
WHERE amount > 100000
ORDER BY amount DESC;

------------------------------------------------

-- Query 13: Failed Transactions
SELECT *
FROM transactions
WHERE status = 'Failed';

------------------------------------------------

-- Query 14: Active vs Dormant Accounts
SELECT
    status,
    COUNT(*) AS total_accounts
FROM accounts
GROUP BY status;

------------------------------------------------

-- Query 15: Monthly Transaction Summary
SELECT
    MONTH(transaction_date) AS month_number,
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_amount
FROM transactions
GROUP BY MONTH(transaction_date)
ORDER BY month_number;