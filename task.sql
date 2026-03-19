-- Use our database
USE ShopDB; 

-- Some data should be created outside the transaction (here)
-- Creating an empty order is safe without a transaction
INSERT INTO Orders (CustomerID, Date)
    VALUES (1, '2023-01-01');

-- Start the transaction 
START TRANSACTION; 

-- And some data should be created inside the transaction
-- Adding an OrderItem and updating the warehouse amount must be atomic:
-- if one fails the other must also be rolled back to keep data consistent
INSERT INTO OrderItems (OrderID, ProductID, Count)
    VALUES (1, 1, 1);

UPDATE Products
    SET WarehouseAmount = WarehouseAmount - 1
    WHERE ID = 1;

COMMIT; 
