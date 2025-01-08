-- 1. Retrieve all airplane details.
SELECT * FROM AIRPLANES;
-- Explanation: Retrieves all columns and rows from the AIRPLANES table.

-- 2. Get all airport names and their locations.
SELECT A_NAME, A_LOC FROM AIRPORTSINFO_NAME;
-- Explanation: Returns the names and locations of all airports from the AIRPORTSINFO_NAME table.

-- 3. Find all airplanes with a specific weight range.
SELECT * FROM AIRPLANESINFO WHERE P_WEIGHT BETWEEN 10000 AND 15000;
-- Explanation: Retrieves airplanes whose weight falls between 10,000 and 15,000.

-- 4. Get the average salary of employees working at 'Delhi' airport.
SELECT AVG(SALARY) AS AvgSalary FROM SALARY WHERE A_LOC = 'Delhi';
-- Explanation: Calculates the average salary for employees at the 'Delhi' airport.

-- 5. List all flights departing from 'Los Angeles'.
SELECT * FROM FLIGHT WHERE FROMA_ID = (SELECT A_ID FROM AIRPORTSINFO_ID WHERE A_NAME = 'Los Angeles');
-- Explanation: Finds all flights that depart from the 'Los Angeles' airport.

-- 6. Get details of the airplane with the highest passenger capacity.
SELECT * FROM AIRPLANESINFO WHERE PASSENGERS = (SELECT MAX(PASSENGERS) FROM AIRPLANESINFO);
-- Explanation: Returns the airplane with the highest passenger capacity.

-- 7. Get the total number of employees working at each airport.
SELECT A_LOC, COUNT(E_ID) AS TotalEmployees FROM EMP GROUP BY A_LOC;
-- Explanation: Counts the number of employees at each airport.

-- 8. Find all flights that are from 'Delhi' to 'Dubai'.
SELECT * FROM FLIGHT WHERE FROMA_ID = (SELECT A_ID FROM AIRPORTSINFO_ID WHERE A_NAME = 'Delhi') 
AND TOA_ID = (SELECT A_ID FROM AIRPORTSINFO_ID WHERE A_NAME = 'Dubai');
-- Explanation: Retrieves all flights from Delhi to Dubai.

-- 9. Get the total salary expense of employees at 'Delhi' airport.
SELECT SUM(SALARY) AS TotalSalary FROM SALARY WHERE A_LOC = 'Delhi';
-- Explanation: Calculates the total salary expense for employees at 'Delhi' airport.

-- 10. Get a list of all customers and the number of flights they have taken.
SELECT C_NAME, NO_OF_FLIGHTS FROM CUSTOMER;
-- Explanation: Lists all customers and their respective flight counts.

-- 11. Retrieve all the details of employees in the 'Engineer' role.
SELECT * FROM EMP WHERE JOB = 'Engineer';
-- Explanation: Finds all employees with the 'Engineer' job title.

-- 12. List all flights with their departure and arrival times.
SELECT F_ID, DEPARTURE, ARRIVAL FROM FLIGHTINFO;
-- Explanation: Retrieves all flights with their departure and arrival timestamps.

-- 13. Find all customers who have taken more than 5 flights.
SELECT C_NAME FROM CUSTOMER WHERE NO_OF_FLIGHTS > 5;
-- Explanation: Lists all customers who have taken more than 5 flights.

-- 14. Get the details of the airplane that has the lowest fuel capacity.
SELECT * FROM AIRPLANESINFO WHERE FUEL = (SELECT MIN(FUEL) FROM AIRPLANESINFO);
-- Explanation: Finds the airplane with the lowest fuel capacity.

-- 15. Get the number of employees working as 'Receptionist' at 'Delhi'.
SELECT COUNT(E_ID) AS TotalReceptionists FROM EMP WHERE JOB = 'Receptionist' AND A_LOC = 'Delhi';
-- Explanation: Counts the number of receptionists working at the 'Delhi' airport.

-- 16. Find all flights that depart after a specific time.
SELECT * FROM FLIGHT WHERE DEPARTURE > '2025-01-01 00:00:00';
-- Explanation: Retrieves flights that depart after the given timestamp.

-- 17. Get the number of airplanes with specific types of aircraft.
SELECT P_TYPE, COUNT(P_ID) FROM AIRPLANES GROUP BY P_TYPE;
-- Explanation: Groups airplanes by type and counts the number of each type.

-- 18. Retrieve the salary of 'Pilot' at 'New York'.
SELECT SALARY FROM SALARY WHERE JOB = 'Pilot' AND A_LOC = 'New York';
-- Explanation: Finds the salary of pilots working at 'New York'.

