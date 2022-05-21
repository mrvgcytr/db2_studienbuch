<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <Title>Any SQL</Title>
</head>

<body>
    <?php

    include("../shared/bibliothek.php");

    // Auslesen des Eingabefeldes 
    $sql = @$_GET['sql'];
    $sql = stripslashes($sql); // Un-quotes a quoted string

    // Einlesen der Abfrage
    echo "<form action=\"" . $_SERVER['PHP_SELF'] . "\" method get>";
    echo "<p>Bitte geben Sie ein SQL-Statement ein: ";
    echo "</p>\n";
    echo "<input name=\"sql\" value=\"$sql\" size=100 maxlength=1000 ><br>\n";
    echo "<input type=submit value=\"Execute\">\n";
    echo "</form>\n";

    if (strlen($sql) > 0) {

        //Aufbau der Verbindung
        // Variablen in bibliothek.php
        $verbindung = new mysqli($host, $user, $pw, $database);
        $verbindung->set_charset("utf8");

        if (!$verbindung) {
            echo "Keine Verbindung moeglich!";
        }

        //Datenbankabfrage zusammenbauen $sql- stripslashes ($sql);
        // Datenbankabfrage gegen die DB absetzen 
        $res = $verbindung->query($sql) or
            die("Konnte die Abfrage nicht ausfuehren");

        //Ausgabe des Resultats 
        ausgabeTabelle($res);
    }
    ?>
</body>

</html>