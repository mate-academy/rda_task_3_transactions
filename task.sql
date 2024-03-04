-- Use our database
USE ShopDB; 

-- Some data should be created outside the transaction (here)
INSERT INTO Orders (ID, CustomerID, Date) VALUES ('1', '1', '2023-01-01');
INSERT INTO OrderItems (ID, OrderID, ProductID, Count) VALUES ('1', '1', '1', '1');

-- Start the transaction 
START TRANSACTION;

UPDATE Products SET WarehouseAmount = 41 WHERE ID = '1';

COMMIT; 