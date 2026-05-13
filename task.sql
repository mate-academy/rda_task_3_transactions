-- Use our database
USE ShopDB;

INSERT INTO Orders(CustomerID, Date)
    VALUES(1, '2026-05-13');

-- Start the transaction 
START TRANSACTION; 

SET @orderId = LAST_INSERT_ID();

INSERT INTO OrderItems(OrderID, ProductID, Count)
    VALUES(@orderId, 1,1);

UPDATE Products SET WarehouseAmount = WarehouseAmount - 1 WHERE ID = 1;
-- And some data should be created inside the transaction 

COMMIT; 