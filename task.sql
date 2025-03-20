USE ShopDB; 

INSERT INTO Orders (CustomerID, date)
	VALUES (1, '2025-01-01');

SET @OrderID = LAST_INSERT_ID();

START TRANSACTION; 
INSERT INTO OrderItems(OrderID, ProductID, Count)
	VALUES(OrderID, 1, 1);
UPDATE Products SET WarehouseAmount = WarehouseAmount - 1 
WHERE ID = 1;
COMMIT; 