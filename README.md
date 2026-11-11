# Crownfield Eye Hospital – Relational Database Project

## Project Overview
This project was developed for the Introduction to Database module. It demonstrates the design and implementation of a relational database for a fictional eye hospital using MySQL Workbench.

The database contains nine connected tables: Patients, Doctors, Clinics, Appointments, Diagnoses, Medicines, Prescriptions, PrescriptionItems and FollowUpPlans.

## Software Requirements
- MySQL Server
- MySQL Workbench

## Repository Files
- `01_schema.sql.sql` – Database schema and table creation.
- `02_individual_queries.sql.sql` – SQL queries using joins, grouping and subqueries.
- `03_procedure_and_trigger.sql` – Stored procedure and trigger.
- `04_security.sql.sql` – Database roles, permissions and hashing demonstration.
- `05_transactions.sql.sql` – COMMIT and ROLLBACK testing.
- `06_update_delete_tests.sql.sql` – UPDATE and DELETE tests.
- `Crownfield_ERD.pdf..pdf` – Entity Relationship Diagram in PDF format.
- `Crownfield_ERD.pdf.png` – ERD image.
- `Dump20261031 (1).sql` – Database export.

## Setup Instructions
1. Install MySQL Server and MySQL Workbench.
2. Connect to a local MySQL Server using MySQL Workbench.
3. Open `01_schema.sql.sql` and execute it to create the database tables.
4. Run the remaining SQL scripts in numerical order, reviewing each script before execution.
5. Use the SQL queries to inspect the data and test database functionality.

## Features
- Nine related database tables with primary and foreign keys.
- SQL queries for retrieving and analysing data.
- Stored procedure: GetDoctorAppointments.
- Trigger: CheckAppointmentStatus.
- Role-based access control.
- SHA-256 hashing demonstration.
- Transaction testing using COMMIT and ROLLBACK.

## Assumptions and Limitations
The database uses fictional hospital information for educational purposes. It was tested using a small sample dataset and is not intended for use in a real hospital without additional security measures and testing.

## Individual Contribution
My contribution included creating the nine MySQL tables and their relationships, inserting sample records and testing database operations. I also tested the appointment status validation trigger.
