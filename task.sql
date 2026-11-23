USE ShopDB;

INSERT INTO Customers (FirstName, LastName, Email, Address)
    VALUES ('Art', 'adasd', 'test@dou.ua', 'aaaa');

START TRANSACTION;
INSERT INTO Orders (CustomerID, Date)
    VALUES (1, '2023-01-10');

INSERT INTO OrderItems(OrderID, ProductID, Count)
    VALUES (LAST_INSERT_ID(), 1, 1);

UPDATE Products
    SET WarehouseAmount = WarehouseAmount - 1
    WHERE WarehouseAmount >= 1 AND ID = 1;

COMMIT;