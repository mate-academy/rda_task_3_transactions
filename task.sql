USE ShopDB;

-- Create an empty order. The business rules allow an order to exist without items.
INSERT INTO Orders (CustomerID, `Date`)
VALUES (1, '2023-01-01');

-- Remember the ID generated for the new order.
SET @order_id = LAST_INSERT_ID();

-- Adding an order item and reducing the warehouse amount must succeed together.
START TRANSACTION;

INSERT INTO OrderItems (OrderID, ProductID, `Count`)
VALUES (@order_id, 1, 1);

UPDATE Products
SET WarehouseAmount = WarehouseAmount - 1
WHERE ID = 1;

COMMIT;
