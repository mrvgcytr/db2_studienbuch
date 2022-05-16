<?php

include("./buttons.php");
include("../shared/bibliothek.php");
$k = @$_POST['k'];
$v = @$_POST['v'];
$t = @$_POST['t'];

//Holen der Metadaten
$sql = "describe " . $t;

$des = $verbindung->query($sql) or
    die("Konnte die Abfrage nicht ausfuehren");

//Zusammenbau des Updates
$sql = "update " . $t . " set ";
$i = 0;
while ($arr = $des->fetch_row()) {
    //Ermittlung des Spaltennamens, dann Spaltentyps
    $value = $_POST["fv" . $i];
    if ($i > 0) $sql .= ", ";
    $sql .= $arr[0] . "='" . $value . "' ";
    $i++;
}
$sql .= " where " . $k . "=" . $v;

//Abarbeitung der Anfrage 
$res = $verbindung->query($sql);
if ($res) {
    echo "<h2> Der Datensatz wurde geändert </h2>";
} else {
    echo "<h2> Der Datensatz konnte nicht geändert werden</h2>";
}

zurueckButton($t);
