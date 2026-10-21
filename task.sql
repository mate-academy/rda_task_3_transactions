-- Use our database
USE ShopDB; 

-- The new order is empty when created, so it is created outside the transaction
INSERT INTO Orders (CustomerID, Date) VALUES (1, '2023-01-01');

-- Start the transaction 
START TRANSACTION; 

-- Adding the item and decreasing the stock must succeed or fail together
INSERT INTO OrderItems (OrderID, ProductID, Count) VALUES (1, 1, 1);
UPDATE Products SET WarehouseAmount = WarehouseAmount - 1 WHERE ID = 1;

COMMIT;