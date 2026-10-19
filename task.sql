-- Use our database
USE ShopDB; 

-- Some data should be created outside the transaction (here)


-- Start the transaction 
START TRANSACTION;

-- 1. Create a new order
INSERT INTO Orders (CustomerID, Date)
VALUES (1, '2023-01-01');

-- 2. Add a product to the order
INSERT INTO OrderItems (OrderID, ProductID, Count)
VALUES (1, 1, 1);

-- 3. Decrease the product's warehouse amount
UPDATE Products
SET WarehouseAmount = WarehouseAmount - 1
WHERE ID = 1;

COMMIT; 