USE ShopDB; 

INSERT INTO Orders (CustomerID, Date)
VALUES (1, CURDATE());

START TRANSACTION;

SELECT WarehouseAmount
FROM Products
WHERE ID = 1
FOR UPDATE;

INSERT INTO OrderItems (OrderID, ProductID, Count)
SELECT LAST_INSERT_ID(), 1, 1
FROM Products
WHERE ID = 1 AND WarehouseAmount > 0;

UPDATE Products
SET WarehouseAmount = WarehouseAmount - 1
WHERE ID = 1 AND WarehouseAmount > 0;

COMMIT;
