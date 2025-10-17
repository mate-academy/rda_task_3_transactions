 -- 1️⃣ Очистка та створення бази даних з нуля
DROP DATABASE IF EXISTS ShopDB;
SOURCE create-database.sql;

-- 2️⃣ Використовуємо базу
USE ShopDB;

-- 3️⃣ Початкові дані (seed data)
-- Перевірка: якщо клієнта або товару немає — додаємо
INSERT INTO Customers (ID, FirstName, LastName, Email, Address)
SELECT 1, 'Test', 'Customer', 'test@example.com', 'Test Address'
WHERE NOT EXISTS (SELECT 1 FROM Customers WHERE ID = 1);

INSERT INTO Products (ID, Name, Description, Price, WarehouseAmount)
SELECT 1, 'AwersomeProduct', 'Our only product', 100.00, 10
WHERE NOT EXISTS (SELECT 1 FROM Products WHERE ID = 1);

-- 4️⃣ Початок транзакції
START TRANSACTION;

-- 5️⃣ Перевіряємо, що клієнт існує
SELECT ID INTO @customer_exists
FROM Customers
WHERE ID = 1;

-- Якщо клієнт відсутній — відкат
IF @customer_exists IS NULL THEN
    ROLLBACK;
END IF;

-- 6️⃣ Перевіряємо, що товар існує, блокуємо його рядок для оновлення
SELECT WarehouseAmount INTO @stock
FROM Products
WHERE ID = 1
FOR UPDATE;

-- 7️⃣ Якщо товару недостатньо — відкат
SET @order_count = 1;
IF @stock < @order_count THEN
    ROLLBACK;
END IF;

-- 8️⃣ Створюємо нове замовлення
INSERT INTO Orders (CustomerID, Date)
VALUES (1, '2023-01-01');

SET @order_id = LAST_INSERT_ID();

-- 9️⃣ Додаємо товар у замовлення
INSERT INTO OrderItems (OrderID, ProductID, Count)
VALUES (@order_id, 1, @order_count);

-- 🔟 Оновлюємо залишки товару
UPDATE Products
SET WarehouseAmount = WarehouseAmount - @order_count
WHERE ID = 1;

-- 11️⃣ Якщо жоден рядок не оновлено — відкат (захист від race condition)
SELECT ROW_COUNT() INTO @rows_updated;
IF @rows_updated = 0 THEN
    ROLLBACK;
END IF;

-- 12️⃣ Усе гаразд — фіксуємо транзакцію
COMMIT;

-- 13️⃣ Перевіряємо результат (опціонально)
SELECT * FROM Orders;
SELECT * FROM OrderItems;
SELECT * FROM Products;
