# SmartCare Hospital Management SQL Database

## Project Overview

SmartCare Hospital Management Database is a complete SQL database project designed to manage hospital operations efficiently.

The system stores and manages information related to:

- Departments
- Doctors
- Patients
- Appointments
- Medical Records
- Bills
- Medicines
- Prescriptions

This project demonstrates database design concepts, table relationships, data integrity, and advanced SQL queries.

---

## Technologies Used

- MySQL 8.0
- SQL

---

## Database Structure

The database contains the following tables:

1. Departments
2. Doctors
3. Patients
4. Appointments
5. Medical_Records
6. Bills
7. Medicines
8. Prescriptions

---

## Database Relationships

- One Department can have multiple Doctors.
- One Doctor can manage multiple Appointments.
- One Patient can have multiple Appointments.
- One Patient can have multiple Medical Records.
- One Patient can have multiple Bills.
- One Patient can receive multiple Prescriptions.
- One Medicine can appear in multiple Prescriptions.

---

## Features

### Database Design
- Primary Keys
- Foreign Keys
- Relational Database Design

### Data Management
- Insert Records
- Manage Patient Information
- Manage Doctor Information
- Manage Medical Records
- Manage Prescriptions

### SQL Analysis
- JOIN Queries
- Aggregate Functions
- Subqueries
- Sorting and Filtering
- Reporting Queries

---

## Files Included

```text
schema.sql
insert_data.sql
queries.sql
README.md
```

---

## Example Queries

### Doctors with Departments

```sql
SELECT d.full_name,
       d.specialization,
       dep.department_name
FROM Doctors d
JOIN Departments dep
ON d.department_id = dep.department_id;
```

### Top 5 Highest Paid Doctors

```sql
SELECT full_name,
       specialization,
       salary
FROM Doctors
ORDER BY salary DESC
LIMIT 5;
```

### Total Revenue

```sql
SELECT SUM(total_amount)
FROM Bills
WHERE payment_status = 'Paid';
```

---

## SQL Concepts Demonstrated

- CREATE DATABASE
- CREATE TABLE
- PRIMARY KEY
- FOREIGN KEY
- INSERT INTO
- SELECT
- JOIN
- GROUP BY
- COUNT
- SUM
- AVG
- MAX
- MIN
- ORDER BY
- SUBQUERY

---

## Author

Ahmed AlKohly

GitHub:
https://github.com/AhmedAlkohly14

---

