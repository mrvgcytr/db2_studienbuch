SELECT employee_id
FROM oehr_employees
UNION
SELECT department_id
FROM oehr_departments;

SELECT job_id
FROM oehr_employees
INTERSECT
SELECT job_id from
FROM oehr_jobs;

SELECT job_id
FROM oehr_jobs
MINUS
SELECT job_id 
FROM oehr_employees;

SELECT *
FROM oehr_countries, oehr_regions;

SELECT *
FROM oehr_employees, oehr_departments
WHERE oehr_employees.department_id = oehr_departments.department_id ;