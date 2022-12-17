CREATE PROCEDURE deleteCar
    (aCar_ID cars.car_ID%type )
IS
BEGIN
    DELETE FROM cars
    WHERE car_id = aCar_ID;
END deleteCar;

begin
deleteCar(1);
end

---------------------------------------------

CREATE OR REPLACE PROCEDURE deleteCar
    (aCar_ID cars.car_ID%type)
IS
BEGIN
    -- zu löschendes Car ins Archiv hinzufügen
    INSERT INTO car_archives
    (
        SELECT * FROM cars
        WHERE car_id = aCar_ID
    );
    -- Löschen des Datensatzes 
    DELETE FROM cars
    WHERE car_id = aCar_ID;

END deleteCar;

------------------------------------------

CREATE OR REPLACE FUNCTION nextCar_ID
RETURN number IS
    maxCar_ID number;
BEGIN
    SELECT max(car_ID) INTO maxCar_ID
    FROM CARS;
    RETURN (maxCar_ID + 1) ;
END nextCar_ID;

-- Aufruf der Funktion
begin
    dbms_output.put_line( 'Next free car ID: ' || nextCar_ID());
end

INSERT INTO cars VALUES (nextCar_ID(),'UN-VW-4200',
'VW','New Beetle','blue',12000,sysdate,60);

---------------------------------------------

SELECT * 
FROM USER_SOURCE
WHERE NAME like 'DELETECAR'