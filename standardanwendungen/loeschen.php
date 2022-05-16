<?php

include("./buttons.php");
include("../shared/bibliothek.php");

$k = $_GET['k'];
$v = $_GET['v'];
$t = $_GET['t'];

$sql = "delete from " . $t . " where " . $k . "=" . $v;

//Abarbeitung der Anfrage 
$res = $verbindung->query($sql) or
    die("Konnte das Löschen nicht ausfuehren");

if ($res) {
    echo "<h2> Der Datensatz wurde gelöscht </h2>";
}

zurueckButton($t);
