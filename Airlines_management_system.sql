-- Step 1: Create the database
CREATE DATABASE AIRLINESMANAGEMENTSYSTEM;

-- Use the newly created database
USE AIRLINESMANAGEMENTSYSTEM;

-- Step 2: Create table for storing airplane information
CREATE TABLE AIRPLANESINFO(
    P_TYPE VARCHAR(20) PRIMARY KEY,  -- Airplane type, unique identifier
    P_WEIGHT INT,                    -- Weight of the airplane
    FUEL INT,                         -- Fuel capacity
    PASSENGERS INT                    -- Passenger capacity
);

-- Step 3: Create table for storing airplane details
CREATE TABLE AIRPLANES(
    P_ID INT PRIMARY KEY,             -- Unique identifier for each airplane
    P_TYPE VARCHAR(20),               -- Type of the airplane (linked to AIRPLANESINFO)
    MAINTAINANCE INT,                 -- Maintenance status (0 or 1)
    FOREIGN KEY(P_TYPE) REFERENCES AIRPLANESINFO(P_TYPE)  -- Foreign key linking to AIRPLANESINFO
);

-- Step 4: Create table for storing airport location information
CREATE TABLE AIRPORTSINFO_LOC(
    A_LOC VARCHAR(20) PRIMARY KEY,    -- Airport location (unique)
    A_RANK INT,                       -- Airport rank
    PLANES_CAPACITY INT               -- Maximum plane capacity at the airport
);

-- Step 5: Create table for storing airport name and location
CREATE TABLE AIRPORTSINFO_NAME(
    A_NAME VARCHAR(20) PRIMARY KEY,   -- Airport name (unique)
    A_LOC VARCHAR(20),                -- Location of the airport
    FOREIGN KEY(A_LOC) REFERENCES AIRPORTSINFO_LOC(A_LOC)  -- Foreign key linking to AIRPORTSINFO_LOC
);

-- Step 6: Create table for storing airport ID and name
CREATE TABLE AIRPORTSINFO_ID(
    A_ID INT PRIMARY KEY,             -- Unique identifier for the airport
    A_NAME VARCHAR(20),               -- Airport name
    FOREIGN KEY(A_NAME) REFERENCES AIRPORTSINFO_NAME(A_NAME)  -- Foreign key linking to AIRPORTSINFO_NAME
);

-- Step 7: Create table for storing salary details of airport staff
CREATE TABLE SALARY(
    JOB VARCHAR(20) PRIMARY KEY,      -- Job title (unique)
    A_LOC VARCHAR(20),                -- Location of the airport
    SALARY INT,                       -- Salary for the job
    FOREIGN KEY(A_LOC) REFERENCES AIRPORTSINFO_LOC(A_LOC)  -- Foreign key linking to AIRPORTSINFO_LOC
);

-- Step 8: Create table for storing employee information
CREATE TABLE EMP(
    E_ID INT PRIMARY KEY,             -- Employee ID (unique)
    E_NAME VARCHAR(20),               -- Employee name
    E_EMAIL VARCHAR(20),              -- Employee email
    JOB VARCHAR(20),                  -- Employee job title
    A_LOC VARCHAR(20),                -- Location of the airport where the employee works
    JOINDATE DATE,                    -- Employee joining date
    FOREIGN KEY(A_LOC) REFERENCES AIRPORTSINFO_LOC(A_LOC)  -- Foreign key linking to AIRPORTSINFO_LOC
);

-- Step 9: Create table for storing customer information
CREATE TABLE CUSTOMER(
    C_ID INT PRIMARY KEY,             -- Customer ID (unique)
    C_NAME VARCHAR(20),               -- Customer name
    C_EMAIL VARCHAR(20),              -- Customer email
    NO_OF_FLIGHTS INT                 -- Number of flights booked by the customer
);

-- Step 10: Create table for storing flight information
CREATE TABLE FLIGHT(
    F_ID INT PRIMARY KEY,             -- Flight ID (unique)
    P_ID INT,                         -- Airplane ID (linked to AIRPLANES)
    FROMA_ID INT,                     -- Departure airport ID (linked to AIRPORTSINFO_ID)
    TOA_ID INT,                       -- Arrival airport ID (linked to AIRPORTSINFO_ID)
    DEPARTURE TIMESTAMP(2),           -- Flight departure time
    FOREIGN KEY(P_ID) REFERENCES AIRPLANES(P_ID),  -- Foreign key linking to AIRPLANES
    FOREIGN KEY(FROMA_ID) REFERENCES AIRPORTSINFO_ID(A_ID),  -- Foreign key linking to AIRPORTSINFO_ID
    FOREIGN KEY(TOA_ID) REFERENCES AIRPORTSINFO_ID(A_ID)  -- Foreign key linking to AIRPORTSINFO_ID
);

