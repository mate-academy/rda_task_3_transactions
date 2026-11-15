USE ShopDB; 


INSERT INTO Orders (CustomerID, DATE)
VALUES(1, '2023-01-01');

START TRANSACTION; 

INSERT INTO OrderItems (OrderID, ProductID, Count)
VALUES(1, 1, 1);

UPDATE Products
SET WarehouseAmount = WarehouseAmount - 1
WHERE id = 1;

COMMIT;