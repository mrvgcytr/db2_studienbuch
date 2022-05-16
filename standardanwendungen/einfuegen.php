<?php

include("./buttons.php");
include("../shared/bibliothek.php");
$t = @$_POST['t'];
var_dump($t);

//Holen der Metadaten
$sql = "describe " . $t;
$des = $verbindung->query($sql) or
    die("Konnte die Abfrage nicht ausfuehren");

//Zusammenbau des Inserts
$sql = "insert into " . $t . " ( ";
$i = 0;
while ($arr = $des->fetch_row()) {
    //Ermittlung des Spaltennamens
    $value[$i] = $_POST["fv" . $i];
    if ($i > 0) $sql .= ", ";
    $sql .= $arr[0];
    $i++;
}

$sql .= ") values (";

for ($j = 0; $j < $i; $j++) {
    if ($j > 0) $sql .= ",";
    $sql .= "'" . $value[$j] . "'";
}

$sql .= ")";

//Abarbeitung der Anfrage
$res = $verbindung->query($sql);

if ($res) {
    echo "<h2> Der Datensatz wurde eingefügt </h2>";
} else {
    echo "<h2> Der Datensatz konnte nicht eingefügt werden </h2>";
}

zurueckButton($t);
