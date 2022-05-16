<html>

<head></head>

<body>

    <?php
    //Initialisierung des Arrays
    $p[0] = "Mausefalle";
    $p[1] = "Schere";
    $p[2] = "Hammer";
    $p[3] = "Stemmeisen";

    //Initialisierung des Arrays q
    $q = array("Beil", "Schrauben", "Draht");

    //Zusammenführen der Arrays
    $produkte = array_merge($p, $q);

    // Ausgabe des Arrays
    echo "<h3> Produkte: </h3>";
    foreach ($produkte as $produkt) {
        echo $produkt . " ";
    }

    echo "<h3> Sortieren ergibt: </h3>";
    asort($produkte);
    foreach ($produkte as $produkt) {
        echo $produkt . "";
    }

    echo "<h3> Reihenfolge umkehren: </h3>";
    arsort($produkte);
    foreach ($produkte as $produkt) {
        echo $produkt . " ";
    }
    ?>
</body>

</html>