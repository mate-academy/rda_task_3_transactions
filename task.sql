USE ShopDB; 


INSERT INTO Orders (CustomerID, Date)
	VALUES (1, '2023-01-01');


START TRANSACTION;  

SET @order_id = LAST_INSERT_ID();
SET @item_count = 1;

INSERT INTO OrderItems (OrderID, ProductID, Count)
    VALUES (@order_id, 1, @item_count);

UPDATE Products
SET WarehouseAmount = WarehouseAmount - @item_count
WHERE ID = 1;

COMMIT; 