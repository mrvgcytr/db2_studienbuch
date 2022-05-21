<?php

// Erzeugung des Objektes $db der Klasse mysqli
$db = new
    mysqli('localhost', 'root', '', 'kundendatenbank');

// Abfrage ausführen
$sql = 'SELECT * FROM kunde';
$result = $db->query($sql);
// Ergebnisse ausgeben
print_r($result);
$datensatz = $result->fetch_assoc();
echo "<pre>"; //element is displayed in a fixed-width font,
print_r($datensatz);
$datensatz = $result->fetch_assoc();
print_r($datensatz);
echo "</pre>";
