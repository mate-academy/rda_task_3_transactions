USE ShopDB;

INSERT INTO Orders (CustomerID, Date)
	VALUES ('1', CURRENT_DATE());

START TRANSACTION; 

INSERT INTO OrderItems (OrderID, ProductID, Count)
	VALUES ('1', '1', 1);

UPDATE Products SET WarehouseAmount = WarehouseAmount - 1 WHERE ID = '1';

COMMIT;
