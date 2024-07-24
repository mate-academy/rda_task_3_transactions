USE ShopDB; 

INSERT INTO Customers (FirstName, LastName, Email, Address)
VALUES ('John', 'Dou', 'j@dou.ua', 'far, far away');

INSERT INTO Orders (CustomerID, Date)
VALUES (1, NOW());

START TRANSACTION; 

INSERT INTO Products (Name, Description, Price, WarehouseAmount)
VALUES ('AwersomeProduct', 'Product Desctiption', 5, 42);

UPDATE Products SET WarehouseAmount = WarehouseAmount -1 WHERE ID = 1;

INSERT INTO OrderItems(OrderID, ProductID, Count)
VALUES (1,1,1);



COMMIT;
