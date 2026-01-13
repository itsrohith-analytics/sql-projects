create database hospitaldb;
use hospitaldb;


CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);

CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY,
    DoctorName VARCHAR(100),
    DeptID INT,
    Phone VARCHAR(15),
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

CREATE TABLE Patient (
    PatientID INT PRIMARY KEY,
    PatientName VARCHAR(100),
    Gender VARCHAR(10),
    Age INT,
    Phone VARCHAR(15)
);

CREATE TABLE Appointment (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    Date DATE,
    Time TIME,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);

CREATE TABLE Treatment (
    TreatmentID INT PRIMARY KEY,
    AppointmentID INT,
    Diagnosis VARCHAR(255),
    Medicine VARCHAR(255),
    FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID)
);
