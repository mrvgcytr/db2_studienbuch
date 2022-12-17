SELECT last_name, department_name
FROM oehr_employees e, oehr_departments d
WHERE d.department_id=e.department_id;

SELECT a.last_name AS “Angestellter”,
b.last_name AS “Chef “
FROM oehr_employees a, oehr_employees b
WHERE a.manager_id = b.employee_id;

SELECT a.last_name, b.last_name
FROM oehr_employees a, oehr_employees b
WHERE a.employee_id < b.employee_id;

SELECT last_name, department_name,
d.department_id
FROM oehr_employees e, oehr_departments d
WHERE d.department_id=e.department_id (+);

SELECT employee_id,last_name
FROM oehr_employees
WHERE employee_id in (
    SELECT manager_id
    FROM oehr_employees
);

SELECT LEVEL, last_name, first_name, salary
FROM oehr_employees
CONNECT BY PRIOR employee_id = manager_id
START WITH last_name = 'King'
AND first_name='Steven';

SELECT max(LEVEL)
FROM oehr_employees
CONNECT BY PRIOR employee_id = manager_id;