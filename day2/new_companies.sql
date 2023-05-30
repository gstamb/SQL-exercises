-- Link to the problem https://www.hackerrank.com/challenges/the-company/

-- The database schema consists of 5 tables
-- Table 1: Company
-- company_code, String
-- founder, String
--
-- Table 2: Lead_manager
-- lead_manager_code, String
-- company_code, string
-- 
-- Table 3: Senior_manager
-- senior_manager_code, String
-- lead_manager_code, String
-- company_code, String
--
-- Table 4: Manager
-- manager_code, String
-- senior_manager_code, String
-- lead_manager_code, String
-- company_code, String
--
-- Table 4: Employee
-- employee_code, String
-- manager_code, String
-- senior_manager_code, String
-- lead_manager_code, String



-- Problem:
-- Amber's  conglomerate corporation just acquired some new companies. Each of the companies follows this hierarchy: FOUNDER -> LEAD MANAGER -> SENIOR MANAGER -> MANAGER -> EMPLOYEE
Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.



-- name: New Companies

-- Solution:
SELECT company_code, founder, 
        (SELECT COUNT(DISTINCT lead_manager_code) FROM lead_manager WHERE lead_manager.company_code = company.company_code) AS tot_lead_manager_count,
        (SELECT COUNT(DISTINCT senior_manager_code) FROM senior_manager WHERE senior_manager.company_code = company.company_code) AS tot_senior_manager_count,
        (SELECT COUNT(DISTINCT manager_code) FROM manager WHERE manager.company_code = company.company_code) AS tot_manager_count,
        (SELECT COUNT(DISTINCT employee_code) FROM employee WHERE employee.company_code = company.company_code) AS tot_employee_count    
FROM company
ORDER BY company_code;
 