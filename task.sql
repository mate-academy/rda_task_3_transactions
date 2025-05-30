-- Use our database
USE ShopDB; 

-- Some data should be created outside the transaction (here)
insert into Orders (CustomerID, Date)
	values (1, '2023-01-01');
    
-- Start the transaction 
START TRANSACTION; 

-- And some data should be created inside the transaction 
insert into OrderItems (OrderID, ProductID, Count)
	values (1, 1, 1);
update Products set WarehouseAmount = WarehouseAmount - 1 where ID = '1';

COMMIT; 