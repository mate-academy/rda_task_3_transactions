-- Use our database
USE ShopDB;

-- !!!! Important This line is obliged OUTSIDE the transaction due to test.sh
INSERT INTO Orders (CustomerID, Date)
VALUES (1, '2023-01-01');

-- Start the transaction
START TRANSACTION;

INSERT INTO OrderItems (OrderID, ProductID, Count)
    VALUES ( LAST_INSERT_ID(), 1, 1);
UPDATE Products SET WarehouseAmount = WarehouseAmount - 1 WHERE ID = '1' AND WarehouseAmount >= 1;

COMMIT;
