-- Use our database
USE ShopDB; 
START TRANSACTION;

-- Создаем новый заказ (Order) для customer_id=1 с датой '2023-01-01'
INSERT INTO Orders (CustomerID, Date)
VALUES (1, '2023-01-01');

-- Получаем ID только что созданного заказа (MySQL переменная LAST_INSERT_ID())
SET @new_order_id = LAST_INSERT_ID();

-- Добавляем в OrderItems позицию: product_id=1, count=1, заказ @new_order_id
INSERT INTO OrderItems (OrderID, ProductID, Count)
VALUES (@new_order_id, 1, 1);

-- Обновляем количество товара на складе (уменьшаем WarehouseAmount на 1)
UPDATE Products
SET WarehouseAmount = WarehouseAmount - 1
WHERE ID = 1;

COMMIT;