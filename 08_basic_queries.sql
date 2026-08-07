USE fraud_detection_db;

-- ==========================================
-- BASIC SQL QUERIES
-- Project: Financial Transaction Fraud Detection
-- ==========================================

-- Query 1: Display all customers
SELECT * FROM customers;

-- Query 2: Display all accounts
SELECT * FROM accounts;

-- Query 3: Display all transactions
SELECT * FROM transactions;

-- Query 4: Show customer first and last names
SELECT first_name, last_name FROM customers;

-- Query 5: Show account number and balance
SELECT account_number, balance FROM accounts;

-- Query 6: Show customers from Kolkata
SELECT * FROM customers
WHERE city = 'Kolkata';

-- Query 7: Show active accounts
SELECT * FROM accounts
WHERE status = 'Active';

-- Query 8: Show dormant accounts
SELECT * FROM accounts
WHERE status = 'Dormant';

-- Query 9: Show high-risk customers
SELECT * FROM customers
WHERE risk_level = 'High';

-- Query 10: Show all credit transactions
SELECT * FROM transactions
WHERE transaction_type = 'Credit';

-- Query 11: Show all debit transactions
SELECT * FROM transactions
WHERE transaction_type = 'Debit';

-- Query 12: Show all UPI transactions
SELECT * FROM transactions
WHERE payment_mode = 'UPI';

-- Query 13: Show all failed transactions
SELECT * FROM transactions
WHERE status = 'Failed';

-- Query 14: Show all transactions above ₹50,000
SELECT * FROM transactions
WHERE amount > 50000;

-- Query 15: Show all transactions in Mumbai
SELECT * FROM transactions
WHERE city = 'Mumbai';

-- Query 16: Show all Electronics transactions
SELECT * FROM transactions
WHERE merchant_category = 'Electronics';

-- Query 17: Show accounts with balance above ₹1,00,000
SELECT * FROM accounts
WHERE balance > 100000;

-- Query 18: Sort transactions by amount (Highest First)
SELECT * FROM transactions
ORDER BY amount DESC;

-- Query 19: Sort customers by customer_since (Oldest First)
SELECT * FROM customers
ORDER BY customer_since ASC;

-- Query 20: Show Top 10 Highest Transactions
SELECT * FROM transactions
ORDER BY amount DESC
LIMIT 10;