
USE crownfieldeyehospital;

START TRANSACTION;

UPDATE Patients
SET PhoneNumber = 'TEST123'
WHERE PatientID = 15;

SELECT PatientID, FirstName, PhoneNumber
FROM Patients
WHERE PatientID = 15;

ROLLBACK;

SELECT PatientID, FirstName, PhoneNumber
FROM Patients
WHERE PatientID = 15;

-- COMMIT test
START TRANSACTION;

UPDATE Patients
SET Postcode = 'W12 9ZZ'
WHERE PatientID = 15;

COMMIT;

SELECT PatientID, FirstName, LastName, Postcode
FROM Patients
WHERE PatientID = 15;

