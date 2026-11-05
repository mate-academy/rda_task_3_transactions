USE ShopDB;

-- Create an empty order
INSERT INTO Orders (CustomerID, Date)
VALUES (1, '2026-11-05');

SET @order_id = LAST_INSERT_ID();

-- Add a product and update warehouse stock
START TRANSACTION;

INSERT INTO OrderItems (OrderID, ProductID, Count)
VALUES (@order_id, 1, 1);

UPDATE Products
SET WarehouseAmount = WarehouseAmount - 1
WHERE ID = 1 AND WarehouseAmount >= 1;

COMMIT;