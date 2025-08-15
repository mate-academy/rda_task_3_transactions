USE ShopDB;
INSERT INTO Orders (CustomerID, Date) VALUES (1, '2025-01-01');
SET @order_id = LAST_INSERT_ID();
SET @current_amount = (SELECT WarehouseAmount FROM Products WHERE Name = 'AwersomeProduct');
START TRANSACTION; 
UPDATE Products SET WarehouseAmount = @current_amount - 1 WHERE ID = 1;
INSERT INTO OrderItems (OrderId, ProductId, Count) VALUES (@order_id,1,1);
COMMIT; 