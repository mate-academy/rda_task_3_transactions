-- Use our database
USE ShopDB; 
INSERT INTO Orders (CustomerID, DATE) VALUES (1, '2023-01-01');

-- Start the transaction 
START TRANSACTION; 
INSERT INTO OrderItems (OrderID, ProductID, Count) VALUES (1, 1, 1);
UPDATE Products SET WarehouseAmount = WarehouseAmount - 1 WHERE ID = 1;
COMMIT; 
