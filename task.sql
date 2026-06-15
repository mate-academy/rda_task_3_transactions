-- Use our database
USE ShopDB; 

-- Some data should be created outside the transaction (here)
INSERT INTO Products (ID, Name, Description, Price, WarehouseAmount)
VALUES (1, 'AwersomeProduct', 'A great product', 100, 42);

INSERT INTO Customers (ID, FirstName, LastName, Email, Address)
VALUES (1, 'John', 'Doe', 'john.doe@example.com', '123 Main St');

INSERT INTO Orders (CustomerID, Date)     
VALUES (1, '2023-01-01');
-- Start the transaction 
START TRANSACTION;

INSERT INTO OrderItems (OrderID, ProductID, Count)
VALUES (LAST_INSERT_ID(), 1, 1);

UPDATE Products
SET WarehouseAmount = WarehouseAmount - 1
WHERE ID = 1;

COMMIT;