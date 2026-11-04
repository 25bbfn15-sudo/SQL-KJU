CREATE DATABASE ShopDB;

USE ShopDB;

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

-- INSERT CUSTOMER DATA
INSERT INTO Customer (customer_name, email, phone, city)
VALUES
('Arjun', 'arjun@gmail.com', '9876543210', 'Bangalore'),
('Meera', 'meera@gmail.com', '9876543211', 'Chennai'),
('Rahul', 'rahul@gmail.com', '9876543212', 'Kochi'),
('Ananya', 'ananya@gmail.com', '9876543213', 'Mumbai'),
('Kiran', 'kiran@gmail.com', '9876543214', 'Hyderabad');

-- INSERT PRODUCT DATA
INSERT INTO Product (product_name, category, price, quantity)
VALUES
('Laptop', 'Electronics', 55000.00, 10),
('Smartphone', 'Electronics', 25000.00, 15),
('Office Chair', 'Furniture', 4500.00, 20),
('Notebook', 'Stationery', 80.00, 100),
('Headphones', 'Accessories', 1500.00, 25);

SHOW DATABASES;

SHOW TABLES;

SELECT * FROM Customer;

SELECT * FROM Product;

DESC Customer;

DESC Product;

ALTER TABLE Customer
ADD address VARCHAR(100);

DESC Customer;

ALTER TABLE Customer
MODIFY phone VARCHAR(20);

DESC Customer;

ALTER TABLE Customer
RENAME COLUMN city TO customer_city;

DESC Customer;

ALTER TABLE Customer
DROP COLUMN address;

DESC Customer;

TRUNCATE TABLE Customer;

TRUNCATE TABLE Product;

DESC Customer;

DROP TABLE Product;

DROP TABLE Customer;

DROP DATABASE ShopDB;