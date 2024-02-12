-- Use our database
USE ShopDB; 

-- Some data should be created outside the transaction (here)
INSERT INTO Orders (ID, CustomerID, Date)
	VALUES (1, 1, '2024-01-31');
	

-- Start the transaction 
START TRANSACTION; 
INSERT INTO OrderItems (ID, OrderID, ProductID, Count)
	VALUES (1, 1, 1, 1);
-- And some data should be created inside the transaction 
UPDATE Products 
SET WarehouseAmount = WarehouseAmount - 1 WHERE ID = 1;
COMMIT; 