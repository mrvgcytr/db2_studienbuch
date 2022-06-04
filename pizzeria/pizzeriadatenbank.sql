CREATE DATABASE IF NOT EXISTS Pizzeria;

--
-- NF0
-- 
CREATE TABLE IF NOT EXISTS pizzeria.bestellungen_nf0(
    b_ID        INT(11) NOT NULL AUTO_INCREMENT,
    k_ID        INT(11) NOT NULL,
    name        TEXT CHARACTER SET utf8 COLLATE utf8_german2_ci NOT NULL,
    adresse     TEXT CHARACTER SET utf8 COLLATE utf8_german2_ci NOT NULL,
    tel         TEXT CHARACTER SET utf8 COLLATE utf8_german2_ci NOT NULL,
    email       TEXT CHARACTER SET utf8 COLLATE utf8_german2_ci NOT NULL,
    p_ID        TEXT CHARACTER SET utf8 COLLATE utf8_german2_ci NOT NULL,
    bezeichnung TEXT CHARACTER SET utf8 COLLATE utf8_german2_ci NOT NULL,
    epreis      TEXT CHARACTER SET utf8 COLLATE utf8_german2_ci NOT NULL,
    gpreis      DECIMAL NOT NULL, 
    PRIMARY KEY (b_ID)
); 

INSERT INTO pizzeria.bestellungen_nf0(b_ID, k_ID, name, adresse, tel, email, 
    p_ID, bezeichnung, epreis, gpreis) VALUES 
    ('1','1','Max Müller','Jahn-Straße 12 70376 Stuttgart','0711123456','max@mueller.de','1,2,5','Margeritha, Dönerpizza, Cola','6, 8, 3','17'),
    ('2','2','Philip Neumann','Heilbachstraße 2 70372 Stuttgart','','pilo@neumann.de','1,3','Margeritha,Thunfischpizza','6, 8','14'),
    ('3','1','Max Müller','Jahn-Straße 12 70376 Stuttgart','0711123456','max@mueller.de','4,5','Sucukpizza,Cola','8, 3','11'),
    ('4','3','Vanessa Schmidt','Henriettenstr. 38 73732 Esslingen','','vani@esslingen.de','1,4,6','Margeritha,Sucukpizza,Ayran','6,8, 2','16');


-- 
-- NF1
-- 
CREATE TABLE IF NOT EXISTS pizzeria.bestellungen_nf1(
    b_ID        INT(11) NOT NULL AUTO_INCREMENT,
    k_ID        INT(11) NOT NULL,
    vorname     TEXT CHARACTER SET utf8 COLLATE utf8_german2_ci NOT NULL,
    nachname    TEXT CHARACTER SET utf8 COLLATE utf8_german2_ci NOT NULL,
    straße      TEXT CHARACTER SET utf8 COLLATE utf8_german2_ci NOT NULL,
    hausnummer  INT(11) NOT NULL,
    plz         INT(11) NOT NULL,
    stadt       TEXT CHARACTER SET utf8 COLLATE utf8_german2_ci NOT NULL,
    tel         TEXT CHARACTER SET utf8 COLLATE utf8_german2_ci NOT NULL,
    email       TEXT CHARACTER SET utf8 COLLATE utf8_german2_ci NOT NULL,
    p_ID        TEXT CHARACTER SET utf8 COLLATE utf8_german2_ci NOT NULL,
    bezeichnung TEXT CHARACTER SET utf8 COLLATE utf8_german2_ci NOT NULL,
    epreis      TEXT CHARACTER SET utf8 COLLATE utf8_german2_ci NOT NULL,
    gpreis      DECIMAL NOT NULL, 
    PRIMARY KEY (b_ID)
); 

