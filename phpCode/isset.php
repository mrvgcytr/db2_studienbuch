<html>

<head></head>

<body>
    <?php

    $ausgabeSeite = "isset.php";
    $nachname = @$_GET['nachname'];

    echo "<html> <head></head><body>";
    $text = "Bitte geben Sie Ihren Namen ein: <BR><BR>";

    if (isset($nachname)) {

        if (preg_match("/[0-9]/", $nachname)) {
            $text = "Bitte verwenden Sie keine Ziffern";
            $text .= " in Ihrem Namen! <BR><BR>\n";
            $ausgabeSeite = "isset.php";
        } else {

            $text = " Die Eingaben sind ok!<BR><BR>\n";

            $ausgabeSeite = "ausgabe.php";
        }
    } else {

        $ausgabeSeite = "isset.php";
    }

    echo "<form action=\"" . $ausgabeSeite . "\"
    method=get>\n";

    echo $text;

    echo "Name: ";

    echo "<input name=\"nachname\"
    value=" . $nachname . "> <br><br>\n";

    echo "<input type=submit value=\"Weiter\">\n";

    echo "</form>\n";
    ?>

</body>

</html>