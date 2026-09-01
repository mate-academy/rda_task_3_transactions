USE ShopDB;

SELECT IFNULL(MAX(ID), 0) + 1 INTO @OrderID
FROM Orders;

START TRANSACTION;

INSERT INTO OrderItems (OrderID, ProductID, Count)
VALUES (@OrderID, 1, 1);

UPDATE Products
SET WarehouseAmount = WarehouseAmount - 1
WHERE ID = 1;

COMMIT;

INSERT INTO Orders (ID, CustomerID, Date)
VALUES (@OrderID, 1, '2023-01-01');