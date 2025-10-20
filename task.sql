USE ShopDB;

INSERT INTO Customers (FirstName, LastName, Email, Address)
VALUES ('Serh', 'Pr', 'se@gmail.com.com', 'kyiv st');

INSERT INTO Products (Name, Description, Price, WarehouseAmount)
VALUES ('AwesomeProduct', 'awesome!!', 9.99, 10);

START TRANSACTION;

INSERT INTO Orders (CustomerID, Date)
VALUES (1, '2023-01-01');

INSERT INTO OrderItems (OrderID, ProductID, Count)
VALUES (1, 1, 1);

UPDATE Products
SET WarehouseAmount = WarehouseAmount - 1
WHERE ID = 1;

COMMIT;
