-- INSIGHTS
-- 1.
SELECT COUNT(*) AS Total_Patients
FROM PATIENTS;

-- 2. 
SELECT GENDER, COUNT(*) AS Patient_Count
FROM PATIENTS
GROUP BY GENDER;

-- 3. 
SELECT CITY, COUNT(*) AS Total_Patients
FROM PATIENTS
GROUP BY CITY
ORDER BY Total_Patients DESC;

-- 4. 
SELECT Specialization, COUNT(*) AS Total_Doctors
FROM DOCTORS
GROUP BY Specialization;

-- 5.
SELECT DR_NAME, EXPERIENCE_YEARS
FROM DOCTORS
ORDER BY EXPERIENCE_YEARS DESC
LIMIT 1;

-- 6. 
SELECT COUNT(*) AS Total_Appointments
FROM APPOINTMENTS;

-- 7. 
SELECT Statuss, COUNT(*) AS Total
FROM APPOINTMENTS
GROUP BY STATUSS;

-- 8. 
SELECT D.DR_NAME, COUNT(A.APPOINTMENT_ID) AS Total_Appointments
FROM APPOINTMENTS A
JOIN DOCTORS D ON A.DR_ID = D.DR_ID
GROUP BY D.DR_NAME
ORDER BY Total_Appointments DESC
LIMIT 3;

-- 9. 
SELECT SUM(Final_Amount) AS Total_Revenue
FROM BILLING
WHERE Payment_Status = 'Paid';

-- 10. 
SELECT Bill_ID, Patient_ID, Final_Amount
FROM Billing
WHERE Payment_Status = 'Pending';

-- 11. 
SELECT AVG(Treatment_Cost) AS Avg_Treatment_Cost
FROM Treatments;

-- 12. 
SELECT Treatment_Type, Treatment_Cost
FROM Treatments
ORDER BY Treatment_Cost DESC
LIMIT 1;

-- 13. 
SELECT COUNT(*) AS Insured_Patients
FROM Billing
WHERE Insurance = 'Yes';

-- 14. 
SELECT D.DR_Name, SUM(t.Treatment_Cost) AS Total_Earning
FROM treatments t
JOIN Doctors d ON t.dr_id = d.dr_id
GROUP BY d.dr_name
ORDER BY Total_Earning DESC;

-- 15. 
SELECT p.first_name, p.last_name, t.days_admitted
FROM treatments t
JOIN patients p ON t.patient_id = p.patient_id
WHERE t.days_admitted > 5;

-- 16. 
SELECT d.department, SUM(t.treatment_cost) AS department_revenue
FROM treatments t
JOIN doctors d ON t.dr_id = d.dr_id
GROUP BY d.department
ORDER BY department_revenue DESC;

-- 17. 
SELECT visit_type, COUNT(*) AS total_visits
FROM appointments
GROUP BY visit_type;

-- 18. 
SELECT DISTINCT p.first_name, p.last_name
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.dr_id = d.dr_id
WHERE d.specialization = 'Cardiologist';

-- 19. 
SELECT SUM(discount) AS total_discount_given
FROM billing;

-- 20. 
SELECT result, COUNT(*) AS total_cases
FROM treatments
GROUP BY result;