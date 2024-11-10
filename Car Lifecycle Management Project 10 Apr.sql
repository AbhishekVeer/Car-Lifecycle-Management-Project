-- Create Customer table
CREATE TABLE Customer (
    C_ID VARCHAR(20) PRIMARY KEY NOT NULL,
    Name VARCHAR(50),
    Is_Company VARCHAR(50),
    Address VARCHAR(50),
    Phone BIGINT,
    Gender VARCHAR(10),
    Annual_income BIGINT,
    D_ID VARCHAR(20)
);

-- Insert values into Customer table
INSERT INTO Customer (C_ID, Name, Is_Company, Address, Phone, Gender, Annual_income, D_ID)
VALUES
('C001', 'John Doe', 'Yes', '123 Main St', 1234567890, 'Male', 50000, 'D001'),
('C002', 'Jane Smith', 'No', '456 Oak Ave', 9876543210, 'Female', 75000, 'D002'),
('C003', 'Michael Johnson', 'Yes', '789 Elm Rd', 5551234567, 'Male', 60000, 'D003'),
('C004', 'Emily Brown', 'No', '321 Pine Blvd', 9998887777, 'Female', 80000, 'D001'),
('C005', 'David Wilson', 'Yes', '654 Cedar Ln', 1112223333, 'Male', 70000, 'D002');

-- Create Dealer table
CREATE TABLE Dealer (
    D_ID VARCHAR(20) PRIMARY KEY NOT NULL,
    Dname VARCHAR(20),
    Dlocation VARCHAR(50)
);

-- Insert values into Dealer table
INSERT INTO Dealer (D_ID, Dname, Dlocation)
VALUES
('D001', 'Dealer 1', 'D_City 1'),
('D002', 'Dealer 2', 'D_City 2'),
('D003', 'Dealer 3', 'D_City 3'),
('D004', 'Dealer 4', 'D_City 4'),
('D005', 'Dealer 5', 'D_City 5');

-- Create Sales table
CREATE TABLE Sales (
    M_ID VARCHAR(20) PRIMARY KEY NOT NULL,
    C_ID VARCHAR(20),
    D_ID VARCHAR(20),
    Date DATE,
    Price NUMERIC(10, 2),
    FOREIGN KEY (C_ID) REFERENCES Customer(C_ID),
    FOREIGN KEY (D_ID) REFERENCES Dealer(D_ID)
);

-- Insert values into Sales table
INSERT INTO Sales (M_ID, C_ID, D_ID, Date, Price)
VALUES
('M001', 'C001', 'D001', '2024-03-01', 2500000),
('M002', 'C002', 'D002', '2024-03-05', 3000000),
('M003', 'C003', 'D003', '2024-03-10', 3500000),
('M004', 'C004', 'D001', '2024-03-15', 4000000),
('M005', 'C005', 'D002', '2024-03-20', 4500000);

-- Create Inventory table
CREATE TABLE Inventory (
    In_ID VARCHAR(20) PRIMARY KEY NOT NULL,
    In_name VARCHAR(50),
    In_location VARCHAR(50),
    Dealer_ID VARCHAR(20),
    FOREIGN KEY (Dealer_ID) REFERENCES Dealer(D_ID)
);

-- Insert values into Inventory table
INSERT INTO Inventory (In_ID, In_name, In_location, Dealer_ID)
VALUES
('IN001', 'Inventory 1', 'I_Location 1', 'D001'),
('IN002', 'Inventory 2', 'I_Location 2', 'D002'),
('IN003', 'Inventory 3', 'I_Location 3', 'D003'),
('IN004', 'Inventory 4', 'I_Location 4', 'D001'),
('IN005', 'Inventory 5', 'I_Location 5', 'D002');

-- Create Brand table
CREATE TABLE Brand (
    Brand_name VARCHAR(50) PRIMARY KEY NOT NULL,
    Company_ID VARCHAR(20),
    Model_ID BIGSERIAL,
    Num_of_employees INTEGER
);

-- Insert values into Brand table
INSERT INTO Brand (Brand_name, Company_ID, Num_of_employees)
VALUES
('Tata Motors PV', '5001', 15000),
('Tata passenger EV', '5002', 7500);


-- Create Car Company table
CREATE TABLE Car_Company (
    COMID VARCHAR(20) PRIMARY KEY NOT NULL,
    Num_of_employees INTEGER,
    Brand_name VARCHAR(50),
    FOREIGN KEY (Brand_name) REFERENCES Brand(Brand_name)
);

