# DB2 Studienbuch
## Code Beispiele aus dem Studienbuch zu DB2
  - [Ziel](#ziel)
  - [Git Repo klonen](#git-repo-klonen)
  - [Beispielcodes laufen lassen](#beispielcodes-laufen-lassen)
    - [XAMPP installieren & Komponenten starten](#xampp-installieren--komponenten-starten)
    - [SQL Datenbank](#sql-datenbank)
    - [HTML & PHP Code](#html--php-code)
  - [PHP Code debuggen](#php-code-debuggen)
## Ziel
Dieses Git Repository beinhaltet die Code Beispiele aus dem Studienbuch zu DB2 von Thomas Stehling zur effizienteren Bearbeitung der Unterlagen. Studierende sind dazu eingeladen das Repository auszuchecken und gerne auf dessen Basis die Code Snippets zu SQL, HTML und PHP zu testen.  

Zu beachten ist, dass stellenweise der Code wegen neuer PHP Version (aktuell PHP8) nicht mehr eins zu eins dem Studienbuch entspricht. Solche Stellen sind mit Kommentaren versehen. 

## Git Repo nutzen
### Hintergrund
Um ein lokales Abbild des Git Repos zu haben, empfiehlt es sich, das Repo zu klonen. Im Gegensatz zu einem Download haben Studierende so die Möglichkeit bei Updates per Knopfdruck die Änderungen zu ziehen.  
https://docs.github.com/en/get-started/getting-started-with-git/about-remote-repositories 

Ziel ist es nicht, dass das Repo gemeinsam über Pull-Requests & Feature Branches entwickelt wird. Dennoch sind Verbesserungen und Tipps sehr willkommen. Selbst bei Rechtschreibfehlern :D

### Git Commands
```console
# zuvor git auf dem Rechner installieren
# über den Button "Code" auf Github entweder https URL aufrufen 
# oder per SSH Projekt klonen
git clone https://github.com/mrvgcytr/db2_studienbuch.git

```
## Beispielcodes laufen lassen 

### XAMPP installieren & Komponenten starten 
-> Studienbuch K2.1, S. 14ff.

### SQL Datenbank
Als erstes XAMPP starten, Apache & mySQL Services starten. Die Beispieldatenbank "Kundendatenbank" aus dem 4. Kapitel kann entweder Schritt für Schritt wie im Studienbuch ab K4.2 erstellt werden. Oder das SQL File [.\kundendatenbank\kundendatenbank.sql](kundendatenbank.sql) wird im phpMyAdmin Reiter zu "SQL" eingegeben und die Datenbank mit entsprechenden Tabellen und Beispieldaten erzeugt. 

### HTML & PHP Code
Nochmals muss als erstes sichergestellt werden, dass XAMPP bereits mit gestartetem Apache & mySQL läuft. HTML & PHP Files können dann unter der xampp Installation auf dem lokalen Rechner abgelegt werden. Im Studienbuch wird das im K5.1 beschrieben. 

## PHP Code debuggen 
Zum Debuggen von PHP Code kann XDebug im VS Code eingerichtet werden. Folgende Links sind hier hilfreich: 
[YT: Debugging PHP with XDebug and VsCode](https://www.youtube.com/watch?v=LNIvugvmCyQ&ab_channel=TheCodeholic)
[YT: How to fix PHP executable not found error](https://www.youtube.com/watch?v=NAvMN2tqBZM&ab_channel=NickFrostbutter) 
[Offizielle Doku](http://localhost/dashboard/docs/activate-use-xdebug.html)