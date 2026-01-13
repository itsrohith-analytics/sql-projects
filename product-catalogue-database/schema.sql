-- Step 1: Create the database
CREATE DATABASE ProductCatalogueDB;

-- Step 2: Use the database
USE ProductCatalogueDB;

-- Step 3: Create tables

-- 1. Category Table
CREATE TABLE Category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100),
    description TEXT,
    created_date DATE,
    status VARCHAR(20)
);

-- 2. Supplier Table
CREATE TABLE Supplier (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100),
    contact_email VARCHAR(100),
    phone_number VARCHAR(15),
    location VARCHAR(100)
);

-- 3. Product Table
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2),
    stock_quantity INT,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

-- 4. Customer Table
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    address TEXT
);

-- 5. Order Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);
