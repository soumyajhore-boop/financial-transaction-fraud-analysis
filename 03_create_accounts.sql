USE fraud_detection_db;
CREATE TABLE accounts
(
account_id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT NOT NULL,
account_number VARCHAR(20) UNIQUE NOT NULL,
account_type VARCHAR(30),
opening_date DATE,
balance DECIMAL(15,2),
status VARCHAR(20),
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id)
);