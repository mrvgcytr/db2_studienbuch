<html>

<head>
    <meta charset="UTF-8">
    <Title>Kundendaten</Title>
    <link rel="stylesheet" href="../shared/stylesheet.css">
</head>

<body>

    <h2>Kundendaten</h2>

    <?php

    //Verbindungsparameter
    include("../shared/bibliothek.php");
    include("./ausgabeListe.php");

    //SQL zusammenbauen
    $sql = "select kunden_id \"Nr.\", name \"Name\", Telefon \"Tel. \", email \"Email\" from Kunde order by name";

    //Ausgabe des Resultats

    ausgabeListe($sql, "kunde", "kunden_id", true);

    ?>

</body>

</html>