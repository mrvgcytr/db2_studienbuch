<?php 

$host = "localhost";
$database = "kundendatenbank";
$user = "root";
$pw = "";

function ausgabeTabelle($res)
{
    //Das Resultat der Datenbankabfrage wird 
    //in Form einer Tabelle angezeigt

    //Ausgabe des Tabellen Tags 
    echo "<table>\n";

    //Tabellenüberschriften
    $header = $res->fetch_fields();
    echo "<thr>\n";
    foreach ($header as $h) {
        echo "<th>" . $h->name . "</th>\n";
    }
    echo "</thr>";

    while ($arr = $res->fetch_row()) {
        echo "<tr>\n";
        //Ausgabe der Tabellenzeile 
        foreach ($arr as $zelle) {
            echo "<td>" . $zelle . "</td>\n";
        }
        // Tabellenzeile abschließen echo "</tr>\n";

    }
}
