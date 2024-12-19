-- Use the ShopDB database
USE ShopDB;

-- Create a new order outside the transaction
INSERT INTO Orders (CustomerID, Date) VALUES (1, '2023-01-01');

-- Start the transaction
START TRANSACTION;

-- Add an order item for the new order inside the transaction
INSERT INTO OrderItems (OrderID, ProductID, Count) VALUES (1, 1, 1);

-- Update the product's WarehouseAmount inside the transaction
UPDATE Products SET WarehouseAmount = WarehouseAmount - 1 WHERE ID = 1;

-- Commit the transaction
COMMIT;
