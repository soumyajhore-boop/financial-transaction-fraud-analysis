USE fraud_detection_db;

-- ==========================================
-- AGGREGATE FUNCTION QUERIES
-- Project: Financial Transaction Fraud Detection
-- ==========================================

-- Query 1: Total number of customers
SELECT COUNT(*) AS Total_Customers FROM customers;

-- Query 2: Total number of accounts
SELECT COUNT(*) AS Total_Accounts FROM accounts;

-- Query 3: Total number of transactions
SELECT COUNT(*) AS Total_Transactions FROM transactions;

-- Query 4: Total transaction amount
SELECT SUM(amount) AS Total_Transaction_Amount FROM transactions;

-- Query 5: Average transaction amount
SELECT AVG(amount) AS Average_Transaction_Amount FROM transactions;

-- Query 6: Highest transaction amount
SELECT MAX(amount) AS Highest_Transaction FROM transactions;

-- Query 7: Lowest transaction amount
SELECT MIN(amount) AS Lowest_Transaction FROM transactions;

-- Query 8: Average account balance
SELECT AVG(balance) AS Average_Balance FROM accounts;

-- Query 9: Highest account balance
SELECT MAX(balance) AS Highest_Balance FROM accounts;

-- Query 10: Lowest account balance
SELECT MIN(balance) AS Lowest_Balance FROM accounts;

-- Query 11: Total balance in all accounts
SELECT SUM(balance) AS Total_Bank_Balance FROM accounts;

-- Query 12: Number of Active Accounts
SELECT COUNT(*) AS Active_Accounts
FROM accounts WHERE status='Active';

-- Query 13: Number of Dormant Accounts
SELECT COUNT(*) AS Dormant_Accounts
FROM accounts WHERE status='Dormant';

-- Query 14: Number of High Risk Customers
SELECT COUNT(*) AS High_Risk_Customers
FROM customers WHERE risk_level='High';

-- Query 15: Total Debit Transactions
SELECT COUNT(*) AS Debit_Transactions
FROM transactions WHERE transaction_type='Debit';

-- Query 16: Total Credit Transactions
SELECT COUNT(*) AS Credit_Transactions
FROM transactions WHERE transaction_type='Credit';

-- Query 17: Total Failed Transactions
SELECT COUNT(*) AS Failed_Transactions
FROM transactions WHERE status='Failed';

-- Query 18: Total Successful Transactions
SELECT COUNT(*) AS Successful_Transactions
FROM transactions WHERE status='Success';

-- Query 19: Total UPI Transaction Amount
SELECT SUM(amount) AS Total_UPI_Amount
FROM transactions WHERE payment_mode='UPI';

-- Query 20: Average Debit Transaction Amount
SELECT AVG(amount) AS Average_Debit_Amount
FROM transactions WHERE transaction_type='Debit';