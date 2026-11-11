
USE crownfieldeyehospital;

CREATE ROLE IF NOT EXISTS
'Administrator',
'Doctor',
'Patient',
'Receptionist';

SHOW GRANTS FOR 'Administrator';


-- Administrator: full access
GRANT ALL PRIVILEGES
ON crownfieldeyehospital.*
TO 'Administrator';

-- Doctor: view and update clinical records
GRANT SELECT ON crownfieldeyehospital.* TO 'Doctor';
GRANT INSERT, UPDATE
ON crownfieldeyehospital.Diagnoses TO 'Doctor';
GRANT INSERT, UPDATE
ON crownfieldeyehospital.Prescriptions TO 'Doctor';

-- Patient: read-only access to selected tables
GRANT SELECT
ON crownfieldeyehospital.Clinics TO 'Patient';

-- Receptionist: manage appointments
GRANT SELECT
ON crownfieldeyehospital.Patients TO 'Receptionist';
GRANT SELECT, INSERT, UPDATE
ON crownfieldeyehospital.Appointments TO 'Receptionist';
GRANT SELECT
ON crownfieldeyehospital.Doctors TO 'Receptionist';
GRANT SELECT
ON crownfieldeyehospital.Clinics TO 'Receptionist';

-- Check permissions
SHOW GRANTS FOR 'Doctor';
SHOW GRANTS FOR 'Receptionist';


-- Demonstrate hashing of sensitive information
SELECT
    PatientID,
    FirstName,
    LastName,
    SHA2(CONCAT(PatientID, ':', PatientCode), 256)
        AS HashedPatientIdentifier
FROM Patients
LIMIT 5;
SHOW GRANTS FOR 'Patient';