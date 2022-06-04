<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <Title>Anfragedaten</Title>
    <link rel="stylesheet" href="../shared/stylesheet.css">
</head>

<body>

    <h2>Anfragedaten</h2>

    <?php

    //Verbindungsparameter
    include("../shared/bibliothek.php");
    include("./ausgabeListe.php");

    //SQL zusammenbauen
    $sql = "select anfrage_id \"Nr.\", produkt \"Produkt\", datum \"Datum \" from Anfrage order by datum desc";

    //Ausgabe des Resultats

    ausgabeListe($sql, "anfrage", "anfrage_id", false);

    ?>

</body>

</html>