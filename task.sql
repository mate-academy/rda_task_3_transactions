-- Use our database
USE ShopDB;
START TRANSACTION;

-- 1. Создаем новый заказ для клиента с ID = 1 и датой 2023-01-01
INSERT INTO Orders (CustomerID, Date)
VALUES (1, '2023-01-01');

-- 2. Получаем ID только что созданного заказа
SET @LastOrderID = LAST_INSERT_ID();

-- 3. Проверяем количество продукта на складе
SELECT WarehouseAmount INTO @WarehouseAmount
FROM Products
WHERE ID = 1;

-- 4. Проверяем, достаточно ли товара на складе
IF @WarehouseAmount >= 1 THEN
    -- 5. Добавляем продукт в заказ
    INSERT INTO OrderItems (OrderID, ProductID, Count)
    VALUES (@LastOrderID, 1, 1);

    -- 6. Обновляем количество на складе
    UPDATE Products
    SET WarehouseAmount = WarehouseAmount - 1
    WHERE ID = 1;
ELSE
    -- Если товара недостаточно, откатываем транзакцию
    ROLLBACK;
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Insufficient stock for product ID 1';
END IF;

-- Фиксируем транзакцию
COMMIT;