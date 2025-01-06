-- Use our database
USE ShopDB; 

-- Some data should be created outside the transaction (here)
INSERT INTO Products (Name, Description, Price, WarehouseAmount)
	VALUES ('AwersomeProduct', 'Product Desctiption', 5, 1);
INSERT INTO Customers (FirstName, LastName, Email, Address)
	VALUES ('John', 'Dou', 'j@dou.ua', 'far, far away');

-- Start the transaction 
START TRANSACTION; 
INSERT INTO Orders(CustomerID, Date)
    VALUES (1, '2023-01-01');
COMMIT; 