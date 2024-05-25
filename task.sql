USE ShopDB;

INSERT INTO Orders (CustomerID, Date)
VALUES (1, '2024-05-24');

START TRANSACTION;

UPDATE Products SET WarehouseAmount = WarehouseAmount - 1 WHERE ID = '1';
INSERT INTO OrderItems (OrderID, ProductID, Count)
VALUES (1, 1, 1);

COMMIT;
