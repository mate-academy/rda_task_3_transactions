-- Use our database
SOURCE 'create-database.sql'
USE ShopDB; 

-- Some data should be created outside the transaction (here)

-- start transaction
START TRANSACTION;

-- 1. create order
INSERT INTO Orders (CustomerID, Date)
VALUES (1, '2023-01-01');

-- get created order id
SET @order_id = LAST_INSERT_ID();

-- 2. create order item (AwersomeProduct id = 1, count = 1)
INSERT INTO OrderItems (OrderID, ProductID, Count)
VALUES (@order_id, 1, 1);

-- 3. decrease warehouse amount
UPDATE Products
SET WarehouseAmount = WarehouseAmount - 1
WHERE ID = 1;

-- commit transaction
COMMIT;