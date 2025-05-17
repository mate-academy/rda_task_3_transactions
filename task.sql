-- Використовуємо базу даних
USE ShopDB;

START TRANSACTION;

INSERT INTO Orders (CustomerID, Date)
VALUES (1, '2023-01-01');

SET @OrderID = LAST_INSERT_ID();

INSERT INTO OrderItems (OrderID, ProductID, Count)
VALUES (@OrderID, 1, 1);

UPDATE Products
SET WarehouseAmount = WarehouseAmount - 1
WHERE ID = 1;

COMMIT;