-- 19. Get the total number of flights departing from 'New York' airport.
SELECT COUNT(F_ID) FROM FLIGHT WHERE FROMA_ID = (SELECT A_ID FROM AIRPORTSINFO_ID WHERE A_NAME = 'New York');
-- Explanation: Counts the total number of flights departing from New York airport.

-- 20. Retrieve the list of employees working as 'Ground Worker'.
SELECT * FROM EMP WHERE JOB = 'Ground Worker';
-- Explanation: Finds all employees with the 'Ground Worker' role.

-- 21. Find the flights from 'Delhi' to 'Los Angeles' with a price greater than 5000.
SELECT * FROM FLIGHTINFO WHERE FROMA_ID = (SELECT A_ID FROM AIRPORTSINFO_ID WHERE A_NAME = 'Delhi') 
AND TOA_ID = (SELECT A_ID FROM AIRPORTSINFO_ID WHERE A_NAME = 'Los Angeles') AND PRICE > 5000;
-- Explanation: Retrieves flights from Delhi to Los Angeles where the price is greater than 5000.

-- 22. Get the total number of customers who have taken flights.
SELECT COUNT(C_ID) AS TotalCustomers FROM FLIGHTINFO_CUSTOMER;
-- Explanation: Counts the total number of customers who have flown.

-- 23. Get the flight details where the departure and arrival times are provided.
SELECT * FROM FLIGHTINFO WHERE ARRIVAL IS NOT NULL;
-- Explanation: Retrieves all flight details where the arrival time is provided.

-- 24. List all airplane types with their weight and passenger capacity.
SELECT P_TYPE, P_WEIGHT, PASSENGERS FROM AIRPLANESINFO;
-- Explanation: Lists airplane types, weight, and passenger capacity.

-- 25. Retrieve all flights where the airplane type is 'BOEING778'.
SELECT * FROM FLIGHT WHERE P_ID = (SELECT P_ID FROM AIRPLANES WHERE P_TYPE = 'BOEING778');
-- Explanation: Retrieves flights using airplanes of type 'BOEING778'.

-- 26. Get the details of all employees who have joined after 2010.
SELECT * FROM EMP WHERE JOINDATE > '2010-01-01';
-- Explanation: Retrieves employees who joined after 2010.

-- 27. Get the number of flights departing from 'Dubai'.
SELECT COUNT(F_ID) FROM FLIGHT WHERE FROMA_ID = (SELECT A_ID FROM AIRPORTSINFO_ID WHERE A_NAME = 'Dubai');
-- Explanation: Counts the number of flights departing from the Dubai airport.

-- 28. Find all employees who are working in the 'London' location.
SELECT * FROM EMP WHERE A_LOC = 'London ';
-- Explanation: Retrieves all employees working at the 'London' airport.

-- 29. Get the number of planes that have been maintained.
SELECT COUNT(P_ID) FROM AIRPLANES WHERE MAINTAINANCE = 1;
-- Explanation: Counts the number of airplanes that have been maintained.

-- 30. Retrieve the list of all airports and their rank.
SELECT A_NAME, A_RANK FROM AIRPORTSINFO_LOC;
-- Explanation: Retrieves the name and rank of all airports.

-- 31. Find the total number of flights from each airport.
SELECT FROMA_ID, COUNT(F_ID) AS TotalFlights FROM FLIGHT GROUP BY FROMA_ID;
-- Explanation: Counts the number of flights departing from each airport.

-- 32. Get the number of employees working as 'Pilot'.
SELECT COUNT(E_ID) FROM EMP WHERE JOB = 'Pilot';
-- Explanation: Counts the number of pilots working in the system.

-- 33. Retrieve all customers who have taken exactly 6 flights.
SELECT C_NAME FROM CUSTOMER WHERE NO_OF_FLIGHTS = 6;
-- Explanation: Lists customers who have taken exactly 6 flights.

-- 34. Get the total salary expense of employees at 'Los Angeles'.
SELECT SUM(SALARY) AS TotalSalary FROM SALARY WHERE A_LOC = 'Los Angeles';
-- Explanation: Retrieves the total salary expense for employees at 'Los Angeles' airport.

-- 35. List all the airports in descending order of their capacity.
SELECT * FROM AIRPORTSINFO_LOC ORDER BY PLANES_CAPACITY DESC;
-- Explanation: Lists all airports ordered by descending plane capacity.

-- 36. Get the flight information for all flights from 'New York' to 'London'.
SELECT * FROM FLIGHTINFO WHERE FROMA_ID = (SELECT A_ID FROM AIRPORTSINFO_ID WHERE A_NAME = 'New York') 
AND TOA_ID = (SELECT A_ID FROM AIRPORTSINFO_ID WHERE A_NAME = 'London ');
-- Explanation: Retrieves flight information for flights from New York to London.

