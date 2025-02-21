-- Use our database
USE ShopDB; 

-- Start the transaction 
START TRANSACTION; 

SELECT WarehouseAmount INTO @Stock FROM Products WHERE ID = 1;

IF @Stock >= 1 THEN
    INSERT INTO Orders (CustomerID, Date) 
    VALUES (1, '2023-01-01');

    SET @OrderID = LAST_INSERT_ID();

    INSERT INTO OrderItems (OrderID, ProductID, Count) 
    VALUES (@OrderID, 1, 1);

    UPDATE Products 
    SET WarehouseAmount = WarehouseAmount - 1 
    WHERE ID = 1;

    COMMIT;
ELSE
    ROLLBACK;
END IF;