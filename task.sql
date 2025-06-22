-- Use our database
USE ShopDB; 

-- Some data should be created outside the transaction (here)

-- Start the transaction 
START TRANSACTION; 

INSERT INTO Orders(CustomersID, Date)
VALUES ('1', '2023-01-01');

SET @order_id = 1;

INSERT INTO OrderItems(OrderId, ProductID, Count)
VALUE (@order_id, 1, 1);

UPDATE Products
SET WarehouseAmount = WarehouseAmount - 1
WHERE ID = 1;

-- And some data should be created inside the transaction 

COMMIT; 