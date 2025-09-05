-- Question 1 : Average Attrition rate for all Departments
-- SQL Query to Get Attrition Rate by Department
SELECT 
    Department,
    ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100, 2) AS AttritionRate_Percent
FROM hr_1
GROUP BY Department;

-- SQL Query to Get Overall Average Attrition Rate
SELECT 
    ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100, 2) AS AverageAttritionRate
FROM hr_1;

-- Question 2 : Average Hourly rate of Male Research Scientist
SELECT 
    ROUND(AVG(HourlyRate), 2) AS Avg_HourlyRate_Male_ResearchScientist
FROM hr_1
WHERE 
    Gender = 'Male' AND 
    JobRole = 'Research Scientist';

-- Question 3 : Attrition rate Vs Monthly income stats
SELECT 
    h1.Attrition,
    ROUND(AVG(h2.MonthlyIncome), 2) AS AvgMonthlyIncome
FROM 
    hr_1 h1
JOIN 
    hr_2 h2 ON h1.EmployeeNumber = h2.`Employee ID`
GROUP BY 
    h1.Attrition;

-- Question 4 : Average working years for each Department
SELECT 
    h1.Department,
    ROUND(AVG(h2.TotalWorkingYears), 2) AS AvgWorkingYears
FROM 
    hr_1 h1
JOIN 
    hr_2 h2 ON h1.EmployeeNumber = h2.`Employee ID`
GROUP BY 
    h1.Department;
    
-- 1. By Department and Gender
SELECT 
    h1.Department,
    h1.Gender,
    ROUND(AVG(h2.TotalWorkingYears), 2) AS AvgWorkingYears
FROM 
    hr_1 h1
JOIN 
    hr_2 h2 ON h1.EmployeeNumber = h2.`Employee ID`
GROUP BY 
    h1.Department, h1.Gender;
    
-- 2. By Department and Attrition
SELECT 
    h1.Department,
    h1.Attrition,
    ROUND(AVG(h2.TotalWorkingYears), 2) AS AvgWorkingYears
FROM 
    hr_1 h1
JOIN 
    hr_2 h2 ON h1.EmployeeNumber = h2.`Employee ID`
GROUP BY 
    h1.Department, h1.Attrition;

--  3. Bucketed View: Working Years Ranges vs. Department
SELECT 
    h1.Department,
    CASE 
        WHEN h2.TotalWorkingYears <= 5 THEN '0-5 years'
        WHEN h2.TotalWorkingYears BETWEEN 6 AND 10 THEN '6-10 years'
        WHEN h2.TotalWorkingYears BETWEEN 11 AND 15 THEN '11-15 years'
        ELSE '16+ years'
    END AS WorkingYearsRange,
    COUNT(*) AS EmployeeCount
FROM 
    hr_1 h1
JOIN 
    hr_2 h2 ON h1.EmployeeNumber = h2.`Employee ID`
GROUP BY 
    h1.Department, WorkingYearsRange
ORDER BY 
    h1.Department, WorkingYearsRange;

-- Question 5 : Job Role Vs Work life balance
SELECT 
    h1.JobRole,
    ROUND(AVG(h2.WorkLifeBalance), 2) AS AvgWorkLifeBalance
FROM 
    hr_1 h1
JOIN 
    hr_2 h2 ON h1.EmployeeNumber = h2.`Employee ID`
GROUP BY 
    h1.JobRole;

-- Work-Life Balance by JobRole and Gender
SELECT 
    h1.JobRole,
    h1.Gender,
    ROUND(AVG(h2.WorkLifeBalance), 2) AS AvgWorkLifeBalance
FROM 
    hr_1 h1
JOIN 
    hr_2 h2 ON h1.EmployeeNumber = h2.`Employee ID`
GROUP BY 
    h1.JobRole, h1.Gender;

-- Question 6 : Attrition rate Vs Year since last promotion relation
SELECT 
    h1.Attrition,
    ROUND(AVG(h2.YearsSinceLastPromotion), 2) AS AvgYearsSinceLastPromotion
FROM 
    hr_1 h1
JOIN 
    hr_2 h2 ON h1.EmployeeNumber = h2.`Employee ID`
GROUP BY 
    h1.Attrition;
