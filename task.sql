-- Use our database
USE ShopDB;

-- Some data should be created outside the transaction (here)
-- (nothing needs to be prepared outside the transaction for this order)

-- Start the transaction
START TRANSACTION;

-- And some data should be created inside the transaction

-- Creating the order, adding its item, and decreasing the corresponding
-- product's WarehouseAmount must all succeed or all fail together, so the
-- whole order-creation flow is wrapped in a single transaction.
INSERT INTO Orders (CustomerID, Date)
	VALUES (1, '2023-01-01');

SET @OrderID = LAST_INSERT_ID();

INSERT INTO OrderItems (OrderID, ProductID, Count)
	VALUES (@OrderID, 1, 1);

UPDATE Products
	SET WarehouseAmount = WarehouseAmount - 1
	WHERE ID = 1;

COMMIT;
