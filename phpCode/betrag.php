<?php

/* Funktion zur Absolutwertbestimmung
*
* Falls der Eingabewerte positiv ist wird dieser zurückgegeben, andernfalls der
* negierte Wert
*/
function betrag($i)
{
    return (($i > 0) ? $i : -$i);
}
