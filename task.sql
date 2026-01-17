USE ShopDB;


INSERT INTO Orders (CustomerID, Date) VALUES (1, '2023-01-01');

START TRANSACTION;

INSERT INTO OrderItems (OrderID, ProductID, Count) VALUES (LAST_INSERT_ID(), 1, 1);

UPDATE Products SET WarehouseAmount = WarehouseAmount - 1 WHERE ID = 1;

COMMIT; 