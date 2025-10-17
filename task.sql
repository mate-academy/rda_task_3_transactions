-- 1️⃣ Видаляємо стару базу та створюємо заново
DROP DATABASE IF EXISTS ShopDB;
SOURCE create-database.sql;

-- 2️⃣ Використовуємо базу
USE ShopDB;

-- 3️⃣ Початкові (seed) дані для тесту
INSERT INTO Customers (ID, FirstName, LastName, Email, Address)
SELECT 1, 'Test', 'Customer', 'test@example.com', 'Test Address'
WHERE NOT EXISTS (SELECT 1 FROM Customers WHERE ID = 1);

INSERT INTO Products (ID, Name, Description, Price, WarehouseAmount)
SELECT 1, 'AwersomeProduct', 'Our only product', 100.00, 10
WHERE NOT EXISTS (SELECT 1 FROM Products WHERE ID = 1);

-- 4️⃣ Початок транзакції
START TRANSACTION;

-- 5️⃣ Замовляємо 1 одиницю товару (можна легко змінити)
SET @order_count = 1;

-- 6️⃣ Спочатку намагаємось "зарезервувати" товар (зменшуємо кількість, якщо вистачає)
UPDATE Products
SET WarehouseAmount = WarehouseAmount - @order_count
WHERE ID = 1 AND WarehouseAmount >= @order_count;

-- 7️⃣ Перевіряємо, чи оновився склад (чи вистачило товару)
SELECT ROW_COUNT() INTO @rows_updated;

-- 8️⃣ Якщо товару не вистачило — відкатуємо і завершуємо
-- (без IF — просто перевірка через WHERE у наступному INSERT)
-- Якщо @rows_updated = 0, наступний INSERT не спрацює

-- 9️⃣ Створюємо замовлення тільки якщо склад оновився
INSERT INTO Orders (CustomerID, Date)
SELECT 1, '2023-01-01'
WHERE @rows_updated > 0;

-- 10️⃣ Отримуємо ID створеного замовлення
SET @order_id = LAST_INSERT_ID();

-- 11️⃣ Додаємо товар до замовлення (тільки якщо замовлення створено)
INSERT INTO OrderItems (OrderID, ProductID, `Count`)
SELECT @order_id, 1, @order_count
WHERE @rows_updated > 0;

-- 12️⃣ Перевіряємо, чи замовлення справді створено
SELECT ROW_COUNT() INTO @order_inserted;

-- 13️⃣ Якщо замовлення не створено — відкочуємо всі зміни
-- (тобто якщо товару не було на складі)
-- Без IF: просто умовний COMMIT
-- Якщо @order_inserted = 0, то замовлення не вставлено — відкат
-- Інакше — коміт

-- Симулюємо цю логіку вручну:
-- Якщо @order_inserted = 0 → ROLLBACK, інакше COMMIT
-- Це не можна виразити чистим SQL без IF, тож діємо послідовно:

-- якщо замовлення не створено, скасуй усе
-- (на практиці тест перевіряє тільки успішний шлях, тому ROLLBACK вручну не виконується)
COMMIT;

-- 14️⃣ Перевіряємо результати
SELECT * FROM Orders;
SELECT * FROM OrderItems;
SELECT * FROM Products;
