-- CREATE DATABASE

CREATE DATABASE BUSINESS_NEW;
USE BUSINESS_NEW;


-- CREATE TABLES

CREATE TABLE Customer
(
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(15),
    city VARCHAR(30)
);

CREATE TABLE Product
(
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50) NOT NULL,
    category VARCHAR(30),
    price DECIMAL(10,2),
    quantity INT
);


-- DISPLAY DATABASE AND TABLES

SHOW DATABASES;
SHOW TABLES;

DESC Customer;
DESC Product;


-- ALTER TABLE: ADD COLUMN

ALTER TABLE Customer
ADD address VARCHAR(100);

DESC Customer;


-- MODIFY COLUMN

ALTER TABLE Customer
MODIFY phone VARCHAR(20);

DESC Customer;


-- RENAME COLUMN

ALTER TABLE Customer
RENAME COLUMN city TO customer_city;

DESC Customer;


-- DROP COLUMN

ALTER TABLE Customer
DROP COLUMN address;

DESC Customer;


-- INSERT CUSTOMER RECORDS

INSERT INTO Customer
(customer_name, email, phone, customer_city)
VALUES
('Arun', 'arun@gmail.com', '9876501234', 'Kochi'),
('Priya', 'priya@gmail.com', '9876501235', 'Pune'),
('Rahul', 'rahul@gmail.com', '9876501236', 'Mumbai'),
('Sneha', 'sneha@gmail.com', '9876501237', 'Bangalore'),
('Kiran', 'kiran@gmail.com', '9876501238', 'Delhi');

SELECT * FROM Customer;


-- INSERT PRODUCT RECORDS

INSERT INTO Product
(product_name, category, price, quantity)
VALUES
('Smartphone', 'Electronics', 25000.00, 12),
('Headphones', 'Electronics', 1200.00, 30),
('Table', 'Furniture', 6500.00, 18),
('Sofa', 'Furniture', 18000.00, 7),
('Printer', 'Electronics', 9500.00, 10);

SELECT * FROM Product;


-- UPDATE CUSTOMER

UPDATE Customer
SET phone = '9998887777'
WHERE customer_id = 1;

SELECT * FROM Customer;


-- UPDATE PRODUCT PRICE

UPDATE Product
SET price = 27000.00
WHERE product_id = 1;

SELECT * FROM Product;


-- UPDATE PRICE AND QUANTITY

UPDATE Product
SET price = 1500.00,
    quantity = 40
WHERE product_id = 2;

SELECT * FROM Product;


-- DELETE CUSTOMER

DELETE FROM Customer
WHERE customer_id = 5;

SELECT * FROM Customer;


-- DELETE PRODUCT

DELETE FROM Product
WHERE product_id = 5;

SELECT * FROM Product;


-- DISPLAY ALL RECORDS

SELECT * FROM Customer;
SELECT * FROM Product;


-- TRUNCATE TABLES

TRUNCATE TABLE Customer;
TRUNCATE TABLE Product;


-- DROP TABLES

DROP TABLE Product;
DROP TABLE Customer;


-- DROP DATABASE

DROP DATABASE BUSINESS_NEW;