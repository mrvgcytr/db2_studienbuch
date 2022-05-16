UPDATE Kunde 
SET email='Einkauf@EShop.de'
WHERE kunden_ID=2;

DELETE FROM Kunde 
WHERE kunden_ID=3;

SELECT *
FROM Kunde;

SELECT kunden_ID, name, email
FROM Kunde;

SELECT *
FROM Kunde 
WHERE kunden_ID=3;

SELECT kunden_ID, name, email
FROM Kunde 
WHERE kunden_ID<5 AND name LIKE 'A%';

SELECT Kunde.kunden_ID, Kunde.name, Anfrage.anfrage_ID, Anfrage.datum, Anfrage.kunden_ID
FROM Kunde, Anfrage;

SELECT Kunde.kunden_ID, Kunde.name, Anfrage.anfrage_ID, Anfrage.datum, Anfrage.kunden_ID
FROM Kunde, Anfrage
WHERE Kunde.kunden_ID = Anfrage.kunden_ID;