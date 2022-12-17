DESCRIBE oehr_employees;

SELECT * 
FROM oehr_employees;

SELECT last_name, first_name, salary 
FROM oehr_employees;

SELECT last_name , first_name
FROM oehr_employees
WHERE salary = 9000;

SELECT last_name, first_name, salary
FROM oehr_employees
WHERE salary BETWEEN 3500 AND 4000;

SELECT last_name, first_name, salary
FROM oehr_employees
WHERE salary >= 3500 AND salary <= 4000;

SELECT last_name, first_name, salary, salary*13
FROM oehr_employees;

SELECT last_name, first_name
FROM oehr_employees
WHERE last_name like 'T%';

SELECT last_name, first_name
FROM oehr_employees
WHERE first_name like '_i%';

SELECT last_name, first_name
FROM oehr_employees
WHERE last_name like 'T%' AND
first_name like '_i%';

SELECT last_name, salary
FROM oehr_employees
ORDER BY salary DESC;

SELECT last_name, salary
FROM oehr_employees
ORDER BY salary,last_name;

SELECT last_name, salary
FROM oehr_employees
ORDER BY 2,1;

SELECT department_id
FROM oehr_employees
GROUP BY department_id;

SELECT department_id, COUNT(*)
FROM oehr_employees
GROUP BY department_id;

SELECT department_id, SUM(salary)
FROM oehr_employees
GROUP BY department_id
HAVING SUM(salary) <= 20000;

SELECT department_id, SUM(salary)
FROM oehr_employees
GROUP BY department_id
HAVING SUM(salary) <= 20000
AND department_id IS NOT NULL;