-- Insert values into Car Company table
INSERT INTO Car_Company (COMID, Num_of_employees, Brand_name)
VALUES
(5001,15000, 'Tata Motors PV'),
(5002, 7500, 'Tata passenger EV');

-- Create Manufacturer table
CREATE TABLE Manufacturer (
    M_ID VARCHAR(20) PRIMARY KEY NOT NULL,
    Mname VARCHAR(50),
    Mlocation VARCHAR(50),
    Brand_name VARCHAR(30),
    FOREIGN KEY (Brand_name) REFERENCES Brand(Brand_name)
);

-- Insert values into Manufacturer table
INSERT INTO Manufacturer (M_ID, Mname, Mlocation, Brand_name)
VALUES
('M001', 'Manufacturer 1', 'M_Location 1', 'Tata Motors PV'),
('M002', 'Manufacturer 2', 'M_Location 2', 'Tata Motors PV'),
('M003', 'Manufacturer 3', 'M_Location 3', 'Tata passenger EV'),
('M004', 'Manufacturer 4', 'M_Location 4', 'Tata Motors PV'),
('M005', 'Manufacturer 5', 'M_Location 5', 'Tata passenger EV');


-- Create Supplier table
CREATE TABLE Supplier (
    SID BIGINT PRIMARY KEY NOT NULL,
    Sname VARCHAR(50),
    Slocation VARCHAR(50)
);

-- Insert values into Supplier table
INSERT INTO Supplier (SID, Sname, Slocation)
VALUES
(10001, 'Supplier 1', 'S_Location 1'),
(10002, 'Supplier 2', 'S_Location 2'),
(10003, 'Supplier 3', 'S_Location 3'),
(10004, 'Supplier 4', 'S_Location 4'),
(10005, 'Supplier 5', 'S_Location 5');

-- Create Car Model table
CREATE TABLE Car_Model (
    Model_ID VARCHAR(30) PRIMARY KEY NOT NULL,
    Model_name VARCHAR(30) NOT NULL, 
    Model_year DATE,
    Body_style VARCHAR(50),
    Brand_name VARCHAR(30),
    Part_ID BIGINT, -- Added Part_ID as foreign key from Supplies table
    FOREIGN KEY (Brand_name) REFERENCES Brand(Brand_name)
);

-- Insert values into Car Model table
INSERT INTO Car_Model (Model_ID, Model_name, Model_year, Body_style, Brand_name, Part_ID)
VALUES
('Model001', 'Tata Tiago', '2023-01-01', 'Sedan', 'Tata Motors PV', 101), -- Assuming Part_ID for Tata Tiago is 1
('Model002', 'Tata Nexon', '2023-01-01', 'Small SUV', 'Tata Motors PV', 201), -- Assuming Part_ID for Tata Nexon is 2
('Model003', 'Tata Nexon EV', '2023-01-01', 'Hatchback', 'Tata passenger EV', 301), -- Assuming Part_ID for Tata Nexon EV is 3
('Model004', 'Tata Harrier', '2023-01-01', 'SUV', 'Tata Motors PV', 401), -- Assuming Part_ID for Tata Harrier is 4
('Model005', 'Tata Tigor EV', '2023-01-01', 'Sedan', 'Tata passenger EV', 501); -- Assuming Part_ID for Tata Tigor EV is 5


-- Create Supplies table
CREATE TABLE Supplies (
    Part_ID BIGSERIAL PRIMARY KEY NOT NULL,
    Part_type VARCHAR(50),
    Made_date DATE,
    Supply_date DATE,
    SID BIGINT,
    Model_ID VARCHAR(30),
    FOREIGN KEY (SID) REFERENCES Supplier(SID),
    FOREIGN KEY (Model_ID) REFERENCES Car_Model(Model_ID)
);

-- Insert values into Supplies table
INSERT INTO Supplies (Part_ID, Part_type, Made_date, Supply_date, SID, Model_ID)
VALUES
(101, 'Engine Parts', '2023-01-01', '2023-01-15', 10001, 'Model001'),
(201, 'Transmission Parts', '2023-01-02', '2023-01-16', 10002, 'Model002'),
(301, 'Body Parts', '2023-01-03', '2023-01-17', 10003, 'Model003'),
(401,'Electrical Parts', '2023-01-04', '2023-01-18', 10004, 'Model004'),
(501, 'Interior Parts', '2023-01-05', '2023-01-19', 10005, 'Model005');

