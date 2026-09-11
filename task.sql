USE ShopDB;

INSERT INTO Orders (CustomerID, Date)
VALUES (1, '2023-01-01');

SET @NewOrderID = LAST_INSERT_ID();

START TRANSACTION;

INSERT INTO OrderItems (OrderID, ProductID, Count)
VALUES (@NewOrderID, 1, 1);

UPDATE Products
SET WarehouseAmount = WarehouseAmount - 1
WHERE ID = 1;

COMMIT;