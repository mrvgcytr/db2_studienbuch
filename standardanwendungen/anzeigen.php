<?php
function anzeigen($k, $v, $t, $p)
{
    include("./buttons.php");
    include("../shared/bibliothek.php");

    //Anzeige aller Attribute eines Datensatzes 
    //$k Name des Schlüssels
    //$v Wert des Schlüssels
    //$t Name der Tabelle
    // $p Anzeigemodus  (0 anzeigen 1 bearbeiten)
    //                  (2 löschen 3 einfügen )
    switch ($p) {
        case "0":
            echo "<h2>Anzeige der einzelnen Objekte</h2>";
            break;
        case "1":
            echo "<h2>Bitte geben Sie Änderungen ein</h2>
                <form method=post action=\"bearbeiten.php\">";
            break;
        case "2":
            echo "<h2>Wollen Sie das angezeigte
                Objekt wirklich löschen?</h2>";
            break;
        case "3":
            echo "<h2>Geben Sie bitte die Werte ein </h2>
                <form method=post action=\"einfuegen.php\">";
            break;
        default:
            echo "Fehler bei der Anzeige<BR>";
    }

    //Hidden Fields
    echo "
    <input type=\"hidden\"value=\"" . $t . "\"name=\"t\"/> 
    <input type=\"hidden\"value=\"" . $k . "\"name=\"k\"/>
    <input type=\"hidden\"value=\"" . $v . "\"name=\"v\"/>
    ";

    // SQL Befehl liefert Beschreibung über die Spalten der Tabelle 
    $sql = "describe " . $t;

    //Abarbeitung der Anfrage der Metadaten, also der Spalten & Eigenschaften
    $des = $verbindung->query($sql) or
        die("Konnte die Abfrage nicht ausfuehren");

    //Anzahl der Sätze in $des gleich Anzahl Spalten
    $anzSpalten = $des->num_rows;

    // Datensatz mit Parametern abrufen
    $sql = "select * from " . $t . " where " . $k . "=" . $v;

    //Abarbeitung der Anfrage 
    $res = $verbindung->query($sql) or
        die("Konnte die Abfrage nicht ausfuehren");

    //Abarbeitung des Resultats
    echo "<table>";
    if ($res) $arr = $res->fetch_row();

    for ($i = 0; $i < $anzSpalten; $i++) {
        //Ermittlung des Spaltennamens
        $fn = $des->fetch_row();
        echo "<tr>";
        echo "<td>";
        // Ausgabe der Spaltenbezeichnung mit Großbuchstabe
        echo ucfirst($fn[0]) . ": </td>";
        echo "<td>";
        //Ausgabe des Spaltentyps, 
        //Ausgabe erfolgt unterschiedlich je nach Typ
        switch ($fn[1]) {
            case "date":
                echo "<input type=\"text\"";
                echo "name=\"fv" . $i . "\" value=\"";
                if ($p == 3)  echo date("Y-m-d");
                else        echo $arr[$i];
                echo "\"/> (JJJJ-MM-TT)";
                break;
            case "text":
                echo "<textarea rows=2 cols=30 ";
                echo "name=\"fv" . $i . "\">";
                if ($p < 3)   echo $arr[$i];
                echo "</textarea>";
                break;
            default:
                echo "<input type=\"text\" ";
                echo "name=\"fv" . $i . "\" value=\"";
                if ($p < 3) echo $arr[$i];
                echo "\"/>";
        }

        echo "</td>";
        echo "</tr>";
    }
    echo "</table><br>";

    // Ausgabe der Buttons 
    zurueckButton($t);
    if ($p == 1) aendernButton();
    if ($p == 2) loeschButton($t, $k, $v);
    if ($p == 3) einfuegeButton();

    echo "</form>";
}

$k = @$_GET['key'];
$v = @$_GET['kv'];
$t = @$_GET['t'];
$p = @$_GET['p'];
anzeigen($k, $v, $t, $p);
