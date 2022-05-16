<html>

<head></head>

<body>
    <?php

    // Vewende Verbindung aus bibliothek.php
    include("../shared/bibliothek.php");

    //Ausgabe des Seitenüberschrift

    echo "<h2> News </h2>";

    // Vewende Verbindung aus bibliothek.php
    //Datenbankabfrage
    $sql = "SELECT * FROM news ORDER BY news_id DESC";

    // Datenbanabfrage gegen die DB absetzen
    $res = $verbindung->query($sql) or
        die("Konnte die Abfrage nicht ausfuehren");

    //Ausgabe des Inhalts in Tabellenform
    echo "<table width=\"100%\">";

    while ($datensatz = $res->fetch_assoc()) {

        //Ausgabe des Titels
        echo "<tr><td colspan=3><font size=5>";
        echo $datensatz['titel'] . "</td></tr>\n";

        //Ausgabe des Vorspanns
        echo "<tr><td width=150><font size=4>";
        echo $datensatz['vorspann'] . "</td>\n";

        //Ausgabe des Inhalts
        echo "<td colspan=\"2\"><font size=3>";
        echo $datensatz['inhalt'] . "</td>\n";

        //Ausgabe des Autors
        echo "<tr><td></td><td><font size=3>";
        echo $datensatz['autor'] . "</td>\n";

        //Ausgabe des Ortes und Datums
        echo "<td>";
        echo $datensatz['ort'] . ", den \n";
        $datum = new DateTime($datensatz['datum']);
        echo $datum->format('d.m.y') . "</td>\n";
        echo "</table><br><table width=\"100%\">";
    }

    echo "</table>";

    //Button zum Einfügen von News ausgeben 
    echo "
    <button name=\"back\" type=\"button\" 
    value= \"Neue News verfassen\" onclick= 
    \"window.location.href='newseinfuegen.html'\"> 
    <img src=\"../shared/img/pencil-tool.png\" 
    border=0 > News einfügen </button>
    ";
    ?>

</body>

</html>