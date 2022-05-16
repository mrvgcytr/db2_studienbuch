
<?php
include("./webseite.php");
$inhalt = "Zum Testen der Klasse Webseite haben wir hier einen Beispielaufruf der get() Funktion";
$w = new Webseite($inhalt, "Easy Homepage", 2022, "Merve Gücyeter");
$w->inhalt = "Wir können den Inhalt auch von außen easy ändern, da wir in der Klassendeifinition das Schlüsselwort public verwendet haben. Default Visiblity von Klassenattributen ist \"public\" laut der <a href=\"https://www.php.net/manual/en/language.oop5.visibility.php\">PHP Dokumentation</a>.";


echo $w->get();
?>
