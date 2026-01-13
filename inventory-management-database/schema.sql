-- Step 1: Create Database
CREATE DATABASE InventoryDB;
USE InventoryDB;

-- Step 2: Create Table - Category
CREATE TABLE Category (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(100) NOT NULL,
    Description TEXT,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    IsActive BOOLEAN DEFAULT TRUE
);

-- Step 3: Create Table - Supplier
CREATE TABLE Supplier (
    SupplierID INT PRIMARY KEY AUTO_INCREMENT,
    SupplierName VARCHAR(100) NOT NULL,
    ContactEmail VARCHAR(100),
    PhoneNumber VARCHAR(15),
    Address TEXT,
    IsVerified BOOLEAN DEFAULT FALSE
);

-- Step 4: Create Table - Product
CREATE TABLE Product (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100) NOT NULL,
    CategoryID INT,
    SupplierID INT,
    QuantityInStock INT DEFAULT 0,
    Price DECIMAL(10,2),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID),
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);

-- Step 5: Create Table - Customer
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Address TEXT,
    RegisteredAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Step 6: Create Table - Orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    ProductID INT,
    QuantityOrdered INT,
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);
