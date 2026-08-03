-- Use our database
USE ShopDB;

-- Start the transaction
START TRANSACTION;

-- Create a new order
INSERT INTO Orders (CustomerID, Date) VALUES (1, '2023-01-01');

-- Add AwersomeProduct (ID 1) to the order, quantity 1
INSERT INTO OrderItems (OrderID, ProductID, Count)
VALUES (LAST_INSERT_ID(), 1, 1);

-- Decrease the warehouse amount by the ordered quantity
UPDATE Products
SET WarehouseAmount = WarehouseAmount - 1
WHERE ID = 1;

COMMIT;