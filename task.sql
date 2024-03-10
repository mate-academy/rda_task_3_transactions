USE ShopDB;

INSERT INTO Orders (ID, CustomerID, Date)
	VALUES ('1', '1', '2024-01-10');


START TRANSACTION; 

INSERT INTO OrderItems (OrderID, ProductID, Count)
	VALUES ('1', '1', '1');

UPDATE Products SET WarehouseAmount = Products.WarehouseAmount - 1 WHERE Products.ID = '1';
UPDATE OrderItems SET Count = OrderItems.Count + 1 WHERE OrderID = '1' AND ProductID = '1';

COMMIT;
