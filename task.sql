-- Use our database
USE ShopDB;

-- ShopDB should be created by running create-database.sql before this script.
-- AwersomeProduct with ID 1 and customer with ID 1 are inserted there as initial data.

INSERT INTO Orders (CustomerID, Date)
VALUES (1, '2023-01-01');

-- Start the transaction
START TRANSACTION;

INSERT INTO OrderItems (OrderID, ProductID, Count)
VALUES (1, 1, 1);

UPDATE Products SET WarehouseAmount = WarehouseAmount - 1
WHERE ID = 1;

COMMIT;