INSERT INTO pizzeria.bestellungen_nf1(b_ID, k_ID, vorname, nachname, straße, 
    hausnummer, plz, stadt, tel, email, p_ID, bezeichnung, epreis, gpreis) VALUES 
    ('1','1','Max','Müller','Jahn-Straße','12', '70376', 'Stuttgart','0711123456','max@mueller.de','1','Margeritha','6','17'),
    ('12','1','Max','Müller','Jahn-Straße','12', '70376', 'Stuttgart','0711123456','max@mueller.de','2','Dönerpizza','8','17'),
    ('13','1','Max','Müller','Jahn-Straße','12', '70376', 'Stuttgart','0711123456','max@mueller.de','5','Cola','3','17'),
    ('2','2','Philip','Neumann','Heilbachstraße', '2', '70372', 'Stuttgart','','pilo@neumann.de','1','Margeritha','6','14'),
    ('22','2','Philip','Neumann','Heilbachstraße', '2', '70372', 'Stuttgart','','pilo@neumann.de','3','Thunfischpizza','8','14'),
    ('3','1','Max','Müller','Jahn-Straße', '12', '70376', 'Stuttgart','0711123456','max@mueller.de','4','Sucukpizza','8','11'),
    ('32','1','Max','Müller','Jahn-Straße', '12', '70376', 'Stuttgart','0711123456','max@mueller.de','5','Cola','3','11'),
    ('4','3','Vanessa','Schmidt','Henriettenstr.', '38', '73732', 'Esslingen','','vani@esslingen.de','1','Margeritha','6','16'),
    ('42','3','Vanessa','Schmidt','Henriettenstr.', '38', '73732', 'Esslingen','','vani@esslingen.de','4','Sucukpizza','8','16'),
    ('43','3','Vanessa','Schmidt','Henriettenstr.', '38', '73732', 'Esslingen','','vani@esslingen.de','6','Ayran','2','16');


-- 
-- NF2
-- 
CREATE TABLE IF NOT EXISTS pizzeria.kunden_nf2(
    k_ID        INT(11) NOT NULL AUTO_INCREMENT,
    vorname     TEXT CHARACTER SET utf8 COLLATE utf8_german2_ci NOT NULL,
    nachname    TEXT CHARACTER SET utf8 COLLATE utf8_german2_ci NOT NULL,
    straße      TEXT CHARACTER SET utf8 COLLATE utf8_german2_ci NOT NULL,
    hausnummer  INT(11) NOT NULL,
    plz         INT(11) NOT NULL,
    stadt       TEXT CHARACTER SET utf8 COLLATE utf8_german2_ci NOT NULL,
    tel         TEXT CHARACTER SET utf8 COLLATE utf8_german2_ci NOT NULL,
    email       TEXT CHARACTER SET utf8 COLLATE utf8_german2_ci NOT NULL,
    PRIMARY KEY (k_ID)
); 

CREATE TABLE IF NOT EXISTS pizzeria.produkte_nf2(
    p_ID        INT(11) NOT NULL AUTO_INCREMENT,
    bezeichnung TEXT CHARACTER SET utf8 COLLATE utf8_german2_ci NOT NULL,
    epreis      DECIMAL NOT NULL,
    PRIMARY KEY (p_ID)
); 

CREATE TABLE IF NOT EXISTS pizzeria.bestellungen_nf2(
    b_ID        INT(11) NOT NULL AUTO_INCREMENT,
    k_ID        INT(11) NOT NULL,
    gpreis      DECIMAL NOT NULL, 
    PRIMARY KEY (b_ID),
    FOREIGN KEY (k_ID) REFERENCES kunden_nf2(k_ID)
); 

CREATE TABLE IF NOT EXISTS pizzeria.produktezurbestellung_nf2(
    pb_ID       INT(11) NOT NULL AUTO_INCREMENT,
    b_ID        INT(11) NOT NULL,
    p_ID        INT(11) NOT NULL,
    menge       INT(11) NOT NULL,
    PRIMARY KEY (pb_ID),
    FOREIGN KEY (b_ID) REFERENCES bestellungen_nf2(b_ID),
    FOREIGN KEY (p_ID) REFERENCES produkte_nf2(p_ID)
); 


INSERT INTO pizzeria.kunden_nf2( vorname, nachname, straße, 
    hausnummer, plz, stadt, tel, email) VALUES 
    ('Max','Müller','Jahn-Straße','12', '70376', 'Stuttgart','0711123456','max@mueller.de'),
    ('Philip','Neumann','Heilbachstraße', '2', '70372', 'Stuttgart','','pilo@neumann.de'),
    ('Vanessa','Schmidt','Henriettenstr.', '38', '73732', 'Esslingen','','vani@esslingen.de');

INSERT INTO pizzeria.produkte_nf2( bezeichnung, epreis) VALUES 
    ('Margeritha','6'),
    ('Dönerpizza','8'),
    ('Thunfischpizza','8'),
    ('Sucukpizza','8'),
    ('Cola','3'),
    ('Ayran','2');

INSERT INTO pizzeria.bestellungen_nf2(k_ID, gpreis) VALUES 
    ('1','17'),
    ('2','14'),
    ('1','11'),
    ('3','16');
    
