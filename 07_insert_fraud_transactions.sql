USE fraud_detection_db;
INSERT INTO transactions
(account_id, transaction_date, transaction_type, amount, merchant_name, merchant_category, city, state, payment_mode, status)
VALUES
(5,'2026-08-04 09:10:21','Debit',250000.00,'Unknown Merchant','Shopping','Mumbai','Maharashtra','UPI','Success'),
(5,'2026-08-04 09:12:08','Debit',245000.00,'Unknown Merchant','Shopping','Delhi','Delhi','UPI','Success'),
(7,'2026-08-04 10:15:11','Debit',180000.00,'Luxury Watches','Luxury','Dubai','Dubai','Credit Card','Success'),
(12,'2026-08-04 11:20:40','Debit',98000.00,'Electronics Hub','Electronics','Kolkata','West Bengal','Debit Card','Failed'),
(12,'2026-08-04 11:21:12','Debit',98000.00,'Electronics Hub','Electronics','Kolkata','West Bengal','Debit Card','Success'),
(18,'2026-08-04 12:02:55','Debit',150000.00,'Crypto Exchange','Crypto','Singapore','Singapore','Net Banking','Success'),
(22,'2026-08-04 12:08:31','Debit',149500.00,'Crypto Exchange','Crypto','Singapore','Singapore','Net Banking','Success'),
(9,'2026-08-04 13:14:50','Debit',210000.00,'Luxury Cars','Automobile','Delhi','Delhi','Credit Card','Success'),
(9,'2026-08-04 13:17:09','Debit',205000.00,'Luxury Cars','Automobile','Chennai','Tamil Nadu','Credit Card','Success'),
(30,'2026-08-04 14:05:40','Debit',320000.00,'Unknown Merchant','Shopping','Bangkok','Thailand','Credit Card','Success'),
(30,'2026-08-04 14:07:12','Debit',318000.00,'Unknown Merchant','Shopping','Bangkok','Thailand','Credit Card','Success'),
(25,'2026-08-04 15:18:42','Debit',199999.00,'High Risk Store','Jewellery','Mumbai','Maharashtra','UPI','Success'),
(25,'2026-08-04 15:20:02','Debit',199500.00,'High Risk Store','Jewellery','Delhi','Delhi','UPI','Success'),
(3,'2026-08-04 16:45:11','Debit',175000.00,'Unknown Electronics','Electronics','Hyderabad','Telangana','Debit Card','Success'),
(3,'2026-08-04 16:46:19','Debit',172000.00,'Unknown Electronics','Electronics','Bangalore','Karnataka','Debit Card','Success');