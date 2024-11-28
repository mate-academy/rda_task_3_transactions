-- Use our database
USE ShopDB; 

-- Some data should be created outside the transaction (here)
INSERT INTO Products (Name, Description, Price, WarehouseAmount)
	VALUES ('AwersomeProduct', 'Product Desctiption', 5, 42);

INSERT INTO Customers (FirstName, LastName, Email, Address)
	VALUES ('John', 'Dou', 'j@dou.ua', 'far, far away');

INSERT INTO Orders (CustomerID, Date)
    VALUES (1, '2023-01-01');
-- Start the transaction 
START TRANSACTION; 

-- And some data should be created inside the transaction 
SET @OrderID = LAST_INSERT_ID();

INSERT INTO OrderItems(OrderID, ProductID, Count)
    VALUES (@OrderID, 1, 1);

UPDATE Products 
SET WarehouseAmount = WarehouseAmount - 1
WHERE ID = 1;

COMMIT;
