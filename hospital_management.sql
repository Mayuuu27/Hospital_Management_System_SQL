CREATE DATABASE HOSPITAL_MANAGEMENT;
USE HOSPITAL_MANAGEMENT;

CREATE TABLE PATIENTS
(PATIENT_ID INT PRIMARY KEY, FIRST_NAME VARCHAR(50),LAST_NAME VARCHAR(50), GENDER VARCHAR(10)
CHECK (GENDER IN('MALE','FEMALE','OTHER')), AGE INT, CONTACT_NUMBER VARCHAR(15),CITY VARCHAR(50),BLOOD_GROUP VARCHAR(50),DISEASE VARCHAR(50));

DESC PATIENTS;

INSERT INTO PATIENTS 
VALUES
(1,'Rahul','Sharma','Male',35,'9876543210','Mumbai','O+','Fever'),
(2,'Pooja','Patil','Female',28,'9123456780','Pune','A+','Migraine'),
(3,'Aman','Verma','Male',42,'9988776655','Delhi','B+','Diabetes'),
(4,'Sneha','Kulkarni','Female',31,'9001122334','Nashik','AB+','Thyroid'),
(5,'Rakesh','Mehta','Male',55,'8899776655','Ahmedabad','O-','BP'),
(6,'Anjali','Rao','Female',26,'9887766554','Bengaluru','A-','Anemia'),
(7,'Karan','Malhotra','Male',39,'9765432190','Delhi','B-','Back Pain'),
(8,'Neha','Singh','Female',34,'9811223344','Jaipur','O+','Asthma'),
(9,'Suresh','Nair','Male',48,'9922113344','Kochi','AB-','Heart Issue'),
(10,'Kavita','Joshi','Female',41,'9009988771','Pune','A+','Arthritis'),
(11,'Mohit','Bansal','Male',29,'9877665543','Noida','O+','Allergy'),
(12,'Rina','Das','Female',37,'9766554433','Kolkata','B+','Gastric'),
(13,'Arjun','Pillai','Male',45,'9812345678','Trivandrum','O-','Kidney Stone'),
(14,'Meena','Iyer','Female',52,'9922334455','Chennai','AB+','Sugar'),
(15,'Vikas','Yadav','Male',33,'9876123456','Lucknow','A-','Injury'),
(16,'Sunita','Pawar','Female',38,'9011223344','Kolhapur','B+','BP'),
(17,'Rohit','Khanna','Male',27,'9898981212','Chandigarh','O+','Cold'),
(18,'Pankaj','Tiwari','Male',50,'9776655443','Bhopal','A+','Liver Issue'),
(19,'Shilpa','Shetty','Female',36,'9665544332','Mangaluru','B-','Skin Issue'),
(20,'Nitin','Kulkarni','Male',44,'9888776655','Satara','O+','Chest Pain');

select * from PATIENTS;

CREATE TABLE DOCTORS
(DR_ID INT PRIMARY KEY, DR_NAME VARCHAR(50), SPECIALIZATION VARCHAR(50), EXPERIENCE_YEARS INT, CONTACT_NUMBER INT,GENDER VARCHAR(15),CONSULTATION_FEE INT,
DEPARTMENT VARCHAR(50),SHIFT VARCHAR(50),CITY VARCHAR(50));

alter table DOCTORS modify CONTACT_NUMBER varchar(50);

DESC DOCTORS;

