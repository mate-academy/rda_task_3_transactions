USE ShopDB;

DELETE FROM OrderItems;
DELETE FROM Orders;
DELETE FROM Products;
DELETE FROM Customers;

INSERT INTO Customers (ID, FirstName, LastName, Email, Address) VALUES (1, 'John', 'Doe', 'john.doe@example.com', '123 Main St');
INSERT INTO Products (ID, Name, Description, Price, WarehouseAmount) VALUES (1, 'AwersomeProduct', 'An awesome product', 1000, 42);

START TRANSACTION;
INSERT INTO Orders (CustomerID, Date) VALUES (1, '2023-01-01');
SET @new_order_id = LAST_INSERT_ID();
INSERT INTO OrderItems (OrderID, ProductID, Count) VALUES (@new_order_id, 1, 1);
UPDATE Products SET WarehouseAmount = WarehouseAmount - 1 WHERE ID = 1;
COMMIT;
