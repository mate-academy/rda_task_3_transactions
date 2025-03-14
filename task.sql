USE ShopDB; 

-- Some data should be created outside the transaction (here)
INSERT INTO Orders (CustomerID, Date)
VALUES (1, '2023-01-01');

SET @OrderID = LAST_INSERT_ID();

-- Start the transaction 
START TRANSACTION; 
INSERT INTO OrderItems (OrderID, ProductID, Count)
VALUES (@OrderID, 1, 1);
UPDATE Products SET WarehouseAmount = WarehouseAmount - 1
WHERE Name = 'AwersomeProduct';

COMMIT; 