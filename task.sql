-- Use our database
USE ShopDB;

INSERT INTO Orders (ID, CustomerID, Date)
VALUES (1, 1, '2023-01-01');

-- Some data should be created outside the transaction (here)

-- Start the transaction 
START TRANSACTION;
INSERT INTO OrderItems (OrderID, ProductID, Count)
VALUES (1, 1, 1);
UPDATE Products
SET WarehouseAmount = WarehouseAmount - 1
WHERE ID = 1;
-- And some data should be created inside the transaction 

COMMIT; 