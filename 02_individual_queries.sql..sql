SELECT
    d.DoctorID,
    d.FirstName,
    d.LastName,
    COUNT(a.AppointmentID) AS TotalAppointments
FROM Doctors d
INNER JOIN Appointments a
    ON d.DoctorID = a.DoctorID
GROUP BY
    d.DoctorID,
    d.FirstName,
    d.LastName
HAVING COUNT(a.AppointmentID) >= 2
ORDER BY TotalAppointments DESC;
SELECT
    p.PatientID,
    p.FirstName,
    p.LastName,
    a.AppointmentID
FROM Patients p
LEFT JOIN Appointments a
    ON p.PatientID = a.PatientID
WHERE a.AppointmentID IS NULL;
INSERT INTO Patients
(PatientCode, FirstName, LastName, Postcode)
VALUES
('OP015', 'Alex', 'Morgan', 'W12 8AB');
SELECT
    p.PatientID,
    p.FirstName,
    p.LastName,
    a.AppointmentID
FROM Patients p
LEFT JOIN Appointments a
    ON p.PatientID = a.PatientID
WHERE a.AppointmentID IS NULL;
SELECT
    PatientID,
    FirstName,
    LastName
FROM Patients
WHERE PatientID IN (
    SELECT PatientID
    FROM Appointments
    GROUP BY PatientID
    HAVING COUNT(*) > 1
);