-- 1. Switch to the correct database
USE ShopDB;

-- 2. Create a new empty order for Customer ID 1
INSERT INTO Orders (CustomerID, Date) 
VALUES (1, '2023-01-01');

-- 3. Get the ID of the order we just created and save it into a variable
SET @NewOrderID = LAST_INSERT_ID();

-- 4. START THE TRANSACTION
-- We group the stock update and the order item creation together
START TRANSACTION;

    -- Step A: Decrease the warehouse stock for AwersomeProduct (ID: 1) by 1
    UPDATE Products 
    SET WarehouseAmount = WarehouseAmount - 1 
    WHERE ID = 1;

    -- Step B: Add AwersomeProduct to the OrderItems table
    INSERT INTO OrderItems (OrderID, ProductID, Count) 
    VALUES (@NewOrderID, 1, 1);

-- 5. COMMIT THE TRANSACTION
-- This permanently saves both changes to the database at the exact same time
COMMIT;
