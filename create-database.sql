DROP DATABASE ShopDB;

CREATE DATABASE ShopDB;
USE ShopDB;

CREATE TABLE Products (
    ID INT AUTO_INCREMENT,
    Name VARCHAR(50),
    Description VARCHAR(100),
    Price INT,
    WarehouseAmount INT,
    PRIMARY KEY (ID)
);

CREATE TABLE Customers (
    ID INT AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(50),
    Address VARCHAR(50),
    PRIMARY KEY (ID)
);

CREATE TABLE Orders (
    ID INT AUTO_INCREMENT,
    CustomerID INT, 
    FOREIGN KEY (CustomerID) REFERENCES Customers(ID) ON DELETE SET NULL,
    Date DATE,
    PRIMARY KEY (ID)
);

CREATE TABLE OrderItems (
    ID INT AUTO_INCREMENT,
    OrderID INT, 
    FOREIGN KEY (OrderID) REFERENCES Orders(ID) ON DELETE SET NULL,
	ProductID INT, 
    Count INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ID) ON DELETE SET NULL,
    PRIMARY KEY (ID)
);

INSERT INTO Products (Name, Description, Price, WarehouseAmount)
	VALUES ('AwersomeProduct', 'Product Desctiption', 5, 42);

INSERT INTO Customers (FirstName, LastName, Email, Address)
	VALUES ('John', 'Dou', 'j@dou.ua', 'far, far away');
