USE ShopDB; 

INSERT INTO Orders (ID, CustomerID, Date) VALUES (1, 1, '2024-07-09');

START TRANSACTION; 

INSERT INTO OrderItems (ID, OrderID, ProductID, Count) VALUES (1, 1, 1, 1);
UPDATE Products SET WarehouseAmount = (WarehouseAmount - 1) WHERE Name = "AwersomeProduct";

COMMIT; 
