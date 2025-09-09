# 🚌 RTA Online Bus System – Database Project
## 📌 Overview

This project was developed as part of the Introduction to Database Management course at the University of Sharjah.

The goal is to design and implement a database system for the Road & Transport Authority (RTA) to manage buses, routes, stops, passengers, and drivers. The system ensures efficient route planning, scheduling, and monitoring for city transportation.

## 🎯 Objectives

- Design a structured database for an online bus system.

- Track buses, routes, stops, drivers, and passengers.

- Maintain relationships between routes and bus stops.

- Enable SQL-based queries for insights (e.g., busiest route, electric buses, unused stops).

- Implement a simple C++ program that queries the database.

## 🧩 Database Design

### Entities & Attributes

- BUS: License Plate, Capacity, Model, Year, FuelType, RouteID

- ROUTE: RouteID, RouteName, Start, End, NoOfStops

- BUS_STOP: StopName, Area

- DRIVER: DriverID, Name, PhoneNo, LicensePlate

- PASSENGER: PassengerID, Name, PhoneNo, LicensePlate

- HAS: Relationship between Route & Bus Stops with StopOrder

### Relationships

- Each bus is assigned to one route.

- A route consists of multiple bus stops.

- Drivers are assigned to buses.

- Passengers are linked to buses they ride.

## 📊 ER & Relational Model

Relational Model

<img width="591" height="557" alt="Screenshot 2025-09-09 140457" src="https://github.com/user-attachments/assets/6c00b623-38c6-4aa2-b490-6d44108a166e" />

ER diagram shows relationships between buses, routes, stops, drivers, and passengers.

<img width="639" height="367" alt="Screenshot 2025-09-09 140429" src="https://github.com/user-attachments/assets/935f57c3-3535-43a1-8324-de458cd3b2e3" />

## 💻 Implementation

### Database

Database Name: publictransport

Implemented in MySQL.

Includes tables: BUS, ROUTE, BUS_STOP, DRIVER, PASSENGER, HAS.

### Example Queries

- Find the route with the most stops.

- Create a view of all electric buses.

- List routes that share the same stop.

- Count total seating capacity grouped by fuel type.

- Identify unused bus stops.

### C++ Integration

- Program connects to MySQL using mysqlcppconn.

- Allows user to input an area name and returns routes starting/ending there.

## 📸 Sample Output From C++ Script

<img width="818" height="461" alt="image" src="https://github.com/user-attachments/assets/bcb80f6f-90ed-4245-b5cb-b39c1b337313" />


