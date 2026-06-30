USE ShopDB;  
START TRANSACTION; 
INSERT INTO Orders (CustomerID, Date) VALUES (1, '2023-01-01');
INSERT INTO OrderItems (ProductID, Count, OrderID) VALUES (1, 1, LAST_INSERT_ID());
UPDATE Products SET WarehouseAmount = WarehouseAmount - 1 WHERE ID = 1;
COMMIT; 