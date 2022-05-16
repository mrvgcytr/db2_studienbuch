<?php
include("../shared/bibliothek.php");
// Titellänge überprüfen
if (strlen($_REQUEST['titel']) > 0) {
    // Verbindung zur DB testen
    if ($verbindung === false) {
        die("ERROR: Could not connect. " . $verbindung->connect_error);
    }

    // Eingabe für einzelne Felder auslesen & Sonderzeichen maskieren
    $titel = $verbindung->real_escape_string($_REQUEST['titel']);
    $vorspann = $verbindung->real_escape_string($_REQUEST['vorspann']);
    $inhalt = $verbindung->real_escape_string($_REQUEST['inhalt']);
    $ort = $verbindung->real_escape_string($_REQUEST['ort']);
    $datum = $verbindung->real_escape_string(date("Y-m-d"));
    $autor = $verbindung->real_escape_string($_REQUEST['autor']);

    // SQL Anweisung zusammenbasteln
    $sql = "INSERT INTO news (titel, vorspann, inhalt, ort, datum, autor) VALUES 
    ('$titel', '$vorspann', '$inhalt', '$ort', '$datum', '$autor')";
    // SQL Query ausführen & auf Erfolg prüfen
    if (!$verbindung->query($sql)) {
        echo "ERROR: Could not able to execute $sql. " . $verbindung->error;
    }

    // close connection
    $verbindung->close();
}

// Zurück zur Aufrufseite
header('Location: ' . $_SERVER["HTTP_REFERER"]);
exit;
