DROP DATABASE IF EXISTS SmartCare_Hospital;

CREATE DATABASE SmartCare_Hospital;

USE SmartCare_Hospital;

CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    floor_number INT NOT NULL
);

CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    phone VARCHAR(20) UNIQUE,
    salary DECIMAL(10,2),
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES Departments(department_id)
);

CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender ENUM('Male','Female'),
    birth_date DATE,
    blood_type VARCHAR(5),
    phone VARCHAR(20),
    address TEXT
);

CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATETIME,
    status VARCHAR(50),
    FOREIGN KEY (patient_id)
        REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id)
        REFERENCES Doctors(doctor_id)
);

CREATE TABLE Medical_Records (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    diagnosis TEXT,
    treatment TEXT,
    visit_date DATE,
    FOREIGN KEY (patient_id)
        REFERENCES Patients(patient_id)
);

CREATE TABLE Bills (
    bill_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    total_amount DECIMAL(10,2),
    payment_status VARCHAR(50),
    FOREIGN KEY (patient_id)
        REFERENCES Patients(patient_id)
);

CREATE TABLE Medicines (
    medicine_id INT AUTO_INCREMENT PRIMARY KEY,
    medicine_name VARCHAR(100),
    quantity INT,
    expiry_date DATE,
    price DECIMAL(10,2)
);

CREATE TABLE Prescriptions (
    prescription_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    medicine_id INT,
    dosage VARCHAR(100),
    FOREIGN KEY (patient_id)
        REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id)
        REFERENCES Doctors(doctor_id),
    FOREIGN KEY (medicine_id)
        REFERENCES Medicines(medicine_id)
);
USE SmartCare_Hospital;

INSERT INTO Departments (department_name, floor_number)
VALUES
('Cardiology',1),
('Neurology',2),
('Emergency',1),
('Pediatrics',3),
('Surgery',4),
('Orthopedics',2),
('Dermatology',5),
('Radiology',1),
('Oncology',3),
('ENT',4),
('ICU',1),
('Dental',2),
('Psychiatry',5),
('Urology',3),
('Gynecology',4),
('Ophthalmology',2),
('Physiotherapy',1),
('Laboratory',1),
('Pharmacy',1),
('Administration',6);

INSERT INTO Doctors
(full_name, specialization, phone, salary, department_id)
VALUES
('Ahmed Hassan','Cardiologist','0771000001',5000,1),
('Ali Kareem','Neurologist','0771000002',4800,2),
('Sara Mohammed','Pediatrician','0771000003',4500,4),
('Zainab Ali','Surgeon','0771000004',7000,5),
('Mustafa Omar','Orthopedic','0771000005',5200,6),
('Hussein Adnan','Dermatologist','0771000006',4300,7),
('Noor Sami','Radiologist','0771000007',5100,8),
('Fatima Karim','Oncologist','0771000008',6200,9),
('Mahdi Ahmed','ENT Specialist','0771000009',4700,10),
('Rana Saad','ICU Specialist','0771000010',6500,11),
('Yousef Khalid','Dentist','0771000011',3900,12),
('Mariam Taha','Psychiatrist','0771000012',5600,13),
('Qasim Nabil','Urologist','0771000013',5400,14),
('Aya Hussein','Gynecologist','0771000014',6000,15),
('Omar Fadel','Eye Specialist','0771000015',5000,16),
('Huda Salman','Physiotherapist','0771000016',3500,17),
('Laith Anwar','Lab Specialist','0771000017',4000,18),
('Sajad Ali','Pharmacist','0771000018',3200,19),
('Bashar Raad','Administrator','0771000019',3000,20),
('Reem Ahmed','Emergency Doctor','0771000020',5800,3);

INSERT INTO Patients
(first_name,last_name,gender,birth_date,blood_type,phone,address)
VALUES
('Omar','Ali','Male','1999-05-10','A+','0780000001','Baghdad'),
('Zainab','Hussein','Female','2001-07-15','B+','0780000002','Basra'),
('Mustafa','Khalid','Male','1995-03-22','O+','0780000003','Mosul'),
('Sara','Ahmed','Female','1998-09-11','AB+','0780000004','Najaf'),
('Ali','Mahmood','Male','1987-06-30','A-','0780000005','Karbala'),
('Noor','Sami','Female','2002-01-05','B-','0780000006','Baghdad'),
('Hassan','Tariq','Male','1990-04-18','O-','0780000007','Erbil'),
('Aya','Kareem','Female','1997-12-09','A+','0780000008','Sulaymaniyah'),
('Mahdi','Qasim','Male','1985-02-13','B+','0780000009','Duhok'),
('Fatima','Adel','Female','2000-10-20','AB-','0780000010','Babylon'),
('Yousef','Ali','Male','1994-11-08','A+','0780000011','Baghdad'),
('Rana','Salim','Female','1993-05-25','O+','0780000012','Basra'),
('Huda','Nabil','Female','1996-08-17','B+','0780000013','Najaf'),
('Sajad','Ahmed','Male','1989-07-29','A-','0780000014','Mosul'),
('Reem','Hussein','Female','1991-03-14','O+','0780000015','Kirkuk'),
('Laith','Khalid','Male','1992-01-22','AB+','0780000016','Baghdad'),
('Mariam','Fadel','Female','1999-04-04','B-','0780000017','Basra'),
('Bashar','Omar','Male','1988-09-09','O-','0780000018','Najaf'),
('Qasim','Adnan','Male','1997-06-06','A+','0780000019','Erbil'),
('Ritaj','Ali','Female','2003-12-12','B+','0780000020','Baghdad');
INSERT INTO Appointments
(patient_id, doctor_id, appointment_date, status)
VALUES
(1,1,'2026-05-20 10:00:00','Completed'),
(2,2,'2026-05-21 11:30:00','Pending'),
(3,3,'2026-05-22 09:00:00','Scheduled'),
(4,4,'2026-05-23 12:00:00','Completed'),
(5,5,'2026-05-24 01:00:00','Cancelled'),
(6,6,'2026-05-25 02:30:00','Completed'),
(7,7,'2026-05-26 03:00:00','Pending'),
(8,8,'2026-05-27 09:30:00','Scheduled'),
(9,9,'2026-05-28 11:00:00','Completed'),
(10,10,'2026-05-29 01:30:00','Pending'),
(11,11,'2026-05-30 10:30:00','Scheduled'),
(12,12,'2026-06-01 09:15:00','Completed'),
(13,13,'2026-06-02 11:45:00','Pending'),
(14,14,'2026-06-03 12:30:00','Completed'),
(15,15,'2026-06-04 01:15:00','Scheduled'),
(16,16,'2026-06-05 02:00:00','Cancelled'),
(17,17,'2026-06-06 03:45:00','Completed'),
(18,18,'2026-06-07 10:20:00','Pending'),
(19,19,'2026-06-08 09:40:00','Scheduled'),
(20,20,'2026-06-09 11:10:00','Completed');

