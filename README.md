# Network Rack and Rack Cabinet Planning

![Screenshot](https://datakadabra.files.wordpress.com/2015/09/screenshot-scad-2013-08-26-002703.png?w=435&h=349) ![Screenshot](https://datakadabra.files.wordpress.com/2015/09/screenshot-scad-2013-08-27-005807.png?w=435&h=349)

## Textual Computer-Aided Design

Die Bilder zeigen meine ersten Experimente mit OpenSCAD. Ich visualisiere dort
einen 10- bzw. 19-Zoll-Netzwerk-Wandverteiler, einschließlich der
Platzprobleme zwischen und hinter den Geräten sowie deren Anordnungsvarianten.
Notwendige Equipment-Maße entnahm ich den jeweiligen Hersteller- bzw.
Händlerseiten oder technischen Zeichnungen im Web (Bildsuche bei Normteilen).
Der Schrank wird später im Gebäude eines Freundes hängen.

Die Software erstellt dreh- und zoombare Festkörpermodelle (Solid CAD) anhand
von Textbeschreibungen. Dabei ist jeder Teil der Beschreibung parametrier- und
mehrfach verwendbar, kann komplexe Ausdrücke (Berechnungen usw.) enthalten und
macht Änderungen sofort in jeder Kopie wirksam. Die Modelle sind dadurch
hochgradig konfigurierbar. Gleichzeitig entfallen mühsame Mausaktionen und
wirre Dialoge.

Der [OpenSCAD](http://www.openscad.org/)-Textinput ähnelt deklarativen bzw. funktionalen
Programmiersprachen. Alle Ausdrücke werden zur Compile-Time ausgewertet, es
gibt nur Konstanten, es entsteht ein [CSG-Baum](https://de.wikipedia.org/wiki/Constructive_Solid_Geometry) 
und seine grafische Darstellung.
Das Tool kommt mit eigenem Texteditor, erlaubt dank Dateiüberwachung aber auch
externe Editoren wie Vim (s. Screenshots).


## Technik aus zweiter Hand

Bei kleinem Budget und etwas anspruchsvolleren Vorstellungen zum Netzwerkaufbau kann sich Technik aus Insolvenzverkäufen (Auktionsseiten) [o.ä.](https://www.google.de/search?q=IT-Remarketing) lohnen. Mit etwas Ausdauer wird man bewährtes 24×7, full-featured (low-end) Business-grade-Network-Gear finden, das neuwertigen Consumer-grade-Nonames preislich nahe kommt und mit (Port-based) VLAN, Trunking, Konsole, Zugangskontrollen, Support verschiedener Protokolle (RSTP, 802.1x, …), Port Mirroring, Jumbo-Frames, vglw. hoher Backplane-Kapazität¹, Statistiken, Flow-Control usw. genug Restlebensdauer, Flexibilität und Performance bietet.

Mögliche Nachteile sind ältere Hardware (Lüfter, höherer Stromverbrauch vs. ecolines, Hitze-Vorverschleiß) und alte, nicht mehr aktualisierbare Software-Technologie (Java-Applets, Active-X, …). Nicht selten wurden Web- und Konsolenzugang vom Vorbesitzer versperrt, ohne dass die Tatsache und die Zugangsdaten irgendwo beim Verkäufer dokumentiert wären. Daher vor Kauf die Reset- bzw. Cracking-Möglichkeiten googeln. Password-Resets können bei manchen Switches sogar deaktiviert werden, um sie in unsicheren Umgebungen betreiben zu können (Allied Telesis). Alle Kontakte säubern.


## Farben und Längen

Je bunter, umso zusammengeworfener wirkt es. Ideal: wie aus einem Guss. Wandrack in der Wandfarbe (weiß, nicht grau); Panels, Geräte, Kabelmanager, Blindplatten (falls Budget) ideal in Einheitsfarbe, dunkles Gear leichter zu beschaffen als helles. Leider oft bunt. Persönlich mag ich alles grau, als Teil der baulichen Struktur ablesbar². Grau erinnert an Mauerwerk, Beton und Unterputz.
￼
Kabel (Strom, Daten) auf 4 Farben beschränken: Häufigste Kabel in der Gear-Einheitsfarbe (grau), Hauptleitungen stechen dadurch in Signalfarbe (rot) hervor, etwa Kabel vom HÜP/TAE1-Port am Patchpanel oder Uplinks/Trunk-Leitungen. Kabellängen mind. 1m bzw. Rackhöhe, kleinere Kabel vereiteln einen Umbau im Rack oder verunmöglichen andere Verwendungen. Rackspace füllt sich (Parkinson’s law).

---
¹ Backplane-Kapazität sollte _mindestens_ so hoch sein wie der Durchsatz aller Ports zusammen

² Hier steht nicht die Übertragung von Information an sich im Vordergrund, sondern physische Medien, die diese Übertragung ermöglichen. Teil der Baustruktur meint Teil der _physischen_ Beschreibung der Funktionsstruktur unserer „Wohnmaschine“. Grau erinnert hier an Mauerwerk, Beton und Unterputz, an den Blick auf die nackten Hausfundamente, durch die sich unsere Kabel ziehen.