-- Create Feature table
CREATE TABLE Feature (
    Feature_ID VARCHAR(20) PRIMARY KEY NOT NULL,
    Engine VARCHAR(30),
    Transmission VARCHAR(30),
    Color VARCHAR(30),
    Model_ID VARCHAR(30),
    VIN VARCHAR(20),
    FOREIGN KEY (Model_ID) REFERENCES Car_Model(Model_ID)    
);

-- Insert values into Feature table
INSERT INTO Feature (Feature_ID, Engine, Transmission, Color, Model_ID, VIN)
VALUES
('F001', 'V6', 'Automatic', 'Red','Model001', 'VIN001'),
('F002', 'Inline-4', 'Manual', 'Blue', 'Model002', 'VIN002'),
('F003', 'V8', 'Automatic', 'Black', 'Model003', 'VIN003'),
('F004', 'Inline-6', 'Automatic', 'White', 'Model004', 'VIN004'),
('F005', 'V12', 'Automatic', 'Silver', 'Model005', 'VIN005');


-- Create Vehicle table
CREATE TABLE Vehicle (
    V_IN VARCHAR(20) PRIMARY KEY NOT NULL,
    Option_ID BIGINT,
    Model_name VARCHAR(30),
    Inventory_ID VARCHAR(20),
    Customer_ID VARCHAR(20),
    Manufacturing_ID VARCHAR(20),
    Feature_ID VARCHAR(20), -- Added Feature_ID as foreign key from Feature table
    FOREIGN KEY (Inventory_ID) REFERENCES Inventory(In_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(C_ID),
    FOREIGN KEY (Manufacturing_ID) REFERENCES Manufacturer(M_ID),
    FOREIGN KEY (Feature_ID) REFERENCES Feature(Feature_ID)
);

-- Insert values into Vehicle table
INSERT INTO Vehicle (V_IN, Option_ID, Model_name, Inventory_ID, Customer_ID, Manufacturing_ID, Feature_ID)
VALUES
('VIN001', 1001, 'Tata Tiago', 'IN001', 'C001', 'M001', 'F001'),
('VIN002', 1002, 'Tata Nexon', 'IN002', 'C002', 'M002', 'F002'),
('VIN003', 1003, 'Tata Nexon EV', 'IN003', 'C003', 'M003', 'F003'),
('VIN004', 1004, 'Tata Harrier', 'IN004', 'C004', 'M004', 'F004'),
('VIN005', 1005, 'Tata Tigor EV', 'IN005', 'C005', 'M005', 'F005');


-- Create Employee table
CREATE TABLE Employee (
    E_ID VARCHAR(20) PRIMARY KEY NOT NULL,
    Name VARCHAR(50),
    Position VARCHAR(50),
    Salary NUMERIC(10, 2),
    Join_Date DATE,
    D_ID VARCHAR(20), -- Foreign key referencing Dealer table
    CONSTRAINT fk_Dealer_Employee FOREIGN KEY (D_ID) REFERENCES Dealer(D_ID)
);

-- Insert values into Employee table
INSERT INTO Employee (E_ID, Name, Position, Salary, Join_Date, D_ID)
VALUES
('E001', 'John Smith', 'Manager', 80000, '2023-01-01', 'D001'),
('E002', 'Jane Doe', 'Salesperson', 50000, '2023-02-15', 'D002'),
('E003', 'Michael Johnson', 'Technician', 60000, '2023-03-10', 'D003'),
('E004', 'Emily Brown', 'Accountant', 70000, '2023-04-20', 'D001'),
('E005', 'David Wilson', 'Engineer', 75000, '2023-05-30', 'D002');


--show selected table
SELECT *
FROM Customer;

SELECT *
FROM Employee;

SELECT *
FROM Sales;

SELECT *
FROM Vehicle;

SELECT *
FROM Inventory;

SELECT *
FROM Dealer;

SELECT *
FROM car_model;

SELECT *
FROM Feature;

SELECT *
FROM Manufacturer;

SELECT *
FROM Brand;

SELECT *
FROM Car_company;

SELECT *
FROM Supplier;

SELECT *
FROM Supplies;


--table columns and data types
SELECT table_name, column_name, data_type
FROM information_schema.columns
WHERE table_schema = 'public';

 
-- Get current user
SELECT current_user;

-- Get server hostname and port
SELECT inet_server_addr() AS server_address, inet_server_port() AS server_port;

SELECT current_database();

