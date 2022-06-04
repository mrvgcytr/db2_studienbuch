<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <Title>Pizzeria - Kunden</Title>
    <link rel="stylesheet" href="../shared/stylesheet.css">
</head>

<body>
    <?php

    // Vewende Verbindung aus bibliothek.php
    include("./bibliothek.php");

    //Ausgabe des Seitenüberschrift
    echo "<h2> Die besten Kunden </h2>";

    // Verwende Verbindung aus bibliothek.php
    //Datenbankabfrage
    $sql = "SELECT kunden_nf3.k_ID, kunden_nf3.vorname, kunden_nf3.nachname, kunden_nf3.straße, kunden_nf3.hausnummer, kunden_nf3.plz, stadt_nf3.stadt, kunden_nf3.email, kunden_nf3.tel FROM kunden_nf3, stadt_nf3 WHERE kunden_nf3.plz = stadt_nf3.plz ORDER BY k_ID ASC;";

    // Datenbanabfrage gegen die DB absetzen
    $res = $verbindung->query($sql) or
        die("Konnte die Abfrage nicht ausfuehren");


    while ($datensatz = $res->fetch_assoc()) {
        //Ausgabe des Inhalts in Tabellenform
        echo "<table>";

        //Ausgabe der Kunden ID
        echo "<tr><td><font size=5>Kunde:</td>";
        echo "<td><font size=5>";
        echo $datensatz['k_ID'] . "</td></tr>\n";

        //Ausgabe des Namens in Form von Nachname, Vorname
        echo "<tr><td colspan=\"2\"><font size=4>";
        echo $datensatz['nachname'] . ", " . $datensatz['vorname'] . "</td></tr>\n";

        //Ausgabe der Anschrift
        echo "<tr><td><font size=3>";
        echo $datensatz['straße'] . "</td>\n";
        echo "<td>" . $datensatz['hausnummer'] . "</td></tr>\n";
        echo "<tr><td>" . $datensatz['plz'] . "</td>\n";
        echo "<td>" . $datensatz['stadt'] . "</td></tr>\n";

        //Ausgabe der Mail & Tel.
        echo "<tr><td colspan=\"2\">";
        echo $datensatz['email'] . "</td></tr>\n";
        echo "<tr><td colspan=\"2\">";
        echo $datensatz['tel'] . "</td></tr>\n";

        // Tabelle beenden
        echo "</table><br>";
    }

    //Button zum Einfügen von neuen Kunden 
    echo "
    <button name=\"back\" type=\"button\" 
    value= \"Neue Kunden hinzufügen\" onclick= 
    \"window.location.href='kundeneinfuegen.html'\"> 
    <img src=\"../shared/img/pencil-tool.png\" 
    border=0 > Kunden einfügen </button>
    ";
    ?>

</body>

</html>