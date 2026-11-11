
USE crownfieldeyehospital;

-- UPDATE TEST
START TRANSACTION;

UPDATE Patients
SET Postcode = 'TEST123'
WHERE PatientID = 15;

SELECT PatientID, FirstName, LastName, Postcode
FROM Patients
WHERE PatientID = 15;

ROLLBACK;

-- DELETE TEST
START TRANSACTION;

DELETE FROM Patients
WHERE PatientID = 15;

SELECT PatientID, FirstName, LastName
FROM Patients
WHERE PatientID = 15;

ROLLBACK;

-- VERIFY PATIENT STILL EXISTS
SELECT PatientID, FirstName, LastName, Postcode
FROM Patients
WHERE PatientID = 15;
