USE ShopDB;

INSERT INTO Orders (CustomerID, Date)
VALUES (1, '2025-08-27');

START TRANSACTION;

SELECT id
INTO @order_id
FROM Orders
ORDER BY id DESC
LIMIT 1;

INSERT INTO OrderItems(OrderID, ProductID, Count)
VALUE (@order_id, 1, 4);

UPDATE Products
SET WarehouseAmount = WarehouseAmount - 4
WHERE ID = 1;

COMMIT;
