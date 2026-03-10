
Project Summary – HR Attrition Analysis

This project analyzes employee data to understand the key factors influencing employee attrition in the organization. The analysis was performed using SQL in Microsoft SQL Server to explore 
employee demographics, job roles, salary information, and workplace satisfaction metrics.

The primary objective of this analysis was to identify patterns and trends that contribute to employee turnover and provide insights that can help the HR department improve employee retention.
During the analysis, several important insights were discovered. The Sales department shows a higher attrition count compared to other departments, indicating potential challenges related to workload or job expectations.

Additionally, employees working overtime exhibit a significantly higher attrition count, suggesting that excessive workload may contribute to employee dissatisfaction and eventual resignation.
The study also found that employees with only one year at the company show the highest attrition count, highlighting the need for improved onboarding programs and early employee engagement strategies. 
Furthermore, employees with a WorkLifeBalance score of 3 show a higher attrition count, suggesting that moderate work-life balance alone may not be sufficient to retain employees.

Another important observation is that the HR department shows a relatively higher attrition rate, which may be linked to its lower average salary compared to other departments. This indicates that
compensation could play a role in employee turnover.
Overall, this analysis provides valuable insights into employee behavior and attrition patterns. The findings suggest that improving work-life balance, managing overtime, enhancing early employee engagement, and reviewing salary structures could help the organization reduce employee turnover and improve workforce stability.






select * from hr;


SELECT TOP 5 *
FROM hr
WHERE Department = 'Sales'
ORDER BY MonthlyIncome DESC;

'HR wants to know the top 5 highest paid employees in the Sales department'

select top 5 MonthlyIncome from hr
where department = 'Sales';

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'hr';

select count(*) as duplicate_ID from hr
group by EmployeeNumber
having count(*) > 1 ;

'GET DUPLICATE  employee id number '

SELECT *
FROM hr
WHERE EmployeeNumber IN (
    SELECT EmployeeNumber
    FROM hr
    GROUP BY EmployeeNumber
    HAVING COUNT(*) > 1
);

1) Department Attrition Insight
Scenario:
HR believes the Sales department has the highest attrition.
Which department has the highest attrition rate?

SELECT Department,
COUNT(CASE WHEN Attrition = 1 then 1 end) AS AttritionCount
FROM hr
GROUP BY Department
ORDER BY AttritionCount DESC;

#Insight Goal:  Reseach & Development has 133 Attrition count


2)Average Salary of Employees Who Left vs Stayed
Scenario: Management suspects low salary causes attrition.

select Department,Attrition , avg(MonthlyIncome) as Avg_salary
from hr
group by Attrition, Department
order by Department ;

#Insight : The Attrition rate is higher in hr because of lower avg salary as compared to other


3) Overtime Impact on Attrition
Scenario: HR believes overtime increases attrition.
 
 select OverTime , count(case when Attrition = 1 Then 1 end) as attrition_overtime from hr
 group by OverTime;

 Insight : Employees who work overtime have a significantly higher attrition count (127), 
 indicating that excessive workload may contribute to employee turnover.



 4) Work-Life Balance Impact
Scenario: Poor work-life balance might cause resignations

SELECT WorkLifeBalance,
COUNT(CASE WHEN Attrition = '1' THEN 1 END) AS AttritionCount
FROM hr
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;

#Insight : The attrition count is highest among employees with a WorkLifeBalance score of 3,
with 127 employees leaving compared to other categories.


5) Attrition by Years at Company
Scenario: HR suspects new employees leave more often.

SELECT YearsAtCompany,
COUNT(CASE WHEN Attrition = '1' THEN 1 END) AS AttritionCount
FROM hr
GROUP BY YearsAtCompany
ORDER BY YearsAtCompany;

Insight : Employees with only 1 year at the company show the highest attrition count (59), 
suggesting that early-stage employees are more likely to leave the organization.

8) Distance from Home Analysis
Scenario: Long commuting distance might affect retention.

SELECT 
CASE 
WHEN DistanceFromHome <= 10 THEN 'Near'
WHEN DistanceFromHome <= 20 THEN 'Medium'
ELSE 'Far'
END AS DistanceCategory,
COUNT(CASE WHEN Attrition = '1' THEN 1 END) AS AttritionCount
FROM hr
GROUP BY 
CASE 
WHEN DistanceFromHome <= 10 THEN 'Near'
WHEN DistanceFromHome <= 20 THEN 'Medium'
ELSE 'Far'
END;

Insight: Attrition count is higher for employees living near the workplace,
with approximately 144 employees leaving the company.


9) Job Role with Highest Attrition
Scenario: Some roles might have high turnover.

SELECT JobRole,
COUNT(CASE WHEN Attrition = '1' THEN 1 END) AS AttritionCount
FROM hr
GROUP BY JobRole
ORDER BY AttritionCount DESC;

Insight : Top 3 Highest Attrition Roler are 
Laboratory Technician
Sales Executive
Reseach scientist

Identify High-Risk Employees
Scenario: HR wants to identify employees likely to leave.


SELECT *
FROM hr
WHERE OverTime = '1'
AND WorkLifeBalance <= 2
AND JobSatisfaction <= 2;