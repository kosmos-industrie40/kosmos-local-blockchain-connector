# Lokale KOSMoS Komponente "Blockchain Connector"

Mit diesem Repository wird die lokale KOSMoS Komponente Blockchain Connector (LKK-BCC) realisiert.

Der LKK-BCC stellt eine Schnittstelle zwischen den lokalen KOSMoS Komponenten und der Blockchain-API bereit.

[Changelog](./doc/CHANGELOG.MD)  
[Todo Liste](./doc/TODO.MD)  
  

## Voraussetzungen zur Installation/Nutzung

* Linux (getestet unter Ubuntu 18.04.4 LTS und Arch rolling)
* Docker (`apt install docker-ce` bzw. `pacman -S docker`)
* Die [lokale KOSMoS MQTT-Broker](https://github.com/kosmos-industrie40/kosmos-local-mqtt-broker) Komponente
* OPTIONAL: 
    * [lokale KOSMoS Machine-Simulator](https://github.com/kosmos-industrie40/kosmos-local-machine-simulator) Komponente

Wenn die LKK-BCC ohne KOSMOS-MQTT gestartet werden soll (z.B. zu Testzwecken), muss im CONFIG.env die Variable `USE_STANDALONE_NO_MQTT` auf `true` gesetzt werden.
  


## Konfiguration

Der Container ist stateless und wird über Umgebungsvariablen beim Start konfiguriert.

### Allgemeine Konfigurations Variablen

TODO

### BCC_CONFIG

Konfiguration, welche MQTT-Nachrichten an welchen Blockchain API-Endpunkt übergeben werden sollen und wie diese Daten umstrukturiert werden.  
[Detailiertere Beschreibung BCC Config](./doc/BCC_CONFIG.MD)

### MQTT-Payload

[Detailiertere Beschreibung MQTT-Payload](./doc/BCC_PAYLOAD.MD) 
  
  
## Startup

    $ make build
    $ make up

The Node-RED Editor can be reached at http://...

To lo in the editor use `admin/kosmos` as credentials.

To stop the blockchain connector, use
  
    $ make down


## Funktionsweise

Die LKK-BCC macht folgendes:
* MQTT-Nachrichten entgegennehmen
* Konfigurierte MQTT-Nachrichten:
    * Formatieren
    * Die Blockchain-HTTPS-API übergeben

Als Blockchain wird Hyperledger Fabric verwendet, die Kommunikation findet über eine HTTP-API statt

> Dokmentation der API: http://kosmos-2017317103.eu-central-1.elb.amazonaws.com/api/docs/
  
  
### Dashboard

~~In der Web-Oberfläche können zu Testzwecken MQTT-Nachrichten auch simuliert werden und und manuell an die Blockchain übertragen werden.~~

~~Das simulierte Test-Topic lautet: `kosmos/machine-data/45678/Sensor/1234/Update`~~

~~Es wird von beiden Regeln im JSON gematched und darauf hin werden 2 Blockchain-Transaktionen durchgeführt.~~

~~Achtung: Die Transaktionen übertragen jeweils andere Werte. Das könnten zwei verschiedene Sensorwerte sein. Da nur eine Blockchain-Funktion zur Verfügung steht, wird eben zwei Mal `UpdateTemperature` aufgerufen.~~

Hierfür gibt es nun die [Lokale KOSMoS Komponente "Machine Simulator"](https://github.com/kosmos-industrie40/kosmos-local-machine-simulator).

Das Dashboard bietet:
* Text-Ansicht der BCC_CONFIG Variable
* Log der an die Blockchain übertragenen Nachrichten und deren Antworten
* Blockchain API Statistiken
* Experimenteller Blockchain Explorer 


## Credits

Dieses Repo wurde erstellt im Rahmen des BMBF Forschungsprojektes KOSMoS gefördert durch das https://www.bmbf.de/

Verwendete Software und Technologien:

* OpenJS Foundation: Node-RED

## Author

(C) 2020 Ondics GmbH
