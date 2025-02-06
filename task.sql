-- Use our database
USE ShopDB; 

-- Some data should be created outside the transaction (here)

-- Start the transaction 
START TRANSACTION; 

INSERT INTO
    Customers (
        ID,
        FirstName,
        LastName,
        Email,
        Address
    )
VALUES (
        1,
        'John',
        'Doe',
        'john.doe@example.com',
        '123 Main St'
    );

INSERT INTO Orders (CustomerID, Date) VALUES (1, '2023-01-01');

-- Отримуємо ID створеного замовлення
SET @OrderID = LAST_INSERT_ID();

SHOW COLUMNS FROM OrderItems;

ALTER TABLE OrderItems ADD COLUMN Count INT NOT NULL;

SELECT * FROM Products WHERE ID = 1;

INSERT INTO
    Products (
        ID,
        Name,
        Description,
        Price,
        WarehouseAmount
    )
VALUES (
        1,
        'AwersomeProduct',
        'An amazing product',
        100.00,
        50
    );
SELECT * FROM Products WHERE Name = 'AwersomeProduct';

SELECT * FROM Customers WHERE ID = 1;

SELECT * FROM Orders WHERE CustomerID = 1;

SELECT * FROM OrderItems WHERE ProductID = 1;
-- Додаємо товар AwersomeProduct (ID = 1) у замовлення
INSERT INTO
    OrderItems (OrderID, ProductID, Count)
VALUES (@OrderID, 1, 1);

UPDATE Products
SET
    Name = 'AwesomeProduct'
WHERE
    Name = 'AwersomeProduct';

ALTER TABLE Customers MODIFY ID INT AUTO_INCREMENT;

SELECT * FROM Products;

SELECT * FROM Orders;

SELECT * FROM OrderItems;

-- Оновлюємо кількість товару на складі
UPDATE Products
SET
    WarehouseAmount = WarehouseAmount - 1
WHERE
    ID = 1;

-- Завершуємо транзакцію
COMMIT;