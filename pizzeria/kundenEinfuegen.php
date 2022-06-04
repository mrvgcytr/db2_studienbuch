<?php
include("./bibliothek.php");
// Titellänge überprüfen
if (strlen($_REQUEST['nachname']) > 0) {
    // Verbindung zur DB testen
    if ($verbindung === false) {
        die("ERROR: Could not connect. " . $verbindung->connect_error);
    }

    // Eingabe für einzelne Felder auslesen & Sonderzeichen maskieren
    $vorname = $verbindung->real_escape_string($_REQUEST['vorname']);
    $nachname = $verbindung->real_escape_string($_REQUEST['nachname']);
    $straße = $verbindung->real_escape_string($_REQUEST['straße']);
    $hausnummer = $verbindung->real_escape_string($_REQUEST['hausnummer']);
    $plz = $verbindung->real_escape_string($_REQUEST['plz']);
    $stadt = $verbindung->real_escape_string($_REQUEST['stadt']);
    $email = $verbindung->real_escape_string($_REQUEST['email']);
    $tel = $verbindung->real_escape_string($_REQUEST['tel']);

    // SQL Anweisung zusammenbasteln
    $sql_plz = "INSERT INTO stadt_nf3 (plz, stadt) VALUES 
    ('$plz', '$stadt') ON DUPLICATE KEY UPDATE plz = '$plz'";
    // SQL Query ausführen & auf Erfolg prüfen
    if (!$verbindung->query($sql_plz)) {
        echo "ERROR: Could not able to execute $sql_plz. " . $verbindung->error;
    }

    $sql_kunde = "INSERT INTO kunden_nf3 (vorname, nachname, straße, hausnummer, plz, email, tel) VALUES 
    ('$vorname', '$nachname', '$straße', '$hausnummer', '$plz', '$email', '$tel')";
    // SQL Query ausführen & auf Erfolg prüfen
    if (!$verbindung->query($sql_kunde)) {
        echo "ERROR: Could not able to execute $sql_kunde. " . $verbindung->error;
    }

    // close connection
    $verbindung->close();
}

// Zurück zur Aufrufseite
header('Location: ' . $_SERVER["HTTP_REFERER"]);
exit;
