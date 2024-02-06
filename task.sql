-- Use our database
USE ShopDB; 

-- Some data should be created outside the transaction (here)
INSERT INTO Orders (CustomerID, Date)
VALUES (1, '2024-02-06');

-- Start the transaction 
START TRANSACTION; 

-- And some data should be created inside the transaction 
INSERT INTO OrderItems (OrderID, ProductID, Count)
VALUES (1, 1, 1);

UPDATE Products
SET WarehouseAmount = WarehouseAmount - 1
WHERE Products.ID = 1;

COMMIT;
 