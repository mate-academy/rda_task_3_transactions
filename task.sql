-- Use our database
USE ShopDB; 

-- Some data should be created outside the transaction (here)
INSERT INTO Orders(CustomerID, DATE) VALUES(1, '2024-05-21');
SET @OrderID = LAST_INSERT_ID();

-- Start the transaction 
START TRANSACTION; 
INSERT INTO OrderItems(OrderID, ProductID, Count) VALUES (@OrderID, 1, 1);
UPDATE Products SET WarehouseAmount = WarehouseAmount - 1 WHERE ID = 1;
-- And some data should be created inside the transaction 

COMMIT; 
