-- Use our database
USE ShopDB; 

INSERT INTO Orders (CustomerID, `Date`)
VALUES (1, CURDATE());

SET @OrderID = LAST_INSERT_ID();

-- Start the transaction 
START TRANSACTION; 

INSERT INTO OrderItems (OrderID, ProductID, Count)
VALUES (@OrderID, 1, 1);

UPDATE Products
SET WarehouseAmount = WarehouseAmount - 1
WHERE ID = 1;

COMMIT; 