INSERT INTO pizzeria.produktezurbestellung_nf2(b_ID, p_ID, menge) VALUES 
    ('1','1','1'),
    ('1','2','1'),
    ('1','5','1'),
    ('2','1','1'),
    ('2','3','1'),
    ('3','4','1'),
    ('3','5','1'),
    ('4','1','1'),
    ('4','4','1'),
    ('4','6','1');

-- 
-- NF3
-- 
CREATE TABLE IF NOT EXISTS pizzeria.stadt_nf3(
    plz         INT(11) NOT NULL,
    stadt       TEXT CHARACTER SET utf8 COLLATE utf8_german2_ci NOT NULL,
    PRIMARY KEY (plz)
); 

CREATE TABLE IF NOT EXISTS pizzeria.kunden_nf3(
    k_ID        INT(11) NOT NULL AUTO_INCREMENT,
    vorname     TEXT CHARACTER SET utf8 COLLATE utf8_german2_ci NOT NULL,
    nachname    TEXT CHARACTER SET utf8 COLLATE utf8_german2_ci NOT NULL,
    straße      TEXT CHARACTER SET utf8 COLLATE utf8_german2_ci NOT NULL,
    hausnummer  INT(11) NOT NULL,
    plz         INT(11) NOT NULL,
    tel         TEXT CHARACTER SET utf8 COLLATE utf8_german2_ci NOT NULL,
    email       TEXT CHARACTER SET utf8 COLLATE utf8_german2_ci NOT NULL,
    PRIMARY KEY (k_ID), 
    FOREIGN KEY (plz) REFERENCES stadt_nf3(plz)
); 

CREATE TABLE IF NOT EXISTS pizzeria.produkte_nf3(
    p_ID        INT(11) NOT NULL AUTO_INCREMENT,
    bezeichnung TEXT CHARACTER SET utf8 COLLATE utf8_german2_ci NOT NULL,
    epreis      DECIMAL NOT NULL,
    PRIMARY KEY (p_ID)
); 

CREATE TABLE IF NOT EXISTS pizzeria.bestellungen_nf3(
    b_ID        INT(11) NOT NULL AUTO_INCREMENT,
    k_ID        INT(11) NOT NULL,
    gpreis      DECIMAL NOT NULL, 
    PRIMARY KEY (b_ID),
    FOREIGN KEY (k_ID) REFERENCES kunden_nf3(k_ID)
); 

CREATE TABLE IF NOT EXISTS pizzeria.produktezurbestellung_nf3(
    pb_ID       INT(11) NOT NULL AUTO_INCREMENT,
    b_ID        INT(11) NOT NULL,
    p_ID        INT(11) NOT NULL,
    menge       INT(11) NOT NULL,
    PRIMARY KEY (pb_ID),
    FOREIGN KEY (b_ID) REFERENCES bestellungen_nf3(b_ID),
    FOREIGN KEY (p_ID) REFERENCES produkte_nf3(p_ID)
); 

INSERT INTO pizzeria.stadt_nf3(plz, stadt) VALUES 
    ('70376', 'Stuttgart'),
    ('70372', 'Stuttgart'),
    ('73732', 'Esslingen');

INSERT INTO pizzeria.kunden_nf3( vorname, nachname, straße, 
    hausnummer, plz, tel, email) VALUES 
    ('Max','Müller','Jahn-Straße','12', '70376', '0711123456','max@mueller.de'),
    ('Philip','Neumann','Heilbachstraße', '2', '70372','','pilo@neumann.de'),
    ('Vanessa','Schmidt','Henriettenstr.', '38', '73732','','vani@esslingen.de');

INSERT INTO pizzeria.produkte_nf3( bezeichnung, epreis) VALUES 
    ('Margeritha','6'),
    ('Dönerpizza','8'),
    ('Thunfischpizza','8'),
    ('Sucukpizza','8'),
    ('Cola','3'),
    ('Ayran','2');

INSERT INTO pizzeria.bestellungen_nf3(k_ID, gpreis) VALUES 
    ('1','17'),
    ('2','14'),
    ('1','11'),
    ('3','16');
    
INSERT INTO pizzeria.produktezurbestellung_nf3(b_ID, p_ID, menge) VALUES 
    ('1','1','1'),
    ('1','2','1'),
    ('1','5','1'),
    ('2','1','1'),
    ('2','3','1'),
    ('1','4','1'),
    ('1','5','1'),
    ('3','1','1'),
    ('3','4','1'),
    ('3','6','1');
