<?php
//Anwendung
include("./webseite.php");
//Konstruktoraufruf mit Parametern 
$w = new Webseite("", "Motivationstraining ... ", 2019, "Thomas Stehling");

//Überschreiben des Inhalts
$w->inhalt = "Die Sonne scheint so nett...
            <BR><BR>
            ... und trotzdem Studium!
            <BR><BR>
            ";

// Ausgabe der Webseite
// mittels des Methodenaufrufs
echo $w->get();
