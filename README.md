# Airline Management System



## 1. Project Overview

### Objective
The **Airline Management System** is designed to model the operations of an airline. The system includes a comprehensive set of database schemas that are responsible for managing essential data related to airplanes, airports, employees, customers, and flight operations. 

### Purpose
The primary purpose of this system is to store, maintain, and efficiently query crucial data to support various airline functions. These functions include flight management, employee allocation, and customer services. By centralizing this data in a robust database, the system ensures smooth operations across different aspects of the airline business.

---

## 2. Key Features

### Entity Design
The system revolves around key entities, each representing a core component of the airline’s operations:

- **Airplanes**: Tracks the fleet of airplanes, including their types, weight, passenger capacity, and fuel capacity.
- **Airports**: Stores details about the various airports, including their locations and rankings.
- **Employees**: Contains information about airport staff, including their roles, salaries, and assigned airports.
- **Flights**: Stores flight details, including departure and arrival information, pricing, and the associated airplanes.
- **Customers**: Tracks customer information, including the number of flights they have taken.

### Triggers
The system utilizes a **trigger** to automate certain actions, such as the `FLIGHT_INFO_TRIGGER`. This trigger automatically populates the `FLIGHTINFO` table whenever a new flight is inserted, ensuring that the data remains consistent without requiring additional manual intervention.

### Relational Integrity
Relational integrity is maintained through the use of **FOREIGN KEY** constraints. These constraints help ensure that relationships between tables, such as between flights and airplanes, or between employees and their assigned airports, are always valid. This prevents the system from encountering data anomalies like orphaned records or incorrect references.

---

## 3. Challenges and Solutions

### Challenge
One of the main challenges was ensuring data consistency and handling frequent updates to flight information. Since flight details can change (e.g., departure times, airplane assignments), it is essential that these updates are efficiently reflected across the system without data inconsistencies or delays.

### Solution
To address this challenge, a **trigger** was introduced to automatically update related tables when a new flight is added. Additionally, **well-defined relationships** between the entities (via **foreign keys**) help maintain referential integrity and streamline data management. This allows for faster and more reliable data updates and queries.

---

## 4. Technologies Used

### Database
- **MySQL**: The relational database management system used to store and manage data for the airline system.

### Key Concepts
- **Triggers**: Used for automating actions and ensuring consistency across the database.
- **Foreign Keys**: Ensures relational integrity by linking tables and preventing invalid data.
- **Relational Database Design**: Organizing data into tables and defining relationships between them to reduce redundancy and improve query efficiency.
- **Query Optimization**: Ensuring that the system performs efficiently, even with a large amount of data.

---

## 5. Future Enhancements

While the current system offers a strong foundation, there are several areas where it could be further improved:

- **Advanced Scheduling**: Implement advanced features for dynamic scheduling, considering factors like airport capacity, airplane availability, and real-time weather conditions.
- **Customer Loyalty Programs**: Introduce a customer loyalty program that rewards frequent flyers with points, discounts, or special services.
- **Dynamic Pricing**: Develop a dynamic pricing model that adjusts flight ticket prices based on factors like demand, season, and booking time.

These enhancements would provide a more robust and competitive solution for the airline's needs.

---

## How to Use
1. Clone the repository to your local machine.
2. Set up a MySQL database and import the provided SQL schema.
3. Insert data into the tables following the examples provided.
4. Use the system to manage and query airline operations.
