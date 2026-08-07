USE fraud_detection_db;
CREATE TABLE customers
(
customer_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
gender VARCHAR(10),
date_of_birth DATE,
city VARCHAR(50),
state VARCHAR(50),
country VARCHAR(50),
customer_since DATE,
risk_level VARCHAR(20)
);