-- 37. Retrieve the total number of planes in 'Dubai'.
SELECT COUNT(P_ID) FROM AIRPLANES WHERE P_ID IN (SELECT P_ID FROM FLIGHT WHERE FROMA_ID = 5);
-- Explanation: Counts the number of planes in Dubai.

-- 38. Find all employees who work in 'Delhi' and are 'Engineers'.
SELECT * FROM EMP WHERE A_LOC = 'Delhi' AND JOB = 'Engineer';
-- Explanation: Retrieves all employees in 'Delhi' working as 'Engineers'.

-- 39. Get the airplane type for flights going from 'London' to 'Los Angeles'.
SELECT P_TYPE FROM AIRPLANES WHERE P_ID IN 
    (SELECT P_ID FROM FLIGHT WHERE FROMA_ID = (SELECT A_ID FROM AIRPORTSINFO_ID WHERE A_NAME = 'London ') 
    AND TOA_ID = (SELECT A_ID FROM AIRPORTSINFO_ID WHERE A_NAME = 'Los Angeles'));
-- Explanation: Retrieves the airplane type for flights from London to Los Angeles.

-- 40. List all customer IDs and their respective flight IDs.
SELECT C_ID, F_ID FROM FLIGHTINFO_CUSTOMER;
-- Explanation: Lists all customer and flight IDs from the FLIGHTINFO_CUSTOMER table.

-- 41. Get the customer details who flew on the flight with ID 1.
SELECT C_NAME FROM CUSTOMER WHERE C_ID IN 
    (SELECT C_ID FROM FLIGHTINFO_CUSTOMER WHERE F_ID = 1);
-- Explanation: Retrieves customer details for the flight with ID 1.

-- 42. Find all employees with salaries greater than 100,000.
SELECT * FROM EMP WHERE E_ID IN 
    (SELECT E_ID FROM SALARY WHERE SALARY > 100000);
-- Explanation: Retrieves all employees with a salary greater than 100,000.

-- 43. List all flight details along with airplane types.
SELECT F.F_ID, F.P_ID, AI.P_TYPE, F.DEPARTURE 
FROM FLIGHT F 
JOIN AIRPLANES AI ON F.P_ID = AI.P_ID;
-- Explanation: Retrieves flight details along with airplane types.

-- 44. Find all customers who have flown between 'Los Angeles' and 'Dubai'.
SELECT C_NAME FROM CUSTOMER 
WHERE C_ID IN 
    (SELECT C_ID FROM FLIGHTINFO_CUSTOMER 
     WHERE F_ID IN 
         (SELECT F_ID FROM FLIGHT 
          WHERE FROMA_ID = (SELECT A_ID FROM AIRPORTSINFO_ID WHERE A_NAME = 'Los Angeles') 
          AND TOA_ID = (SELECT A_ID FROM AIRPORTSINFO_ID WHERE A_NAME = 'Dubai')));
-- Explanation: Retrieves customer names for flights from Los Angeles to Dubai.

-- 45. Get the number of engineers at each airport.
SELECT A_LOC, COUNT(E_ID) AS EngineersCount FROM EMP WHERE JOB = 'Engineer' GROUP BY A_LOC;
-- Explanation: Counts the number of engineers at each airport.

-- 46. Retrieve all flights that have been delayed (where arrival is more than 2 hours after departure).
SELECT * FROM FLIGHTINFO WHERE TIMESTAMPDIFF(HOUR, DEPARTURE, ARRIVAL) > 2;
-- Explanation: Retrieves flights where the arrival was delayed by more than 2 hours.

-- 47. Find all airports with a plane capacity greater than 300.
SELECT A_NAME FROM AIRPORTSINFO_LOC WHERE PLANES_CAPACITY > 300;
-- Explanation: Retrieves all airports with a plane capacity greater than 300.

-- 48. Get the number of customers who have taken flights from 'New York'.
SELECT COUNT(C_ID) FROM FLIGHTINFO_CUSTOMER 
WHERE F_ID IN 
    (SELECT F_ID FROM FLIGHT WHERE FROMA_ID = (SELECT A_ID FROM AIRPORTSINFO_ID WHERE A_NAME = 'New York'));
-- Explanation: Counts the number of customers who have flown from New York.

-- 49. List all employees who are pilots.
SELECT * FROM EMP WHERE JOB = 'Pilot';
-- Explanation: Lists all employees who are pilots.

-- 50. Find the maximum price of a flight between 'New York' and 'Dubai'.
SELECT MAX(PRICE) FROM FLIGHTINFO 
WHERE FROMA_ID = (SELECT A_ID FROM AIRPORTSINFO_ID WHERE A_NAME = 'New York') 
AND TOA_ID = (SELECT A_ID FROM AIRPORTSINFO_ID WHERE A_NAME = 'Dubai');
-- Explanation: Retrieves the maximum price for flights from New York to Dubai.
