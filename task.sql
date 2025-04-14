-- Use our database
USE ShopDB; 

-- Some data should be created outside the transaction (here)

-- Start the transaction 
START TRANSACTION; 
INSERT INTO OrderItems(ProductID, Count)
VALUES('1','1') 
INSERT INTO Orders(CustomerID, Date)
VALUES('1', '2023-01-01') 
UPDATE Product SET WarehouseAmount = WarehouseAmount - 1 WHERE ID = 1  ;
COMMIT; 