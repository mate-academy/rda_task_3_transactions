-- Use our database
USE ShopDB;

-- Start the transaction
START TRANSACTION;

-- And some data should be created inside the transaction 
INSERT INTO Orders (CustomerID, Date) VALUES (1, '2023-01-01');
UPDATE Products SET WarehouseAmount = WarehouseAmount - 1 WHERE ID = 1;

COMMIT;