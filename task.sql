-- Use our database
USE ShopDB;
INSERT INTO Orders () Values ();
SET @order_id = LAST_INSERT_ID();

START TRANSACTION;
UPDATE Orders SET CustomerID = 1, Date = '2023-01-01' WHERE ID = @order_id;
INSERT INTO OrderItems (OrderID, ProductID, Count) VALUES (@order_id, 1, 1);
UPDATE Products SET WarehouseAmount = WarehouseAmount - 1 WHERE ID = @order_id AND WarehouseAmount >= 1;
COMMIT;
