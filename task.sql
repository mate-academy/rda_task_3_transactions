-- Use our database
USE ShopDB;

-- Some data should be created outside the transaction (here)

-- Creating an order is a standalone action: a new order starts out empty,
-- so it does not need to be atomic with anything else.
INSERT INTO Orders (CustomerID, Date)
	VALUES (1, '2023-01-01');

-- Start the transaction
START TRANSACTION;

-- And some data should be created inside the transaction

-- Adding an order item and decreasing the corresponding product's
-- WarehouseAmount must happen together, or not at all, to keep stock
-- counts consistent with what has actually been ordered.
INSERT INTO OrderItems (OrderID, ProductID, Count)
	VALUES (1, 1, 1);

UPDATE Products
	SET WarehouseAmount = WarehouseAmount - 1
	WHERE ID = 1;

COMMIT;