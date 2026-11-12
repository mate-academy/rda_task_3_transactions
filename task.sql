-- Use our database
USE ShopDB; 

-- Some data should be created outside the transaction (here)

-- Start the transaction 
START TRANSACTION; 

-- Create a new order
INSERT INTO Orders (CustomerID, Date) VALUES (1, '2026-12-11');

-- Add a product to the order
INSERT INTO OrderItems (OrderID, ProductID, Count) VALUES (LAST_INSERT_ID() , 1, 1);

-- Update Products stock
UPDATE Products SET WarehouseAmount = WarehouseAmount - 1 WHERE ID = '1';

-- And some data should be created inside the transaction 

COMMIT; 