INSERT INTO Medical_Records
(patient_id, diagnosis, treatment, visit_date)
VALUES
(1,'Hypertension','Medication','2026-05-20'),
(2,'Migraine','Painkillers','2026-05-21'),
(3,'Flu','Rest and Fluids','2026-05-22'),
(4,'Appendicitis','Surgery','2026-05-23'),
(5,'Bone Fracture','Casting','2026-05-24'),
(6,'Skin Allergy','Cream Treatment','2026-05-25'),
(7,'Lung Infection','Antibiotics','2026-05-26'),
(8,'Cancer Check','Chemotherapy','2026-05-27'),
(9,'Ear Infection','Drops','2026-05-28'),
(10,'Critical Condition','ICU Care','2026-05-29'),
(11,'Tooth Decay','Filling','2026-05-30'),
(12,'Depression','Therapy','2026-06-01'),
(13,'Kidney Stones','Medication','2026-06-02'),
(14,'Pregnancy Follow-up','Monitoring','2026-06-03'),
(15,'Eye Weakness','Glasses','2026-06-04'),
(16,'Muscle Pain','Physiotherapy','2026-06-05'),
(17,'Blood Test','Lab Analysis','2026-06-06'),
(18,'Medication Refill','Prescription','2026-06-07'),
(19,'Administrative Check','Documents','2026-06-08'),
(20,'Emergency Injury','Immediate Treatment','2026-06-09');

INSERT INTO Bills
(patient_id, total_amount, payment_status)
VALUES
(1,250,'Paid'),
(2,400,'Unpaid'),
(3,150,'Paid'),
(4,2000,'Paid'),
(5,750,'Pending'),
(6,300,'Paid'),
(7,500,'Unpaid'),
(8,3500,'Paid'),
(9,220,'Paid'),
(10,5000,'Pending'),
(11,180,'Paid'),
(12,650,'Unpaid'),
(13,900,'Paid'),
(14,1200,'Pending'),
(15,300,'Paid'),
(16,450,'Unpaid'),
(17,100,'Paid'),
(18,250,'Paid'),
(19,80,'Pending'),
(20,1700,'Paid');
INSERT INTO Medicines
(medicine_name, quantity, expiry_date, price)
VALUES
('Paracetamol',100,'2027-01-01',5),
('Ibuprofen',80,'2027-02-01',7),
('Amoxicillin',60,'2026-12-01',12),
('Insulin',40,'2026-11-01',25),
('Vitamin C',120,'2027-03-01',4),
('Aspirin',90,'2027-04-01',6),
('Metformin',70,'2026-10-01',15),
('Omeprazole',50,'2027-05-01',9),
('Cough Syrup',30,'2026-09-01',8),
('Antibiotic Cream',45,'2027-06-01',11),
('Eye Drops',55,'2026-08-01',13),
('Pain Relief Gel',35,'2027-07-01',14),
('Antacid',65,'2027-01-15',5),
('Antihistamine',85,'2026-11-20',7),
('Blood Pressure Med',40,'2027-02-14',18),
('Heart Medicine',30,'2027-03-18',22),
('Skin Lotion',50,'2027-04-22',10),
('Nasal Spray',25,'2026-10-30',16),
('Antifungal',20,'2027-05-25',19),
('Multivitamins',110,'2027-06-30',6);

INSERT INTO Prescriptions
(patient_id, doctor_id, medicine_id, dosage)
VALUES
(1,1,15,'Twice Daily'),
(2,2,2,'Once Daily'),
(3,3,1,'Three Times Daily'),
(4,4,3,'Twice Daily'),
(5,5,12,'Once Daily'),
(6,6,17,'Twice Daily'),
(7,7,3,'Three Times Daily'),
(8,8,16,'Once Daily'),
(9,9,18,'Twice Daily'),
(10,10,4,'Daily'),
(11,11,6,'Once Daily'),
(12,12,14,'Twice Daily'),
(13,13,7,'Daily'),
(14,14,5,'Once Daily'),
(15,15,11,'Twice Daily'),
(16,16,12,'Three Times Daily'),
(17,17,13,'Daily'),
(18,18,20,'Once Daily'),
(19,19,5,'Daily'),
(20,20,1,'Twice Daily');
