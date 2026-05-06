USE ShopDB;
INSERT INTO Orders (CustomerID, Date)
	VALUES ('1', '2026-05-06');
START TRANSACTION;
INSERT INTO OrderItems (OrderID, ProductID, Count)
	VALUES (LAST_INSERT_ID(), '1', '1');
UPDATE Products SET WarehouseAmount = WarehouseAmount - 1 WHERE id = 1;
COMMIT;