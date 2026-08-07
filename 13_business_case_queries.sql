USE fraud_detection_db;

-- ==========================================
-- BUSINESS CASE QUERIES
-- Financial Transaction Fraud Detection System
-- Beginner to Intermediate SQL
-- ==========================================


-- Query 1: Find all high-risk customers

SELECT
    customer_id,
    first_name,
    last_name,
    city,
    state,
    risk_level
FROM customers
WHERE risk_level = 'High';


-- Query 2: Find high-risk customers with their accounts

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.risk_level,
    a.account_id,
    a.account_number,
    a.account_type,
    a.balance,
    a.status
FROM customers c
JOIN accounts a
    ON c.customer_id = a.customer_id
WHERE c.risk_level = 'High';


-- Query 3: Find customers with multiple accounts

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(a.account_id) AS number_of_accounts
FROM customers c
JOIN accounts a
    ON c.customer_id = a.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING COUNT(a.account_id) > 1;


-- Query 4: Find accounts with balances above ₹5 lakh

SELECT
    account_id,
    account_number,
    account_type,
    balance,
    status
FROM accounts
WHERE balance > 500000
ORDER BY balance DESC;


-- Query 5: Find the 10 largest transactions

SELECT
    transaction_id,
    account_id,
    transaction_date,
    transaction_type,
    amount,
    merchant_name,
    merchant_category,
    city,
    payment_mode
FROM transactions
ORDER BY amount DESC
LIMIT 10;


-- Query 6: Find all failed transactions

SELECT
    transaction_id,
    account_id,
    transaction_date,
    amount,
    merchant_name,
    payment_mode,
    status
FROM transactions
WHERE status = 'Failed'
ORDER BY transaction_date DESC;


-- Query 7: Find all declined transactions

SELECT
    transaction_id,
    account_id,
    transaction_date,
    amount,
    merchant_name,
    merchant_category,
    status
FROM transactions
WHERE status = 'Declined';


-- Query 8: Find high-value transactions above ₹50,000

SELECT
    transaction_id,
    account_id,
    transaction_date,
    amount,
    merchant_name,
    merchant_category,
    city
FROM transactions
WHERE amount > 50000
ORDER BY amount DESC;


-- Query 9: Find high-value transactions made by high-risk customers

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.risk_level,
    a.account_id,
    t.transaction_id,
    t.transaction_date,
    t.amount,
    t.merchant_name
FROM customers c
JOIN accounts a
    ON c.customer_id = a.customer_id
JOIN transactions t
    ON a.account_id = t.account_id
WHERE c.risk_level = 'High'
  AND t.amount > 50000
ORDER BY t.amount DESC;


-- Query 10: Find accounts with frequent transactions

SELECT
    account_id,
    DATE(transaction_date) AS transaction_day,
    COUNT(*) AS transaction_count
FROM transactions
GROUP BY
    account_id,
    DATE(transaction_date)
HAVING COUNT(*) >= 3
ORDER BY transaction_count DESC;


-- Query 11: Find accounts with the highest total transaction value

SELECT
    account_id,
    COUNT(*) AS transaction_count,
    SUM(amount) AS total_transaction_amount
FROM transactions
GROUP BY account_id
ORDER BY total_transaction_amount DESC;


-- Query 12: Find accounts with high transaction volume and value

SELECT
    account_id,
    COUNT(*) AS transaction_count,
    SUM(amount) AS total_amount,
    AVG(amount) AS average_transaction
FROM transactions
GROUP BY account_id
HAVING COUNT(*) >= 3
   AND SUM(amount) > 100000
ORDER BY total_amount DESC;


-- Query 13: Calculate total transaction amount by customer

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(t.amount) AS total_transaction_amount
FROM customers c
JOIN accounts a
    ON c.customer_id = a.customer_id
JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY total_transaction_amount DESC;


-- Query 14: Compare transaction activity by customer risk level

SELECT
    c.risk_level,
    COUNT(DISTINCT c.customer_id) AS customer_count,
    COUNT(t.transaction_id) AS transaction_count,
    SUM(t.amount) AS total_transaction_amount
FROM customers c
JOIN accounts a
    ON c.customer_id = a.customer_id
JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY c.risk_level
ORDER BY total_transaction_amount DESC;


-- Query 15: Find merchant categories with the highest transaction value

SELECT
    merchant_category,
    COUNT(*) AS transaction_count,
    SUM(amount) AS total_amount,
    AVG(amount) AS average_amount
FROM transactions
GROUP BY merchant_category
ORDER BY total_amount DESC;


-- Query 16: Find merchants with the highest number of transactions

SELECT
    merchant_name,
    COUNT(*) AS transaction_count,
    SUM(amount) AS total_amount
FROM transactions
GROUP BY merchant_name
ORDER BY transaction_count DESC
LIMIT 10;


-- Query 17: Find transactions outside the customer's home state

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.state AS customer_state,
    t.transaction_id,
    t.transaction_date,
    t.amount,
    t.merchant_name,
    t.state AS transaction_state
FROM customers c
JOIN accounts a
    ON c.customer_id = a.customer_id
JOIN transactions t
    ON a.account_id = t.account_id
WHERE c.state <> t.state;


-- Query 18: Analyze payment mode usage

SELECT
    payment_mode,
    COUNT(*) AS transaction_count,
    SUM(amount) AS total_amount
FROM transactions
GROUP BY payment_mode
ORDER BY transaction_count DESC;


-- Query 19: Find failed transactions by payment mode

SELECT
    payment_mode,
    COUNT(*) AS total_transactions,
    SUM(
        CASE
            WHEN status = 'Failed' THEN 1
            ELSE 0
        END
    ) AS failed_transactions
FROM transactions
GROUP BY payment_mode
ORDER BY failed_transactions DESC;


-- Query 20: Create a simple fraud flag

SELECT
    transaction_id,
    account_id,
    transaction_date,
    amount,
    merchant_name,
    merchant_category,
    city,
    state,
    status,
    CASE
        WHEN amount > 50000 THEN 'High Value'
        WHEN status = 'Failed' THEN 'Failed Transaction'
        ELSE 'Normal'
    END AS fraud_flag
FROM transactions;


-- Query 21: Create a simple fraud risk classification

SELECT
    transaction_id,
    account_id,
    transaction_date,
    amount,
    merchant_name,
    status,
    CASE
        WHEN amount > 50000
             AND status = 'Failed'
            THEN 'High Risk'

        WHEN amount > 50000
            THEN 'Medium Risk'

        WHEN status = 'Failed'
            THEN 'Medium Risk'

        ELSE 'Low Risk'
    END AS fraud_risk
FROM transactions;
