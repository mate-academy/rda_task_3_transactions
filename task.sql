-- Use our database
USE ShopDB; 

-- Some data should be created outside the transaction (here)
INSERT INTO Orders (CustomerID, Date) values (1, CURRENT_DATE); 

-- Start the transaction 
START TRANSACTION; 

-- And some data should be created inside the transaction 
SET @order_id = LAST_INSERT_ID();
INSERT INTO OrderItems (OrderID, ProductID, Count) values (@order_id, 1, 1);
UPDATE Products SET WarehouseAmount = WarehouseAmount - 1 where WarehouseAmount >= 1 and ID = 1;

COMMIT; 