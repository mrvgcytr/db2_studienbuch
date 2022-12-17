CREATE TABLE cars (
    car_id NUMBER(4) NOT NULL,
    licence VARCHAR2(10) NOT NULL,
    type VARCHAR2(15) NOT NULL,
    model VARCHAR2(15) NULL,
    colour VARCHAR2(15) NULL,
    purchase_price NUMBER(7,2) NULL,
    purchase_date DATE NOT NULL,
    department_id NUMBER(3)
);




-- Aufbau der cars Tabelle ausgeben
DESCRIBE cars;

-- Verwerfen der Tabelle cars
DROP TABLE cars;
-- Neuanlegen der Tabelle cars mit Primärschlüssel
CREATE TABLE cars (
car_id NUMBER(4) NOT NULL,
licence VARCHAR2(10) NOT NULL,
type VARCHAR2(15) NOT NULL,
model VARCHAR2(15) NULL,
colour VARCHAR2(15) NULL,
purchase_price NUMBER(7,2) NULL,
purchase_date DATE NOT NULL,
department_id NUMBER(3) ,
-- Anlegen des Primärschlüssels
CONSTRAINT PK_cars
PRIMARY KEY (car_id)
);

-- Constraint Tabelle ausgeben 
SELECT *
FROM USER_CONSTRAINTS

-- Verwerfen der Tabelle cars
DROP TABLE cars;
-- Neuanlegen der Tabelle cars mit
-- Primär- und Fremdschlüssel
CREATE TABLE cars (
car_id NUMBER(4) NOT NULL,
licence VARCHAR2(10) NOT NULL,
type VARCHAR2(15) NOT NULL,
model VARCHAR2(15) NULL,
colour VARCHAR2(15) NULL,
purchase_price NUMBER(7,2) NULL,
purchase_date DATE NOT NULL,
department_id NUMBER(3) ,
-- Anlegen des Primärschlüssels
CONSTRAINT PK_cars
PRIMARY KEY (car_id) ,
-- Anlegen des Fremdschlüssels
CONSTRAINT FK_department
FOREIGN KEY (department_id)
REFERENCES oehr_departments (department_id)
);

-- Verwerfen der Tabelle cars
DROP TABLE cars;
-- Neuanlegen der Tabelle cars mit
-- Checkregel
CREATE TABLE cars (
car_id NUMBER(4) NOT NULL,
licence VARCHAR2(10) NOT NULL ,
type VARCHAR2(15) CONSTRAINT CK_type CHECK (type in ('VW','AUDI','SEAT','SKODA','PORSCHE')),
model VARCHAR2(15) NULL,
colour VARCHAR2(15) NULL,
purchase_price NUMBER(7,2) NULL,
purchase_date DATE NOT NULL,
department_id NUMBER(3)
);

SELECT *
FROM user_constraints
WHERE constraint_name LIKE 'CK%';

-- Verwerfen der Tabelle cars
DROP TABLE cars;
-- Neuanlegen der Tabelle cars mit
-- Defaultwerten
CREATE TABLE cars (
car_id NUMBER(4) NOT NULL,
licence VARCHAR2(10) NOT NULL,
type VARCHAR2(15) NOT NULL,
model VARCHAR2(15) NULL,
colour VARCHAR2(15) DEFAULT 'WHITE',
purchase_price NUMBER(7,2) NULL,
purchase_date DATE NOT NULL,
department_id NUMBER(3)
);

-- View als Teilmenge der eigentlich Tabelle erstellen 
CREATE VIEW employeesView AS
SELECT first_name, last_name, email, phone_number
FROM oehr_employees;

select * from employeesView;

CREATE OR REPLACE VIEW employeesView AS
SELECT first_name, last_name, email, phone_number
FROM oehr_employees
WHERE department_id=60;

-- Synonym 
CREATE SYNONYM employees FOR oehr_employees;
CREATE SYNONYM mitarbeiter FOR employees;

select * 
from oehr_employees;
select * 
from employees