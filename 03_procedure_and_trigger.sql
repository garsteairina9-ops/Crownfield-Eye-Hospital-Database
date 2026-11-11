
USE crownfieldeyehospital;

DELIMITER //

CREATE PROCEDURE GetDoctorAppointments(
    IN doctor_id INT
)
BEGIN
    SELECT
        a.AppointmentID,
        d.FirstName,
        d.LastName,
        a.AppointmentDate,
        a.AppointmentTime,
        a.Status
    FROM Appointments a
    INNER JOIN Doctors d
        ON a.DoctorID = d.DoctorID
    WHERE a.DoctorID = doctor_id
    ORDER BY a.AppointmentDate;
END //

DELIMITER ;

CALL GetDoctorAppointments(1);



DELIMITER //

CREATE TRIGGER CheckAppointmentStatus
BEFORE INSERT ON Appointments
FOR EACH ROW
BEGIN
    IF NEW.Status NOT IN
       ('Scheduled', 'Completed', 'Cancelled')
    THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid appointment status';
    END IF;
END //

DELIMITER ;

-- Test: invalid appointment status
INSERT INTO Appointments
(PatientID, DoctorID, ClinicID, AppointmentDate, AppointmentTime, Status)
VALUES
(1, 1, 1, '2026-11-10', '10:00:00', 'WrongStatus');

