SELECT bestellungen_nf3.b_ID, kunden_nf3.vorname, kunden_nf3.nachname, kunden_nf3.straße, kunden_nf3.hausnummer, 
kunden_nf3.plz, stadt_nf3.stadt, kunden_nf3.email, kunden_nf3.tel
FROM bestellungen_nf3, kunden_nf3, stadt_nf3
WHERE bestellungen_nf3.k_ID=kunden_nf3.k_ID 
AND kunden_nf3.plz = stadt_nf3.plz;

SELECT produkte_nf3.bezeichnung, produktezurbestellung_nf3.menge
FROM produktezurbestellung_nf3, bestellungen_nf3, produkte_nf3
WHERE bestellungen_nf3.b_ID = produktezurbestellung_nf3.b_ID
AND produktezurbestellung_nf3.p_ID = produkte_nf3.p_ID;

SELECT bestellungen_nf3.b_ID, kunden_nf3.vorname, kunden_nf3.nachname, kunden_nf3.straße, kunden_nf3.hausnummer, kunden_nf3.plz, stadt_nf3.stadt, kunden_nf3.email, kunden_nf3.tel, produkte_nf3.bezeichnung, produkte_nf3.epreis, produktezurbestellung_nf3.menge, produkte_nf3.epreis * produktezurbestellung_nf3.menge AS zwPreis
FROM bestellungen_nf3, kunden_nf3, stadt_nf3, produktezurbestellung_nf3, produkte_nf3
WHERE bestellungen_nf3.k_ID=kunden_nf3.k_ID 
AND kunden_nf3.plz = stadt_nf3.plz
AND  bestellungen_nf3.b_ID = produktezurbestellung_nf3.b_ID
AND produktezurbestellung_nf3.p_ID = produkte_nf3.p_ID
ORDER BY bestellungen_nf3.b_ID ASC;

SELECT bestellungen_nf3.b_ID, produkte_nf3.bezeichnung, produkte_nf3.epreis, produktezurbestellung_nf3.menge, produkte_nf3.epreis * produktezurbestellung_nf3.menge AS zwPreis
FROM bestellungen_nf3, produktezurbestellung_nf3, produkte_nf3
WHERE bestellungen_nf3.b_ID = produktezurbestellung_nf3.b_ID
AND produktezurbestellung_nf3.p_ID = produkte_nf3.p_ID
ORDER BY bestellungen_nf3.b_ID ASC;

SELECT bestellungen_nf3.b_ID, SUM(produkte_nf3.epreis * produktezurbestellung_nf3.menge)
FROM bestellungen_nf3, produktezurbestellung_nf3, produkte_nf3
WHERE bestellungen_nf3.b_ID = produktezurbestellung_nf3.b_ID
AND produktezurbestellung_nf3.p_ID = produkte_nf3.p_ID
GROUP BY bestellungen_nf3.b_ID
ORDER BY bestellungen_nf3.b_ID ASC;

SELECT kunden_nf3.k_ID, kunden_nf3.vorname, kunden_nf3.straße, kunden_nf3.hausnummer, kunden_nf3.plz, stadt_nf3.stadt, kunden_nf3.email FROM kunden_nf3, stadt_nf3 WHERE kunden_nf3.plz = stadt_nf3.plz ORDER BY k_ID ASC;