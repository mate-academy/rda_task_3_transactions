-- Use our database
USE ShopDB;

-- Create empty order outside transaction
INSERT INTO Orders (CustomerID, Date)
VALUES (1, '2023-01-01');

-- Start the transaction
START TRANSACTION;

-- Add product to the order (OrderID = 1, ProductID = 1, Count = 1)
INSERT INTO OrderItems (OrderID, ProductID, Count)
VALUES (1, 1, 1);

-- Decrease warehouse amount
UPDATE Products
SET WarehouseAmount = WarehouseAmount - 1
WHERE ID = 1;

COMMIT;
