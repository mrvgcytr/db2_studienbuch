<?php

function ausgabeliste($sql, $tab, $key, $e)
{
    include("../shared/bibliothek.php");
    $sel = "Select " . $key . ",";
    $sql = str_ireplace("Select ", $sel, $sql);
    // --> Ergebnis vom Aufruf auf SB K81.1 S. 124: 
    //"Select kunden_id,kunden_id "Nr.", name "Name", Telefon "Tel. ", email "Email" from Kunde order by name"

    //Abarbeitung der Anfrage
    $res = $verbindung->query($sql) or
        die("Konnte die Abfrage nicht ausfuehren");

    //Abarbeitung des Resultats 
    echo "<table cellspacing-1";
    echo "cellpadding-1 >\n";
    echo "<thr>\n";

    //Ausgabe der Überschrift 
    // alle Spalten der Datenbanktabelle als Objekte im Array zurückgeben 
    $header = $res->fetch_fields();
    // das erste Array ist kunden_id, was durch "str_ireplace" extra hinzugefügt wurde
    $key = $header[0]->name;
    // in einer Schleife restliche Spaltenbezeichnungen als Tabellenheader ausgeben
    for ($i = 1; $i < count($header); $i++) {
        echo "<th>" . $header[$i]->name . "</th>\n";
    }

    //Ausgabe der Aktionsspalte 
    echo "<th Colspan=3>Aktion</th>\n";
    echo "</thr>";

    //Abarbeiten der Datensätze 
    $arr = array();
    while ($arr = $res->fetch_row()) {
        echo "<tr>\n";

        //Ausgabe der Tabellenzeile 
        for ($i = 1; $i < count($arr); $i++) {
            echo "<td>" . $arr[$i] . "</td>\n";
        }

        //Icons und Hilfetexte

        $icon[0] = "\"../shared/img/b_view.png\"";
        $icon[1] = "\"../shared/img/bd_edit.png\"";
        $icon[2] = "\"../shared/img/trash-bin.png\"";

        $alt[0] = "\"Anzeigen\"";
        $alt[1] = "\"Bearbeiten\"";
        $alt[2] = "\"Löschen\"";

        //Ausgabe der Aktionsicons 
        if ($e)  $j = 3; // Andern erlaubt
        else    $j = 1; // Ändern verboten.

        for ($i = 0; $i < $j; $i++) {
            echo "
                    <td align=\" center\">
                        <a href=\"anzeigen.php?key=" . $key . "&kv=" . $arr[0] . "&t=" . $tab . "&p=$i\"> 
                        <img src=" . $icon[$i] . "border=0 alt=" . $alt[$i] . " title=" . $alt[$i] . "/>
                        </a>
                    </td>
                ";
        }

        // Tabellenzeile abschließen 
        echo "</tr>\n";
    }
    echo "</table>";

    if ($e) {
        //Einfügen erlaubt
        echo "
            <BR>
            <button name=\"back\" 
            type=\"button\" 
            onclick=\"window.location.href=
            'anzeigen.php?key=" . $key .
            "&kv=0&t=" . $tab . "&p=3'\" 
            value=\"Einfügen\">
            <img src=\"../shared/img/pencil-tool.png\" 
            alt=\"Einfügen\" title=\"Einfügen\" 
            border=0 /> Einfügen</img> 
            </button>
            ";
    }
}
