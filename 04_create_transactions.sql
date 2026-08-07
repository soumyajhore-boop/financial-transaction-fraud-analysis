USE fraud_detection_db;
CREATE TABLE transactions
(
transaction_id INT PRIMARY KEY AUTO_INCREMENT,
account_id INT NOT NULL,
Transaction_date DATETIME NOT NULL,
transaction_type VARCHAR(20),
amount DECIMAL(12,2) NOT NULL,
merchant_name VARCHAR(100),
merchant_category VARCHAR(50),
city VARCHAR(50),
state VARCHAR(50),
payment_mode VARCHAR(30),
status VARCHAR(20),
FOREIGN KEY (account_id)
REFERENCES accounts(account_id)
);