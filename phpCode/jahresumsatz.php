<html>

<head></head>

<body>

    <?php

    include('./betrag.php');

    $max = 0;

    //Jahresumsätze
    $umsatz[0] = 7;
    $umsatz[1] = 9;
    $umsatz[2] = 17;
    $umsatz[3] = 31;
    $umsatz[4] = 34;
    $umsatz[5] = 27;

    echo "<h2>Jahresumsätze in Mio. $ </h2>";
    echo "<table frame=box><tr>";

    for ($j = 0; $j < 6; $j++) {

        echo "<td align=center>" . ($j + 2018) . "</td>";
    }
    echo "</tr><tr>";

    for ($j = 0; $j < 6; $j++) {

        echo "<td align=right>" . $umsatz[$j] . "</td>";
        if ($j > 0) {
            $diff = betrag($umsatz[$j - 1] - $umsatz[$j]);

            if ($max < $diff) $max = $diff;
        }
    }

    echo "</tr></table>";
    echo "<BR>Die größte Umsatzschwankung beträgt: " . $max . " Mio. $";

    ?>

</body>

</html>