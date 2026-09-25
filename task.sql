USE ShopDB;

INSERT INTO Orders (CustomerID, Date)
VALUES (1, '2023-01-01');

SET @OrderID = LAST_INSERT_ID();

START TRANSACTION;

INSERT INTO OrderItems (OrderID, ProductID, Count)
VALUES (@OrderID, 1, 1);

COMMIT;

UPDATE Products
SET WarehouseAmount = WarehouseAmount - 1
WHERE ID = 1;