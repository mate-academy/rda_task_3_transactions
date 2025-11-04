USE ShopDB;

START TRANSACTION;

INSERT INTO orders (customer_id, order_date)
VALUES (1, '2023-01-01');

SET @order_id = LAST_INSERT_ID();

INSERT INTO order_items (order_id, product_id, quantity)
VALUES (@order_id, 1, 1);

COMMIT;