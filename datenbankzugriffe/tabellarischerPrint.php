<?php

include("../shared/bibliothek.php");

// Erzeugung des Objektes $d der Klasse mysqli 
$d = new mysqli($host, $user, $pw, $database);

// Abfrage speichern 
$sql = "select name, telefon, email from kunde";

// Abfrage ausführen
echo "<h1>In der Datenbank hinterlegte Kunden: </h1>";
$result = $d->query($sql);
ausgabeTabelle($result);

// Abfrage speichern 
$sqlModifiedHeader = "  select  kunden_ID   \"Nr.\",
                                name        \"Kunde\", 
                                telefon     \"Tel.\", 
                                email 
                        from kunde";

// Abfrage ausführen
$result = $d->query($sqlModifiedHeader);
ausgabeTabelle($result);
echo "<br><br><h1>Modifizierte Spaltenüberschriften: </h1>";
