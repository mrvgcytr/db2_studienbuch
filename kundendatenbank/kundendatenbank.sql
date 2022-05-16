CREATE DATABASE IF NOT EXISTS Kundendatenbank;

--
-- Create Tables
--

CREATE TABLE IF NOT EXISTS  Kundendatenbank.Kunde (
    kunden_ID	int     NOT NULL,
    name		text	NOT NULL,
    telefon		text    NOT NULL,
    fax			text    NULL,
    email		text    NULL
);

CREATE TABLE IF NOT EXISTS Kundendatenbank.Anfrage (
    anfrage_ID  int(11)                                         NOT NULL,
    datum       date                                            NOT NULL,
    produkt     text CHARACTER SET utf8 COLLATE utf8_german2_ci NOT NULL, 
    bearbeiter  text CHARACTER SET utf8 COLLATE utf8_german2_ci NOT NULL, 
    kunden_ID   int(11)                                         NOT NULL, 
    inhalt      text CHARACTER SET utf8 COLLATE utf8_german2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS  Kundendatenbank.News (
    news_ID	    int                                                 NOT NULL    AUTO_INCREMENT ,
    titel		text CHARACTER SET utf16 COLLATE utf16_german2_ci 	NOT NULL,
    vorspann	text CHARACTER SET utf16 COLLATE utf16_german2_ci    NULL,
    inhalt		text CHARACTER SET utf16 COLLATE utf16_german2_ci    NULL,
    ort 		text CHARACTER SET utf16 COLLATE utf16_german2_ci    NULL,
    datum 		date                                                NULL,
    autor 		text CHARACTER SET utf16 COLLATE utf16_german2_ci    NULL,
    PRIMARY KEY (news_ID)
);
--
-- Add Indices 
--

ALTER TABLE Kundendatenbank.Kunde
    ADD PRIMARY KEY (kunden_ID);

ALTER TABLE Kundendatenbank.Anfrage
    ADD PRIMARY KEY (anfrage_ID);
 
--
-- Add Data to Table
--
INSERT INTO Kundendatenbank.Kunde VALUES 
	(1, 'C&A', '02349 345', '02349 345', 'Beck@C&A.de'),
	(2, 'EShop', '02351 357', '02351 357', 'E@Eshop.de'),
	(3, 'Kamps', '0231 222', '0231 222', 'FK@Kamps.de');


INSERT INTO Kundendatenbank.Anfrage (anfrage_ID, datum, produkt, bearbeiter, kunden_ID, inhalt) VALUES 
    (1, '2006-03-22', 'Laserdrucker', 'Felix Meier', 2, ''),
    (2, '2006-03-24', 'PC-Tisch', 'Fritz Müller', 2, ''),
    (3, '2006-03-10', 'PC-Tisch', 'Karl Meier', 1, '');

    
INSERT INTO Kundendatenbank.News (titel, vorspann, inhalt, ort, datum, autor) VALUES 
    ('Neuer Mitarbeiter im Vertrieb', 'Sales Europe', 'Ab September blablabla', 'München', '2019-08-28', 'F. Meier'),
    ('Neuer Schüler in der Klasse', 'Klasse 8a', 'Nach den Pfingstferien blabla', 'Stuttgart', '2022-05-28', 'P. Müller'),
    ('Gutes Wetter im Anmarsch', 'Es wird sommerlich', 'Nices Wetter bals blabla', 'Köln', '2022-05-20', 'K. Walter');