INSERT INTO DOCTORS 
VALUES
(101,'Dr. Amit Shah','Cardiologist',15,9871112233,'Male',800,'Cardiology','Morning','Mumbai'),
(102,'Dr. Neha Joshi','Neurologist',10,9898989898,'Female',900,'Neurology','Evening','Pune'),
(103,'Dr. Ravi Singh','Orthopedic',12,9786543210,'Male',700,'Ortho','Morning','Delhi'),
(104,'Dr. Priti Deshmukh','Gynecologist',8,9009988776,'Female',600,'Gynecology','Evening','Nashik'),
(105,'Dr. Suresh Iyer','General Physician',20,9123123123,'Male',500,'General','Morning','Chennai'),
(106,'Dr. Kunal Mehta','Dermatologist',9,9877665544,'Male',650,'Skin','Evening','Ahmedabad'),
(107,'Dr. Ananya Roy','Pediatrician',7,9888777665,'Female',550,'Pediatrics','Morning','Kolkata'),
(108,'Dr. Vikram Rao','ENT',11,9765432111,'Male',600,'ENT','Evening','Bengaluru'),
(109,'Dr. Ritu Malhotra','Psychiatrist',14,9811112233,'Female',1000,'Mental Health','Morning','Delhi'),
(110,'Dr. Prakash Patil','Surgeon',18,9898981111,'Male',1200,'Surgery','Morning','Pune'),
(111,'Dr. Nilesh Kulkarni','Urologist',13,9776655441,'Male',850,'Urology','Evening','Satara'),
(112,'Dr. Swati More','Dentist',6,9665544331,'Female',400,'Dental','Morning','Kolhapur'),
(113,'Dr. Ajay Verma','Oncologist',16,9888771122,'Male',1500,'Oncology','Morning','Jaipur'),
(114,'Dr. Poonam Shah','Nutritionist',5,9001122112,'Female',300,'Diet','Evening','Mumbai'),
(115,'Dr. Ramesh Nair','Nephrologist',17,9223344556,'Male',1100,'Kidney','Morning','Kochi'),
(116,'Dr. Shweta Jain','Ophthalmologist',9,9112233445,'Female',700,'Eye','Evening','Indore'),
(117,'Dr. Sameer Khan','Pulmonologist',14,9334455667,'Male',900,'Chest','Morning','Bhopal'),
(118,'Dr. Kavya Shetty','Endocrinologist',10,9445566778,'Female',950,'Hormone','Evening','Mangaluru'),
(119,'Dr. Manoj Tiwari','Gastroenterologist',15,9556677889,'Male',1000,'Gastro','Morning','Lucknow'),
(120,'Dr. Alka Desai','Rheumatologist',12,9667788990,'Female',850,'Arthritis','Evening','Surat');

select * from DOCTORS;

CREATE TABLE APPOINTMENTS
(APPOINTMENT_ID INT PRIMARY KEY, 
PATIENT_ID INT,
FOREIGN KEY (PATIENT_ID) references PATIENTS(PATIENT_ID),
DR_ID INT,
FOREIGN KEY (DR_ID) references DOCTORS(DR_ID),
APPOINTMENT_DATE DATE,
APPOINTMENT_TIME TIME,
STATUSS VARCHAR(50),
PROBLEM VARCHAR(200),
ROOM_NUMBER VARCHAR(50),
VISIT_TYPE VARCHAR(100));

DESC APPOINTMENTS;

INSERT INTO APPOINTMENTS VALUES
(1,1,101,'2025-02-01','10:00','Completed','Chest Pain',201,'New'),
(2,2,102,'2025-02-01','11:00','Completed','Headache',305,'New'),
(3,3,105,'2025-02-02','09:30','Pending','Diabetes',101,'Follow-up'),
(4,4,104,'2025-02-02','12:00','Completed','Thyroid',410,'New'),
(5,5,103,'2025-02-03','10:30','Completed','Knee Pain',220,'New'),
(6,6,107,'2025-02-03','11:15','Completed','Weakness',115,'New'),
(7,7,108,'2025-02-04','09:00','Pending','Back Pain',210,'Follow-up'),
(8,8,117,'2025-02-04','10:45','Completed','Asthma',330,'New'),
(9,9,101,'2025-02-05','11:30','Completed','Heart Issue',201,'Follow-up'),
(10,10,120,'2025-02-05','12:15','Completed','Joint Pain',412,'New'),
(11,11,106,'2025-02-06','10:00','Completed','Allergy',305,'New'),
(12,12,119,'2025-02-06','11:00','Pending','Gastric',401,'Follow-up'),
(13,13,115,'2025-02-07','09:30','Completed','Kidney Stone',509,'New'),
(14,14,118,'2025-02-07','10:30','Completed','Sugar',308,'Follow-up'),
(15,15,110,'2025-02-08','11:15','Completed','Injury',602,'New'),
(16,16,111,'2025-02-08','12:00','Pending','BP',215,'Follow-up'),
(17,17,105,'2025-02-09','09:45','Completed','Cold',101,'New'),
(18,18,119,'2025-02-09','10:30','Completed','Liver Issue',404,'New'),
(19,19,106,'2025-02-10','11:15','Completed','Skin Problem',305,'Follow-up'),
(20,20,101,'2025-02-10','12:00','Completed','Chest Pain',201,'Follow-up');

SELECT * FROM APPOINTMENTS;

CREATE TABLE TREATMENTS
(TREATMENT_ID INT PRIMARY KEY, 
PATIENT_ID INT,
FOREIGN KEY (PATIENT_ID) references PATIENTS(PATIENT_ID),
DR_ID INT,
FOREIGN KEY (DR_ID) references DOCTORS(DR_ID),
TREATMENT_TYPE VARCHAR(50),
MEDICINE_NAME VARCHAR(50),
DAYS_ADMITTED VARCHAR(50),
TREATMENT_COST INT,
RESULT VARCHAR(250),
REMARKS VARCHAR(250));

