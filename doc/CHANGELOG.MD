# Changelog Lokale BC Komponente

Todo: 
* make mqtt-security optional

6.9.2021:
* New: Adapted to SW-Use Case
* Fix: docker-compose push for harbor changed in Makefile

15.6.2021:
* Fix: chance GET to POST in health check
* Fix: change MQTT topic to lowercase only

4.5.2021:
* Fix: Make typos
* Fix: New name for container in "make test"

30.4.2021:
* New: test with valid bc-endpoint
* New: docs about new BCC_CONFIG.json in Readme
* New: Switched off Mqtt-Security in MQTT-Connector-Node by default
* New: health-Check updated

21.4.2021
* New: Updated to new BCC_CONFIG definition
* New: New ENV variable BC_API_PRODDATA for blockchain API endpoint
* New: Created Makefile for standalone dev and testing
* New: password protection for flow editor

07.09.2020 (Initial Commit)
* New: Basic MQTT listening
* New: Extract value from payload
* New: HTTP-Request to Blockchain-API
* New: Dashboard: Config, Log, Status, Test TX
* New: Easy docker-compose deployment with Makefile

08.09.2020 (Fixes and added features)
* Fix: HTTP-Status Log

08.12.2020: 
* Umbau auf Blockchain HTTP-API
* BCC_CONFIG in extra Datei beschrieben
* Beispiel Payload in extra Datei

07.01.2021:
* Open Source Änderungen
* Healthcheck

08.01.2021:
* Open Source Änderungen
* Repo neu Organisiert
* Readme aktualisiert
