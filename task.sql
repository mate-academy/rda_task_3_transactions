 USE ShopDB;

-- Починаємо транзакцію
START TRANSACTION;

-- 1. Створюємо нове замовлення (клієнт ID=1, дата 2023-01-01)
INSERT INTO Orders (CustomerID, Date)
VALUES (1, '2023-01-01');

-- 2. Отримуємо ID створеного замовлення
SET @order_id = LAST_INSERT_ID();

-- 3. Додаємо товар (AwersomeProduct) до замовлення
INSERT INTO OrderItems (OrderID, ProductID, Count)
VALUES (@order_id, 1, 1);

-- 4. Зменшуємо кількість товару на складі
UPDATE Products
SET WarehouseAmount = WarehouseAmount - 1
WHERE ID = 1;

-- 5. Фіксуємо зміни
COMMIT;

-- 6. Перевіряємо результат (не обов’язково, але зручно для тесту)
SELECT * FROM Orders;
SELECT * FROM OrderItems;
SELECT * FROM Products;