DESC TREATMENTS;

INSERT INTO TREATMENTS VALUES
(1,1,101,'Medicine','Aspirin',3,12000,'Recovered','Stable'),
(2,2,102,'Medicine','Painkiller',2,8000,'Recovered','OK'),
(3,3,105,'Medicine','Insulin',5,15000,'Ongoing','Monitor'),
(4,4,104,'Medicine','Thyroxine',4,10000,'Recovered','Normal'),
(5,5,103,'Surgery','Knee Surgery',7,75000,'Recovered','Success'),
(6,6,107,'Medicine','Iron Tablets',3,6000,'Recovered','Improved'),
(7,7,108,'Physiotherapy','Pain Relief',5,9000,'Ongoing','Continue'),
(8,8,117,'Medicine','Inhaler',4,11000,'Recovered','Good'),
(9,9,101,'Surgery','Angioplasty',10,150000,'Recovered','Critical'),
(10,10,120,'Medicine','Calcium',3,7000,'Recovered','Stable'),
(11,11,106,'Medicine','Antihistamine',2,5000,'Recovered','Normal'),
(12,12,119,'Medicine','Antacid',3,6500,'Ongoing','Review'),
(13,13,115,'Surgery','Stone Removal',6,90000,'Recovered','OK'),
(14,14,118,'Medicine','Insulin',4,12000,'Ongoing','Control'),
(15,15,110,'Surgery','Minor Surgery',5,40000,'Recovered','Good'),
(16,16,111,'Medicine','BP Tablets',3,8000,'Ongoing','Observe'),
(17,17,105,'Medicine','Cold Syrup',2,4000,'Recovered','OK'),
(18,18,119,'Medicine','Liver Tonic',4,10000,'Recovered','Better'),
(19,19,106,'Medicine','Skin Ointment',2,4500,'Recovered','Clear'),
(20,20,101,'Medicine','Nitroglycerin',3,9000,'Recovered','Stable');

SELECT * FROM TREATMENTS;

CREATE TABLE BILLING
(BILL_ID INT PRIMARY KEY, 
PATIENT_ID INT,
FOREIGN KEY (PATIENT_ID) references PATIENTS(PATIENT_ID),
TREATMENT_ID INT,
FOREIGN KEY (TREATMENT_ID) references TREATMENTS(TREATMENT_ID),
TOTAL_AMOUNT INT,
PAYMENT_MODE VARCHAR(50),
PAYMENT_STATUS VARCHAR(50),
INSURANCE VARCHAR(50),
DISCOUNT VARCHAR(50),
BILL_DATE DATE,
FINAL_AMOUNT INT);

DESC BILLING;

INSERT INTO BILLING VALUES
(1,1,1,12000,'UPI','Paid','No',0,'2025-02-01',12000),
(2,2,2,8000,'Cash','Paid','Yes',1000,'2025-02-01',7000),
(3,3,3,15000,'Card','Pending','Yes',2000,'2025-02-02',13000),
(4,4,4,10000,'UPI','Paid','No',0,'2025-02-02',10000),
(5,5,5,75000,'Card','Paid','Yes',5000,'2025-02-03',70000),
(6,6,6,6000,'Cash','Paid','No',0,'2025-02-03',6000),
(7,7,7,9000,'UPI','Pending','No',0,'2025-02-04',9000),
(8,8,8,11000,'Card','Paid','Yes',1000,'2025-02-04',10000),
(9,9,9,150000,'Card','Paid','Yes',10000,'2025-02-05',140000),
(10,10,10,7000,'UPI','Paid','No',0,'2025-02-05',7000),
(11,11,11,5000,'Cash','Paid','No',0,'2025-02-06',5000),
(12,12,12,6500,'UPI','Pending','Yes',500,'2025-02-06',6000),
(13,13,13,90000,'Card','Paid','Yes',8000,'2025-02-07',82000),
(14,14,14,12000,'UPI','Pending','Yes',2000,'2025-02-07',10000),
(15,15,15,40000,'Cash','Paid','No',0,'2025-02-08',40000),
(16,16,16,8000,'UPI','Pending','No',0,'2025-02-08',8000),
(17,17,17,4000,'Cash','Paid','No',0,'2025-02-09',4000),
(18,18,18,10000,'Card','Paid','Yes',1000,'2025-02-09',9000),
(19,19,19,4500,'UPI','Paid','No',0,'2025-02-10',4500),
(20,20,20,9000,'Card','Paid','Yes',500,'2025-02-10',8500);

SELECT * FROM BILLING;