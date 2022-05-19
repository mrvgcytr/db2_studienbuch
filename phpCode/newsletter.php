<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <Title>Newsletter</Title>
    <link rel="stylesheet" href="../shared/stylesheet.css">
</head>

<body>
    <form action="ausgabemenue.php" methode=get>

        <h3>Bitte treffen Sie Ihre Auswahl:</h3>

        <select name="status" size=1>";
            <option>Kunde
            <option>Interessent
        </select>

        <BR><BR><BR>

        <input type=checkbox name="news" value=FALSE> Haben Sie Interesse am Newsletter?

        <BR><BR>

        Produktauswahl: <BR>

        <?php

        //Initialisierung des Arrays p
        $p[0] = "Mausefalle";
        $p[1] = "Schere";
        $p[2] = "Hammer";
        $p[3] = "Stemmeisen";

        echo "<select name=\"produkte[]\"";
        echo " size=" . count($p) . " multiple>";

        foreach ($p as $element) {
            echo "<option>" . $element;
        }

        ?>

        </select>
        <BR><BR>
        <input type=submit value="Auswahl absenden">
    </form>
</body>

</html>