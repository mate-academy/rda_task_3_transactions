-- Use our database
USE ShopDB;

-- Some data should be created outside the transaction (here)
-- A new order is created empty, so a single INSERT keeps the database
-- consistent on its own and does not need a transaction.
INSERT INTO Orders (CustomerID, Date)
    VALUES (1, '2023-01-01');

SET @OrderID = LAST_INSERT_ID();

-- Start the transaction
START TRANSACTION;

-- And some data should be created inside the transaction
-- Adding an order item and decreasing the warehouse amount must happen
-- together: either both succeed, or neither does.
INSERT INTO OrderItems (OrderID, ProductID, Count)
    VALUES (@OrderID, 1, 1);

UPDATE Products
    SET WarehouseAmount = WarehouseAmount - 1
    WHERE ID = 1;

COMMIT;