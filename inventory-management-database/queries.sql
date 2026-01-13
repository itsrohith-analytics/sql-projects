-- =========================================
-- INVENTORY MANAGEMENT DATABASE : QUERIES
-- =========================================

-- 1. View all products
SELECT * FROM Product;

-- 2. View all categories
SELECT * FROM Category;

-- 3. View all suppliers
SELECT * FROM Supplier;

-- 4. Products with their category names
SELECT 
    p.ProductName,
    c.CategoryName
FROM Product p
JOIN Category c
ON p.CategoryID = c.CategoryID;

-- 5. Products with supplier details
SELECT 
    p.ProductName,
    s.SupplierName
FROM Product p
JOIN Supplier s
ON p.SupplierID = s.SupplierID;

-- 6. Products with low stock (less than 20)
SELECT 
    ProductName,
    StockQuantity
FROM Product
WHERE StockQuantity < 20;

-- 7. Number of products per category
SELECT 
    c.CategoryName,
    COUNT(p.ProductID) AS ProductCount
FROM Product p
JOIN Category c
ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryName;

-- 8. Total stock quantity per category
SELECT 
    c.CategoryName,
    SUM(p.StockQuantity) AS TotalStock
FROM Product p
JOIN Category c
ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryName;

-- 9. Supplier-wise product count
SELECT 
    s.SupplierName,
    COUNT(p.ProductID) AS SuppliedProducts
FROM Product p
JOIN Supplier s
ON p.SupplierID = s.SupplierID
GROUP BY s.SupplierName;

-- 10. Products priced higher than average price
SELECT 
    ProductName,
    Price
FROM Product
WHERE Price >
(
    SELECT AVG(Price)
    FROM Product
);
