USE fraud_detection_db;

-- ==========================================
-- GROUP BY & HAVING
-- Project: Financial Transaction Fraud Detection
-- ==========================================

-- Query 1: Number of customers in each city
SELECT city, COUNT(*) AS total_customers
FROM customers GROUP BY city;

-- Query 2: Number of customers in each state
SELECT state, COUNT(*) AS total_customers
FROM customers GROUP BY state;

-- Query 3: Number of accounts by account type
SELECT account_type, COUNT(*) AS total_accounts
FROM accounts GROUP BY account_type;

-- Query 4: Number of accounts by status
SELECT status, COUNT(*) AS total_accounts
FROM accounts GROUP BY status;

-- Query 5: Total balance by account type
SELECT account_type,
SUM(balance) AS total_balance
FROM accounts
GROUP BY account_type;

-- Query 6: Average balance by account type
SELECT account_type, AVG(balance) AS average_balance
FROM accounts GROUP BY account_type;

-- Query 7: Total transaction amount by payment mode
SELECT payment_mode, SUM(amount) AS total_amount
FROM transactions GROUP BY payment_mode;

-- Query 8: Number of transactions by payment mode
SELECT payment_mode, COUNT(*) AS total_transactions
FROM transactions GROUP BY payment_mode;

-- Query 9: Total transaction amount by merchant category
SELECT merchant_category, SUM(amount) AS total_amount
FROM transactions GROUP BY merchant_category;

-- Query 10: Number of transactions by merchant category
SELECT merchant_category, COUNT(*) AS total_transactions
FROM transactions GROUP BY merchant_category;

-- Query 11: Total transaction amount by city
SELECT city, SUM(amount) AS total_amount
FROM transactions GROUP BY city;

-- Query 12: Average transaction amount by city
SELECT city, AVG(amount) AS average_amount
FROM transactions GROUP BY city;

-- Query 13: Total Debit amount by city
SELECT city, SUM(amount) AS debit_amount
FROM transactions WHERE transaction_type='Debit' GROUP BY city;

-- Query 14: Total Credit amount by city
SELECT city, SUM(amount) AS credit_amount
FROM transactions WHERE transaction_type='Credit' GROUP BY city;

-- Query 15: Number of High Risk customers by state
SELECT state, COUNT(*) AS high_risk_customers
FROM customers WHERE risk_level='High' GROUP BY state;

-- Query 16: Merchant categories having more than 2 transactions
SELECT merchant_category, COUNT(*) AS total_transactions
FROM transactions GROUP BY merchant_category HAVING COUNT(*) > 2;

-- Query 17: Cities having total transaction amount above ₹1,00,000
SELECT city, SUM(amount) AS total_amount
FROM transactions GROUP BY city HAVING SUM(amount) > 100000;

-- Query 18: Payment modes having more than 5 transactions
SELECT payment_mode, COUNT(*) AS total_transactions
FROM transactions GROUP BY payment_mode HAVING COUNT(*) > 5;

-- Query 19: Account types having average balance above ₹2,00,000
SELECT account_type, AVG(balance) AS average_balance
FROM accounts GROUP BY account_type HAVING AVG(balance) > 200000;

-- Query 20: States having more than 2 customers
SELECT state, COUNT(*) AS total_customers
FROM customers GROUP BY state HAVING COUNT(*) > 2;