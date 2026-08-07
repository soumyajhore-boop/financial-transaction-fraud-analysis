USE fraud_detection_db;

-- ==========================================
-- JOINS
-- Project: Financial Transaction Fraud Detection
-- ==========================================

-- Query 1: Customer with Account Details
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    a.account_number,
    a.account_type,
    a.balance
FROM customers c
INNER JOIN accounts a
ON c.customer_id = a.customer_id;

-- Query 2: Customer Name with Transaction Details
SELECT
    c.first_name,
    c.last_name,
    t.transaction_id,
    t.amount,
    t.transaction_type
FROM customers c
INNER JOIN accounts a
ON c.customer_id = a.customer_id
INNER JOIN transactions t
ON a.account_id = t.account_id;

-- Query 3: Customer Name with Account Balance
SELECT
    c.first_name,
    c.last_name,
    a.balance
FROM customers c
INNER JOIN accounts a
ON c.customer_id = a.customer_id;

-- Query 4: Account Number with Transactions
SELECT
    a.account_number,
    t.transaction_date,
    t.amount
FROM accounts a
INNER JOIN transactions t
ON a.account_id = t.account_id;

-- Query 5: Show Customer City with Transactions
SELECT
    c.city,
    t.amount,
    t.payment_mode
FROM customers c
INNER JOIN accounts a
ON c.customer_id=a.customer_id
INNER JOIN transactions t
ON a.account_id=t.account_id;

-- Query 6: High Risk Customers and their Accounts
SELECT
    c.first_name,
    c.last_name,
    c.risk_level,
    a.account_number
FROM customers c
INNER JOIN accounts a
ON c.customer_id=a.customer_id
WHERE c.risk_level='High';

-- Query 7: Salary Accounts with Customer Names
SELECT
    c.first_name,
    c.last_name,
    a.account_number
FROM customers c
INNER JOIN accounts a
ON c.customer_id=a.customer_id
WHERE a.account_type='Salary';

-- Query 8: Transactions with Account Type
SELECT
    a.account_type,
    t.amount,
    t.payment_mode
FROM accounts a
INNER JOIN transactions t
ON a.account_id=t.account_id;

-- Query 9: Customer, Account and Merchant
SELECT
    c.first_name,
    a.account_number,
    t.merchant_name
FROM customers c
INNER JOIN accounts a
ON c.customer_id=a.customer_id
INNER JOIN transactions t
ON a.account_id=t.account_id;

-- Query 10: Customer and Transaction Status
SELECT
    c.first_name,
    t.status,
    t.amount
FROM customers c
INNER JOIN accounts a
ON c.customer_id=a.customer_id
INNER JOIN transactions t
ON a.account_id=t.account_id;

-- Query 11: LEFT JOIN - Customers with Accounts
SELECT
    c.first_name,
    a.account_number
FROM customers c
LEFT JOIN accounts a
ON c.customer_id=a.customer_id;

-- Query 12: LEFT JOIN - Accounts with Transactions
SELECT
    a.account_number,
    t.transaction_id
FROM accounts a
LEFT JOIN transactions t
ON a.account_id=t.account_id;

-- Query 13: Customers with Failed Transactions
SELECT
    c.first_name,
    c.last_name,
    t.amount
FROM customers c
INNER JOIN accounts a
ON c.customer_id=a.customer_id
INNER JOIN transactions t
ON a.account_id=t.account_id
WHERE t.status='Failed';

-- Query 14: Customers using UPI
SELECT
    c.first_name,
    t.payment_mode
FROM customers c
INNER JOIN accounts a
ON c.customer_id=a.customer_id
INNER JOIN transactions t
ON a.account_id=t.account_id
WHERE t.payment_mode='UPI';

-- Query 15: Customers with Transactions above ₹1,00,000
SELECT
    c.first_name,
    c.last_name,
    t.amount
FROM customers c
INNER JOIN accounts a
ON c.customer_id=a.customer_id
INNER JOIN transactions t
ON a.account_id=t.account_id
WHERE t.amount>100000;

-- Query 16: Customer Name and Merchant Category
SELECT
    c.first_name,
    t.merchant_category
FROM customers c
INNER JOIN accounts a
ON c.customer_id=a.customer_id
INNER JOIN transactions t
ON a.account_id=t.account_id;

-- Query 17: Customer, Balance and Risk Level
SELECT
    c.first_name,
    a.balance,
    c.risk_level
FROM customers c
INNER JOIN accounts a
ON c.customer_id=a.customer_id;

-- Query 18: Customer with Account Status
SELECT
    c.first_name,
    a.status
FROM customers c
INNER JOIN accounts a
ON c.customer_id=a.customer_id;

-- Query 19: Customer with Transaction City
SELECT
    c.first_name,
    t.city
FROM customers c
INNER JOIN accounts a
ON c.customer_id=a.customer_id
INNER JOIN transactions t
ON a.account_id=t.account_id;

-- Query 20: Complete Customer Banking Details
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    a.account_number,
    a.account_type,
    a.balance,
    t.transaction_date,
    t.amount,
    t.payment_mode,
    t.status
FROM customers c
INNER JOIN accounts a
ON c.customer_id=a.customer_id
INNER JOIN transactions t
ON a.account_id=t.account_id;