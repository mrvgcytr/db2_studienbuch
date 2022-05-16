<?php
function loeschButton($t, $k, $v)
{
    echo "
        <button name=\"delete\"
        type=\"button\"
        onclick=\"window.location.href=
        'loeschen.php?t=" . $t . "&k=" . $k . "&v=" . $v . "'\" value=\"löschen\">
        <img src=\"../shared/img/trash-bin.png\" border=0 /> löschen </a> </button>
        ";
}

function zurueckButton($t)
{
    echo "
        <button name=\"back\"
        type=\"button\"
        onclick=\"window.location.href=
        'kundenListe.php?t=" . $t . "'\" value=\"zurück\">
        <img src=\"../shared/img/bd_deltbl.png\" border=0 /> zurück </a> </button>
        ";
}

function aendernButton()
{
    echo " 
        <button name=\"update\" 
        type=\"submit\"
        value=\"edit\"> 
        <img src=\"../shared/img/bd_edit.png\" 
        border=0 /> ändern </a> 
        </button>
    ";
}

function einfuegeButton()
{
    echo " 
        <button name=\"create\" 
        type=\"submit\"
        value=\"edit\"> 
        <img src=\"../shared/img/pencil-tool.png\" 
        border=0 /> einfügen </a> 
        </button>
    ";
}
