
SELECT 'Patients' AS TableName, COUNT(*) AS Total FROM Patients
UNION ALL
SELECT 'Doctors', COUNT(*) FROM Doctors
UNION ALL
SELECT 'Clinics', COUNT(*) FROM Clinics
UNION ALL
SELECT 'Appointments', COUNT(*) FROM Appointments
UNION ALL
SELECT 'Diagnoses', COUNT(*) FROM Diagnoses
UNION ALL
SELECT 'Medicines', COUNT(*) FROM Medicines
UNION ALL
SELECT 'Prescriptions', COUNT(*) FROM Prescriptions
UNION ALL
SELECT 'PrescriptionItems', COUNT(*) FROM PrescriptionItems
UNION ALL
SELECT 'FollowUpPlans', COUNT(*) FROM FollowUpPlans;
