START TRANSACTION;

-- 1. Створити нове замовлення
INSERT INTO Orders (CustomerID, Date)
VALUES (1, '2023-01-01');

-- 2. Отримати ID щойно створеного замовлення
SET @order_id = LAST_INSERT_ID();

-- 3. Додати товар до замовлення (ProductID: 1, Count: 1)
INSERT INTO OrderItems (OrderID, ProductID, Count)
VALUES (@order_id, 1, 1);

-- 4. Зменшити кількість товару на складі
UPDATE Products
SET WarehouseAmount = WarehouseAmount - 1
WHERE ID = 1;

COMMIT;
