DROP TABLE quadrat;

-- Anlegen einer Tabelle zur
-- Abspeicherung der Quadratzahlen
CREATE TABLE quadrat (
n int,
nquadrat int );
DECLARE
-- Variablendeklaration
nmax CONSTANT INT:=100;
i INT:= 1;
BEGIN
-- Anfang des ausführbaren Abschnitts
-- Durchlaufen der Schleife zum Anlegen der Sätze
FOR i IN 1..nmax LOOP
INSERT INTO quadrat
(n , nquadrat)
VALUES
(i , i*i);
END LOOP;
COMMIT;
END;
-- Ende des ausführbaren Abschnitts

--------------------------------------

DROP TABLE sitzplan;

-- Neuanlegen der Tabelle sitzplan mit Primärschlüssel
CREATE TABLE sitzplan (
    platz_id NUMBER NOT NULL,
    kategorie VARCHAR2(20) NOT NULL,
    CONSTRAINT PK_sitzplan
    PRIMARY KEY (platz_id)
);

DECLARE
    i POSITIVE := 1;
    max_loops CONSTANT POSITIVE := 10;
BEGIN
    LOOP
        EXIT WHEN i > max_loops;
        dbms_output.put_line( 'Inside loop, round: ' || i )  ;
        INSERT INTO sitzplan -- Einfügen
        (platz_id, kategorie)
        VALUES (i, 'Erste Klasse'); -- neuer locations
        i := i+1;
    END LOOP;
END;


---------------------------

DROP TABLE sitzplan;

-- Neuanlegen der Tabelle sitzplan mit Primärschlüssel
CREATE TABLE sitzplan (
    platz_id NUMBER NOT NULL,
    kategorie VARCHAR2(20) NOT NULL,
    CONSTRAINT PK_sitzplan
    PRIMARY KEY (platz_id)
);

DECLARE
    i POSITIVE := 1;
    max_loops CONSTANT POSITIVE := 10;
BEGIN
    WHILE i<=max_loops LOOP
        dbms_output.put_line( 'Inside loop, round: ' || i )  ;
        INSERT INTO sitzplan -- Einfügen
        (platz_id, kategorie)
        VALUES (i, 'Zweite Klasse'); -- neuer locations
        i := i+1;
    END LOOP;
END;

--------------------------------

DROP TABLE sitzplan;

-- Neuanlegen der Tabelle sitzplan mit Primärschlüssel
CREATE TABLE sitzplan (
    platz_id NUMBER NOT NULL,
    kategorie VARCHAR2(20) NOT NULL,
    CONSTRAINT PK_sitzplan
    PRIMARY KEY (platz_id)
);

DECLARE
    i int:=1;
BEGIN
    IF (i>10) THEN
        NULL;
    ELSE
        dbms_output.put_line( 'Inside loop, round: ' || i )  ;
        INSERT INTO sitzplan -- Einfügen
        (platz_id, kategorie)
        VALUES (i, 'Dritte Klasse'); -- neuer locations
        i := i+1;
    END IF; 
END;


-----------------------

DROP TABLE sitzplan;

-- Neuanlegen der Tabelle sitzplan mit Primärschlüssel
CREATE TABLE sitzplan (
    platz_id NUMBER NOT NULL,
    kategorie VARCHAR2(20) NOT NULL,
    CONSTRAINT PK_sitzplan
    PRIMARY KEY (platz_id)
);

DECLARE
    i POSITIVE := 1;
    max_loops CONSTANT POSITIVE := 10;
BEGIN
    FOR i IN 1..max_loops LOOP
        dbms_output.put_line( 'Inside loop, round: ' || i )  ;
        INSERT INTO sitzplan -- Einfügen
        (platz_id, kategorie)
        VALUES (i, 'Dritte Klasse'); -- neuer locations
    END LOOP;
END;


---------------------------------- 

DECLARE 
   c_id customers.id%type; 
   c_name customers.name%type; 
   c_age customers.age%type;
   c_addr customers.address%type; 
   CURSOR c_customers is 
      SELECT id, name, age, address FROM customers; 
BEGIN 
   OPEN c_customers; 
   
   WHILE c_customers%found LOOP
   FETCH c_customers into c_id, c_name, c_age, c_addr; 
        IF c_customers%rowcount <6 THEN 
            dbms_output.put_line(c_id || ' ' || c_name || ' ' || c_addr); 
            INSERT INTO customers (id, name, age, address)
            VALUES (c_id+210, c_name || ' Clone', c_age, c_addr);
        END IF;
   END LOOP; 
   CLOSE c_customers; 
END; 

------------------------------------------

DECLARE 
    i INT := 1;
    CURSOR c_customers IS 
      SELECT * FROM customers; 
    c_value c_customers%ROWTYPE;
BEGIN 
    FOR c_value IN c_customers LOOP
        IF c_customers%rowcount <6 THEN 
            dbms_output.put_line('In the loop'); 
            UPDATE  customers
            SET     age=100
            WHERE   name LIKE '%k';
            i:=i+1;            
        END IF;
    END LOOP; 
    dbms_output.put_line('End of loop'); 
END; 

------------------

CREATE OR REPLACE SYNONYM employees FOR oehr_employees;

DROP TABLE resultat;

CREATE TABLE resultat (
    employee_id number(5),
    name varchar2(30) 
) ;

DECLARE
    name employees.last_name%TYPE;
    ind int :=0;
    anz int :=0;
BEGIN
    FOR ind in 1..9999 LOOP
        SELECT count(*) INTO anz FROM employees
        WHERE ind=employee_id;

        IF anz=1 then
            SELECT last_name INTO name
            FROM employees 
            WHERE employee_id=ind;
        ELSE
            name := NULL;
        END IF;

        INSERT INTO resultat
        VALUES (ind,name);
    END LOOP;
END;

-----------------------