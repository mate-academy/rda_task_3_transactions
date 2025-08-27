USE ShopDB;

INSERT INTO Orders (CustomerID, Date)
VALUES (1, '2025-08-27');

START TRANSACTION;

SET @order_id = LAST_INSERT_ID();

INSERT INTO OrderItems(OrderID, ProductID, Count)
VALUE (@order_id, 1, 1);

UPDATE Products
SET WarehouseAmount = WarehouseAmount - 1
WHERE ID = 1;

COMMIT;
