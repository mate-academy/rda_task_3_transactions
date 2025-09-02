-- Use our database
USE ShopDB; 

-- Some data should be created outside the transaction (here)
INSERT INTO Orders () Values ();

-- Start the transaction 
START TRANSACTION; 

-- And some data should be created inside the transaction
UPDATE Orders
SET CustomerID = 1,
Date = '2025-09-02'
WHERE ID = LAST_INSERT_ID();

INSERT INTO OrderItems(OrderID, ProductID, Count) values (LAST_INSERT_ID(), 1, 1);

UPDATE Products
SET WarehouseAmount = WarehouseAmount - 1
WHERE ID = 1;

COMMIT;
