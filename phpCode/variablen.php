<html>

<head>
    <title>Variablen</title>
</head>

<body>
    <h1>Aktuelles Datum: </h1>
    <?php echo date("d.m.Y"); ?>

    <br>
    <h1>Variablen konkatinieren</h1>
    <?php

    $i = 10;
    $j = 5;

    echo "Wert für Variable i: " . $i . "<br>";
    echo "Wert für Variable i: " . $j . "<br>";
    echo $i . " + " . $j . " = " . $i + $j . "<br>";
    ?>

    <br>
    <h1>Schleifen</h1>
    <h2>Kopfgesteuerte Schleifen</h2>
    <?php
    echo "Studienverlauf:   <br><br>";
    $w = "WS";
    $s = "SS";
    $i = 2017;

    while ($i < 2020) {
        echo $w . $i . "<br>";
        echo $s . $i . "<br>";
        $i++;
    }
    ?>

    <h2>Fußgesteuerte Schleifen</h2>
    <?php
    $t = "Lektion";
    $i = 1;

    do {
        echo $t . $i . "<br>\n";
        $i++;
    } while ($i < 10)
    ?>

    <h2>Schleifen mit fester Anzahl</h2>
    <?php
    $t = " 2027 Jeden Tag eine gute Tat! <br>\n";

    for ($i = 1; $i < 15; $i++) {
        echo $t;
    }
    ?>
</body>