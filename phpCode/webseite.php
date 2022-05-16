
    <?php

    class Webseite
    {
        public  $inhalt;    // Inhalt der Seite
        public  $titel;     // Titel 
        public  $jahr;      // Erscheinungsjahr
        public  $autor;     // Autor

        // Konstruktor der Webseite.
        // public function Webseite() wäre noch PHP4, daher hier die Änderung
        public function __construct($i, $t, $j, $a)
        {
            $this->titel = $t;
            $this->inhalt = $i;
            $this->jahr = $j;
            $this->autor = $a;
        }

        // Den Seitenkopf erzeugen und zurückgeben
        public function kopfzeile()
        {
            $temp = "
                <html>
                    <head>
                        <title> $this->titel </title>
                    </head>
                    <body>
                        <h1> $this->titel </h1>   ";
            return $temp;
        }

        // Die Fußzeile erzeugen und zurückgeben
        function fusszeile()
        {
            $temp = "
                <div align=\"center\">
                    &copy $this->autor  $this->jahr  
                </div>
            </body>     ";
            return $temp;
        }

        // Die gesamte Webseite erzeugen und zurückgeben
        function get()
        {
            //$temp = $this->kopfzeile();
            $temp =  "
            <html>
                <head>
                    <title> $this->titel </title>
                </head>
                <body>
                    <h1> $this->titel </h1>   ";
            $temp .= $this->inhalt;
            //$temp .= $this->fusszeile();
            $temp .=  "
            <div align=\"center\">
                &copy $this->autor  $this->jahr  
            </div>
        </body>     ";
            return $temp;
        }
    }

    ?>