<?php

// Zentrale DB Verbindungsvariablen 
$db_host = "localhost";
$db_name = "kundendatenbank";
$db_user = "root";
$db_pw = "";

// Aufbau der Verbindung
$verbindung = new mysqli($db_host, $db_user, $db_pw, $db_name);
$verbindung->set_charset("utf8"); // Zur richtigen Darstellung von Umlauten
