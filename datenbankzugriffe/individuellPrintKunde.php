<?php

$host = "localhost";
$database = "kundendatenbank";
$user = "root";
$pw = "";

// Erzeugung des Objektes $d der Klasse mysqli 
$d = new mysqli($host, $user, $pw, $database);

// Abfrage speichern 
$sql = "select name, telefon, email from kunde";

// Abfrage ausführen
$result = $d->query($sql);

// Ergebnisse ausgeben
//Ausgabe der Ueberschrift 
echo "  Kunde --- Telefon --- email     <br>\n";
echo "----------------------------------<br>\n";

//Ausgabe der Datensätze
while ($datensatz = $result->fetch_assoc()) {
    echo "  $datensatz[name]   ---
        $datensatz[telefon]    ---
        $datensatz[email]      <br>\n";
}
