USE ShopDB; 

INSERT INTO Orders (CustomerID, Date)
	VALUES (1, '2024-04-09');

START TRANSACTION;
INSERT INTO OrderItems (OrderID, ProductID, Count)
	VALUES (1, 1, 0);
UPDATE Products SET WarehouseAmount = WarehouseAmount - 1 WHERE ID = '1'; 
UPDATE OrderItems SET Count = Count + 1 WHERE ID = '1';

COMMIT;

