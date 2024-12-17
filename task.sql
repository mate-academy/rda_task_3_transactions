USE ShopDB;

INSERT INTO Products (ID, Name, Description, Price, WarehouseAmount)
VALUES (1, 'AwersomeProduct', 'An awesome product!', 100, 50);

INSERT INTO Customers (ID, FirstName, LastName, Email, Address)
VALUES (1, 'John', 'Doe', 'johndoe@example.com', '123 Main St');

START TRANSACTION;

INSERT INTO Orders (CustomerID, Date)
VALUES (1, '2023-01-01');

INSERT INTO OrderItems (OrderID, ProductID, Count)
VALUES (
    (SELECT ID FROM Orders WHERE CustomerID = 1 ORDER BY ID DESC LIMIT 1),
    1,
    1
);

UPDATE Products
SET WarehouseAmount = WarehouseAmount - 1
WHERE ID = 1;

COMMIT;
