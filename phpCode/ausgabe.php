<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <Title>Ausgabe</Title>
    <link rel="stylesheet" href="../shared/stylesheet.css">
</head>

<body>

    Sie sind

    <?php

    $nachname = $_POST['nachname'];
    echo " Herr oder Frau $nachname";

    ?>

</body>

</html>