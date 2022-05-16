<?php

class Datum
{

    // Attribute private $monat;

    private $tag;
    private $monat;
    private $jahr;

    //Konstruktorfunktion mit Parameter

    public function __construct($t, $m, $j)
    {
        $this->tag = $t;
        $this->monat = $m;
        $this->jahr = $j;
    }

    // Funktionen

    // Ausgabe des Datums in unterschiedlichen Formaten 
    public function get($sprache)
    {
        if (!strcmp($sprache, "deutsch")) {
            $temp = "$this->tag.$this->monat.$this->jahr";
        } else {

            $temp = "$this->monat/$this->tag/$this->jahr";
        }

        return $temp;
    }

    // Berechnung des Alters an einem anderen Datum 
    public function alteram(Datum $d)
    {

        if (($d->monat > $this->monat) or
            ($d->monat == $this->monat) and
            ($d->tag >= $this->tag)
        ) {
            return ($d->jahr - $this->jahr);
        } else {
            return (($d->jahr - $this->jahr) - 1);
        }
    }

    // Berechnung des Alters 
    public function alter()
    {
        // Aktuelles Datum
        $heute = new Datum(date('d'), date('m'), date('Y'));
        return $this->alteram($heute);
    }
}

//Anwendung von Objekten der Klasse

//Konstruktoraufrufe
$geburtsDatum = new Datum(7, 12, 1970);
$millenium = new Datum(1, 1, 2000);
$heute = new Datum(date('d'), date('m'), date('Y'));

//Verwendung der Funktion get()

echo $geburtsDatum->get("deutsch");
echo " in deutscher Nomenklatur<BR>";

echo $geburtsDatum->get("englisch");
echo " in englischer Nomenklatur<BR>";

//Berechnung des Alters
echo "<BR>";
echo "Alter am 01.01.2000: ";
echo $geburtsDatum->alterAm($millenium);
echo "<BR>";
echo "Alter am";
echo " " . $heute->get("deutsch");
echo " : " . $geburtsDatum->alter();
