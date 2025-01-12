USE ShopDB;
START TRANSACTION;

INSERT INTO Orders (CustomerID, Date)
VALUES (1, '2023-01-01');

SET @OrderID = LAST_INSERT_ID();

INSERT INTO OrderItems (OrderID, ProductID, Count)
VALUES (@OrderID, 1, 1);

COMMIT;