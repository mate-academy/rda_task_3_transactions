USE ShopDB;

-- Create order OUTSIDE transaction (IMPORTANT per tests)
INSERT INTO Orders (CustomerID, Date)
VALUES (1, '2023-01-01');

SET @order_id = LAST_INSERT_ID();

START TRANSACTION;

-- Add product to order
INSERT INTO OrderItems (OrderID, ProductID, `Count`)
VALUES (@order_id, 1, 1);

-- Update stock
UPDATE Products
SET WarehouseAmount = WarehouseAmount - 1
WHERE ID = 1;

COMMIT;
