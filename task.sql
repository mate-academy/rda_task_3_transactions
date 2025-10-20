-- Reset and load schema deterministically
DROP DATABASE IF EXISTS ShopDB;
SOURCE create-database.sql;
USE ShopDB;

-- Everything below is the solution logic.
-- No seed inserts here: Customers and Products come from create-database.sql

DELIMITER //

CREATE PROCEDURE MakeOrder()
BEGIN
  -- Roll back the whole transaction on any SQL error
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
  END;

  DECLARE order_id INT;

  START TRANSACTION;

  -- Create a new order by seeded customer #1 on the required date
  INSERT INTO Orders (CustomerID, Date)
  VALUES (1, '2023-01-01');

  SET order_id = LAST_INSERT_ID();

  -- Add one item of seeded product #1 to this order
  INSERT INTO OrderItems (OrderID, ProductID, Count)
  VALUES (order_id, 1, 1);

  -- Decrement stock with a guard to avoid negative WarehouseAmount
  UPDATE Products
  SET WarehouseAmount = WarehouseAmount - 1
  WHERE ID = 1 AND WarehouseAmount >= 1;

  -- If nothing was updated, there was no stock -> error -> rollback via handler
  IF ROW_COUNT() <> 1 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient stock for ProductID=1';
  END IF;

  COMMIT;
END//
DELIMITER ;

-- Execute and clean up
CALL MakeOrder();
DROP PROCEDURE MakeOrder;
