-- Anlegen des Statement-Triggers
CREATE OR REPLACE TRIGGER cars_ins_tr
AFTER insert ON cars
DECLARE
    sid integer;
    anz_c integer;
BEGIN
    SELECT (COUNT(*)+1) INTO sid FROM cars_statistik;
    SELECT COUNT(*) INTO anz_c FROM cars;
    INSERT INTO cars_statistik
    VALUES (sid, sysdate, anz_c);
END;

-- -- Einfügen einer Zeile in die Tabelle cars
-- INSERT INTO cars (car_id, licence, type, purchase_date)
-- VALUES(1, 'ES-GS 1905', 'Combi', '01.DEZ.2022');

-- SELECT * 
-- FROM cars;

-- SELECT *
-- FROM cars_statistik;

----------------------------------------

-- Anlegen des Statement-Triggers
CREATE OR REPLACE TRIGGER cars_del_tr
AFTER DELETE ON cars
DECLARE
    sid integer;
    anz_c integer;
BEGIN
    SELECT (COUNT(*)+1) INTO sid FROM cars_statistik;
    SELECT COUNT(*) INTO anz_c FROM cars;
    INSERT INTO cars_statistik
    VALUES (sid, sysdate, anz_c);
END;

-- -- Löschen einer Zeile in die Tabelle cars
-- DELETE FROM cars 
-- WHERE car_id=
--      (SELECt car_id
--      FROM cars
--      FETCH FIRST 1 ROWS ONLY)

-- SELECT * 
-- FROM cars;

-- SELECT *
-- FROM cars_statistik;

----------------------------------------------

