-- Use our database
USE ShopDB; 

INSERT INTO Orders (CustomerID, Date)
VALUES (1, '2023-01-01');

set @OrderID = last_insert_id();

-- Start the transaction 
START TRANSACTION; 

insert into OrderItems (OrderID, ProductID, Count)
values (@OrderID, 1, 1);
-- And some data should be created inside the transaction 

update Products
set WarehouseAmount = WarehouseAmount - 1
where ID = 1;

COMMIT;