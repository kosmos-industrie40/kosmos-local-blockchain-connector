# Lokale KOSMoS Komponente "Blockchain Connector"

Mit diesem Repository wird die lokale KOSMoS Komponente Blockchain Connector (LKK-BCC) realisiert.

Der LKK-BCC stellt eine Schnittstelle zwischen den lokalen KOSMoS Komponenten und der Blockchain-API bereit.

[Changelog](./doc/CHANGELOG.MD)  
[Todo Liste](./doc/TODO.MD)  
  

## Voraussetzungen

* Linux (getestet unter Ubuntu 18.04.4 LTS und Arch rolling)
* Docker (`apt install docker-ce` bzw. `pacman -S docker`)
* Die [lokale KOSMoS MQTT-Broker](https://github.com/kosmos-industrie40/kosmos-local-mqtt-broker) Komponente
* OPTIONAL: 
    * [lokale KOSMoS Machine-Simulator](https://github.com/kosmos-industrie40/kosmos-local-machine-simulator) Komponente

Wenn die LKK-BCC ohne KOSMOS-MQTT gestartet werden soll (z.B. zu Testzwecken), muss im CONFIG.env die Variable `USE_STANDALONE_NO_MQTT` auf `true` gesetzt werden.
  
## Installation

### Test

Das `docker-compose-test.yml` wird für die test-Version benutzt.

Zum Test kann ein Standalone-Blockchain-Connector gestartet werden:

    $ make build 
    $ make up

Zu stoppen genügt ein
    $ make down

### Produktion

Die Produktionsversion wird mit Docker gestartet:

    $ docker run \
        -d \
        --net kosmos-local \
        --domainname=${KOSMOS_LOCAL_MQTT_CLIENT_ROLE_FQDN} \
        --hostname=bockchain-connector \
        --name blockchain-connector \
        -e TZ=Europe/Berlin \
        -e VAULT_TOKEN=${VAULT_TOKEN} \
        -e USE_TLS=true \
        -e USE_STANDALONE_NO_MQTT=false \
        -e BC_API_PRODDATA: "http://35.159.41.125/storage/prodData" \
        -e BC_API_MACHINES: "http://35.159.41.125/machine" \
        -e BC_API_CONTRACTS: "http://35.159.41.125/contract" \
        -e BCC_CONFIG: "[{ \
                "machineId": "14ca47df-3872-4d05-b6fe-dabb2dcb92ea", \
                "sensorId": "sensor1inmachine1", \
                "mqtt-topic": "kosmos/machine-data/<machineId>/Sensor/<sensorId>/Update", \
                "blockchain-endpoint": "<BC_API_PRODDATA>", \
                "mapping": "none" \
            }]"
        -e MY_PKI_URI=https://${KOSMOS_LOCAL_MQTT_CA_FQDN}:8201/v1/${KOSMOS_LOCAL_MQTT_PKI_PATH}/issue/${KOSMOS_LOCAL_MQTT_CLIENT_ROLE_PATH} \
        -e MQTT_BROKER_FQDN=${KOSMOS_LOCAL_MQTT_BROKER_HOSTNAME}.${KOSMOS_LOCAL_MQTT_BROKER_ROLE_FQDN} \
        -p 10005:1880 \
        harbor.kosmos.idcp.inovex.io/ondics/blockchain-connector:0.3.0 \
            > /dev/null && echo " [OK]"

### Oberfläche

Wenn der Container gestartet ist
The Node-RED Editor can be reached at http://...

Anmeldung im Node-RED Editor mit `admin/kosmos`

Das Node-RED-Dashboard ist erreichbar unter http://.../ui

Der Status kann (im Container) mit 

    curl localhost:1880/health | jq

abgefragt werden.


## Konfiguration

Der Container ist stateless und wird über Umgebungsvariablen beim Start konfiguriert.

### Docker-Env Variablen

* BC_API_PRODDATA: Blockchain-API-Endpunkt für Proktionsdaten-Updates
* BC_API_MACHINES: Blockchain-API-Endpunkt für Abfrage aller Maschinen eines Kunden
* BC_API_CONTRACTS: Blockchain-API-Endpunkt für Abfrage aller verträge eines Kunden
* BCC_CONFIG: Topics von MQTT-Messages, deren Payloads an die Blockchain übertragen werden sollen

### Aufbau BCC_CONFIG

Ein JSON-Array mit Einträgen für Mqtt-Topics. Jeder Eintrag besteht aus:

* `mqtt-topic`: Mqtt-Topic, das übertragen werden soll (mit Platzhaltern `<...>`)
* `machineId`: Wert für den Platzhalter `<maschineId>`
* `sensorId`: Wert für den Platzhalter `<sensorId>`
* `blockchain-endpoint`: Url der Blockchain-API. `<BC_API_PRODDATA>` wird durch die env-Variable ersetzt

Beispiel:

    [
        {
            "machineId": "14ca47df-3872-4d05-b6fe-dabb2dcb92ea",
            "sensorId": "sensor1inmachine1",
            "mqtt-topic": "kosmos/machine-data/<machineId>/Sensor/<sensorId>/Update",
            "blockchain-endpoint": "<BC_API_PRODDATA>",
            "mapping": "none"
        }
    ]





## Funktionsweise

Die LKK-BCC macht folgendes:

* MQTT-Nachrichten entgegennehmen
* Prüfen, ob eine MQTT-Nachricht an die Blockchain übertragen werden muss.
* Senden der Nachricht an die Blockchain-API

Als Blockchain wird Hyperledger Fabric verwendet, die Kommunikation findet über eine HTTP-API statt

> Dokmentation der API: http://35.159.41.125/docs
  
  
### Dashboard

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

(C) 2021 Ondics GmbH
