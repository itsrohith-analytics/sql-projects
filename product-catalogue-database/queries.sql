-- =========================================
-- PRODUCT CATALOGUE DATABASE : QUERIES
-- =========================================

-- 1. View all products
SELECT * FROM Product;

-- 2. View all categories
SELECT * FROM Category;

-- 3. Products with their category names
SELECT 
    p.ProductName,
    c.CategoryName,
    p.Price
FROM Product p
JOIN Category c
ON p.CategoryID = c.CategoryID;

-- 4. Number of products in each category
SELECT 
    c.CategoryName,
    COUNT(p.ProductID) AS ProductCount
FROM Product p
JOIN Category c
ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryName;

-- 5. Average product price per category
SELECT 
    c.CategoryName,
    AVG(p.Price) AS AveragePrice
FROM Product p
JOIN Category c
ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryName;

-- 6. Most expensive product in each category
SELECT 
    c.CategoryName,
    MAX(p.Price) AS HighestPrice
FROM Product p
JOIN Category c
ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryName;

-- 7. Categories having more than 5 products
SELECT 
    c.CategoryName,
    COUNT(p.ProductID) AS ProductCount
FROM Product p
JOIN Category c
ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryName
HAVING COUNT(p.ProductID) > 5;

-- 8. Products priced above overall average
SELECT 
    ProductName,
    Price
FROM Product
WHERE Price >
(
    SELECT AVG(Price)
    FROM Product
);

-- 9. Products priced above their category average
SELECT 
    p.ProductName,
    p.Price
FROM Product p
WHERE p.Price >
(
    SELECT AVG(p2.Price)
    FROM Product p2
    WHERE p2.CategoryID = p.CategoryID
);

-- 10. Cheapest product in the catalogue
SELECT 
    ProductName,
    Price
FROM Product
ORDER BY Price ASC
LIMIT 1;
