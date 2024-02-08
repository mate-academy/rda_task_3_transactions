-- Use our database
USE ShopDB; 

INSERT INTO Orders (CustomerID, Date)
VALUE (1, '2023-01-01');
-- Start the transaction
START TRANSACTION; 

SET @order_id = LAST_INSERT_ID();

-- Add a product to the order
INSERT INTO OrderItems (OrderID, ProductID, Count)
VALUES (1, 1, 1);

-- Update WarehouseAmount of the product
UPDATE Products
SET WarehouseAmount = WarehouseAmount - 1
WHERE Product.ID = 1;

-- And some data should be created inside the transaction 

COMMIT; 