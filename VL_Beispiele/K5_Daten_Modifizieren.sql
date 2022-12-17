CREATE TABLE empcopy AS (SELECT * FROM oehr_employees);

INSERT INTO oehr_employees
    (employee_id, first_name, last_name, email,
    hire_date, job_id, salary ,department_id)
VALUES
    (1000, 'Christian', 'Meier', 'CMEIER',
    '16.05.86', 'IT_PROG', 20000/13.3, 20);

INSERT INTO oehr_employees
    (employee_id, first_name, last_name, email,
    hire_date, job_id, salary, department_id)
VALUES
    (1001, 'Lena', 'Busch', 'LBUSCH',
    SYSDATE, 'IT_PROG', 40000, 20);

INSERT INTO oehr_employees
    (employee_id, last_name, email, hire_date, job_id)
SELECT 
    employee_id + 1000, last_name, email || '2',
    SYSDATE, job_id
FROM oehr_employees;

DELETE FROM oehr_employees
WHERE first_name='Luis';

UPDATE oehr_employees
SET salary = salary * 2
WHERE manager_id IS NULL;

UPDATE oehr_employees
SET salary = salary +100
WHERE salary <= ( 
    SELECT avg (salary)
    FROM oehr_employees);

UPDATE oehr_employees
SET salary = salary * 1.1
WHERE employee_id IN ( 
    SELECT manager_id
    FROM oehr_employees);


UPDATE oehr_employees
SET salary = salary * 2
WHERE manager_id IS NULL;
-- Setzen des Savepoints
SAVEPOINT AbschnittA;
UPDATE oehr_employees
SET salary = 10000;
-- Zurücknahme der Änderungen bis zum Savepoint
ROLLBACK TO AbschnittA;
Select * from oehr_employees;