USE fraud_detection_db;

-- ==========================================
-- FILTERING QUERIES
-- Project: Financial Transaction Fraud Detection
-- ==========================================

-- Query 1: Active Savings Accounts
SELECT * FROM accounts
WHERE account_type = 'Savings' AND status = 'Active';

-- Query 2: High Risk Customers from Kolkata
SELECT * FROM customers
WHERE city = 'Kolkata' AND risk_level = 'High';

-- Query 3: Transactions between ₹10,000 and ₹50,000
SELECT * FROM transactions
WHERE amount BETWEEN 10000 AND 50000;

-- Query 4: Customers from Kolkata OR Delhi
SELECT * FROM customers
WHERE city = 'Kolkata' OR city = 'Delhi';

-- Query 5: Transactions made using UPI OR Debit Card
SELECT * FROM transactions
WHERE payment_mode = 'UPI' OR payment_mode = 'Debit Card';

-- Query 6: Transactions from Shopping category
SELECT * FROM transactions
WHERE merchant_category IN ('Shopping','Electronics');

-- Query 7: Customers from Maharashtra, Delhi or Karnataka
SELECT * FROM customers
WHERE state IN ('Maharashtra','Delhi','Karnataka');

-- Query 8: Transactions NOT using Credit Card
SELECT * FROM transactions
WHERE payment_mode <> 'Credit Card';

-- Query 9: Customers whose first name starts with A
SELECT * FROM customers
WHERE first_name LIKE 'A%';

-- Query 10: Customers whose last name ends with a
SELECT * FROM customers
WHERE last_name LIKE '%a';

-- Query 11: Merchants containing 'Mart'
SELECT * FROM transactions
WHERE merchant_name LIKE '%Mart%';

-- Query 12: Transactions greater than ₹1,00,000
SELECT * FROM transactions
WHERE amount > 100000;

-- Query 13: Transactions below ₹1,000
SELECT * FROM transactions
WHERE amount < 1000;

-- Query 14: Customers born after 1995
SELECT * FROM customers
WHERE date_of_birth > '1995-01-01';

-- Query 15: Customers joined after 2020
SELECT * FROM customers
WHERE customer_since >= '2020-01-01';

-- Query 16: Active accounts with balance above ₹2,00,000
SELECT * FROM accounts
WHERE status='Active' AND balance > 200000;

-- Query 17: Failed UPI Transactions
SELECT * FROM transactions
WHERE payment_mode='UPI' AND status='Failed';

-- Query 18: Successful Debit Transactions
SELECT * FROM transactions
WHERE transaction_type='Debit' AND status='Success';

-- Query 19: Transactions not from Kolkata
SELECT * FROM transactions
WHERE city <> 'Kolkata';

-- Query 20: Transactions ordered by newest first
SELECT * FROM transactions
ORDER BY transaction_date DESC;