-- =========================================
-- HOSPITAL MANAGEMENT DATABASE : QUERIES
-- =========================================

-- 1. View all patients
SELECT * FROM Patient;

-- 2. View all doctors
SELECT * FROM Doctor;

-- 3. View all departments
SELECT * FROM Department;

-- 4. Patients with their department
SELECT 
    p.PatientName,
    d.DepartmentName
FROM Patient p
JOIN Department d
ON p.DepartmentID = d.DepartmentID;

-- 5. Patients with their assigned doctor
SELECT 
    p.PatientName,
    doc.DoctorName
FROM Patient p
JOIN Doctor doc
ON p.DoctorID = doc.DoctorID;

-- 6. Doctors and their departments
SELECT 
    doc.DoctorName,
    d.DepartmentName
FROM Doctor doc
JOIN Department d
ON doc.DepartmentID = d.DepartmentID;

-- 7. Number of patients per department
SELECT 
    d.DepartmentName,
    COUNT(p.PatientID) AS TotalPatients
FROM Patient p
JOIN Department d
ON p.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

-- 8. Number of patients treated by each doctor
SELECT 
    doc.DoctorName,
    COUNT(p.PatientID) AS PatientCount
FROM Patient p
JOIN Doctor doc
ON p.DoctorID = doc.DoctorID
GROUP BY doc.DoctorName;

-- 9. Departments having more than 5 patients
SELECT 
    d.DepartmentName,
    COUNT(p.PatientID) AS PatientCount
FROM Patient p
JOIN Department d
ON p.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
HAVING COUNT(p.PatientID) > 5;

-- 10. Doctors treating more patients than average
SELECT 
    DoctorID
FROM Patient
GROUP BY DoctorID
HAVING COUNT(PatientID) >
(
    SELECT AVG(patient_count)
    FROM (
        SELECT COUNT(PatientID) AS patient_count
        FROM Patient
        GROUP BY DoctorID
    ) t
);