-- Step 11: Create table for storing flight information with extra details like arrival and price
CREATE TABLE FLIGHTINFO(
    F_ID INT PRIMARY KEY,             -- Flight ID (unique)
    P_ID INT,                         -- Airplane ID
    FROMA_ID INT,                     -- Departure airport ID
    TOA_ID INT,                       -- Arrival airport ID
    DEPARTURE TIMESTAMP(2),           -- Flight departure time
    ARRIVAL TIMESTAMP(2),             -- Flight arrival time
    PRICE INT,                        -- Price of the flight
    FOREIGN KEY(P_ID) REFERENCES AIRPLANES(P_ID),  -- Foreign key linking to AIRPLANES
    FOREIGN KEY(FROMA_ID) REFERENCES AIRPORTSINFO_ID(A_ID),  -- Foreign key linking to AIRPORTSINFO_ID
    FOREIGN KEY(TOA_ID) REFERENCES AIRPORTSINFO_ID(A_ID)  -- Foreign key linking to AIRPORTSINFO_ID
);

-- Step 12: Create trigger to automatically insert flight info when a new flight is added
DELIMITER $$

CREATE TRIGGER FLIGHT_INFO_TRIGGER
AFTER INSERT ON FLIGHT
FOR EACH ROW
BEGIN
    -- If flight is from Delhi to Dubai, set price and arrival time
    IF NEW.FROMA_ID = 1 AND NEW.TOA_ID = 5 THEN
        INSERT INTO FLIGHTINFO (F_ID, P_ID, FROMA_ID, TOA_ID, DEPARTURE, ARRIVAL, PRICE)
        VALUES (NEW.F_ID, NEW.P_ID, NEW.FROMA_ID, NEW.TOA_ID, NEW.DEPARTURE, 
                NEW.DEPARTURE + INTERVAL 8 HOUR, 4000);
    END IF;

    -- If flight is from Los Angeles to London, set price and arrival time
    IF NEW.FROMA_ID = 2 AND NEW.TOA_ID = 4 THEN
        INSERT INTO FLIGHTINFO (F_ID, P_ID, FROMA_ID, TOA_ID, DEPARTURE, ARRIVAL, PRICE)
        VALUES (NEW.F_ID, NEW.P_ID, NEW.FROMA_ID, NEW.TOA_ID, NEW.DEPARTURE, 
                NEW.DEPARTURE + INTERVAL 12 HOUR, 6200);
    END IF;
END$$

DELIMITER ;

-- Step 13: Create table for linking flight and employee
CREATE TABLE FLIGHTINFO_EMP(
    F_ID INT,                         -- Flight ID (linked to FLIGHT)
    E_ID INT,                         -- Employee ID (linked to EMP)
    FOREIGN KEY(F_ID) REFERENCES FLIGHT(F_ID),  -- Foreign key linking to FLIGHT
    FOREIGN KEY(E_ID) REFERENCES EMP(E_ID)  -- Foreign key linking to EMP
);

-- Step 14: Create table for linking customer and flight
CREATE TABLE CUSTOMER_IN_FLIGHT (
    ID INT AUTO_INCREMENT PRIMARY KEY  -- Unique identifier for each flight-customer record
) AUTO_INCREMENT = 1;

-- Step 15: Create table to store customer and flight relationships
CREATE TABLE FLIGHTINFO_CUSTOMER(
    SEQ INT,                          -- Sequence ID (optional, for tracking)
    C_ID INT,                         -- Customer ID (linked to CUSTOMER)
    F_ID INT,                         -- Flight ID (linked to FLIGHT)
    FOREIGN KEY(C_ID) REFERENCES CUSTOMER(C_ID),  -- Foreign key linking to CUSTOMER
    FOREIGN KEY(F_ID) REFERENCES FLIGHT(F_ID),  -- Foreign key linking to FLIGHT
    PRIMARY KEY(C_ID, F_ID)  -- Composite primary key for customer and flight
);