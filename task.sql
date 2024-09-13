-- Use our database
USE ShopDB; 

-- Some data should be created outside the transaction (here)
INSERT INTO Orders (CustomerID, Date)
VALUES (1, CURRENT_DATE());

-- Start the transaction 
START TRANSACTION; 
UPDATE Products SET WarehouseAmount = WarehouseAmount - 1 WHERE ID = '1';
INSERT INTO OrderItems (OrderID, ProductID, Count)
VALUES (1, 1, 1);

-- And some data should be created inside the transaction 

COMMIT; 
