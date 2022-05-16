<html>

<head>
    <title>Ausgabe</title>

</head>

<body>
    <?php

    $status = $_GET['status'];
    $produkte = $_GET['produkte'];
    $news = $_GET['news'];

    echo "Schön, dass wir Sie <B>";
    echo $status . "</B> für unsere Produkte <BR><BR>";

    foreach ($produkte as $produkt) {
        echo $produkt . "<BR>";
    }

    echo "<BR>gewinnen konnten. <BR><BR>";

    if ($news) {
        echo "Hier finden Sie unseren ";
        echo "<a href-news.php>Newsletter</a>!";
    }
    ?>
</body>

</html>