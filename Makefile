#
# Dev tools 
# Ondics, 2021
#

DOCKER_COMPOSE_FILE=docker-compose-test.yml
DOCKER_COMPOSE_FILE_HARBOR=docker-compose.yml

# help-systematik
# build muss phony sein (forcierter build), weil es 
# als verzeichnis existiert und sonst nie gebaut werden würde
.PHONY: help build

help:
	@echo "# Docker-Helferlein"
	@echo "# (C) Ondics, 2021"
	@echo Befehle: make ...
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

# hier die befehle
up:	## alle Container starten
	docker-compose -f $(DOCKER_COMPOSE_FILE) up -d

down: ## alle Container stoppen
	-docker kill blockchain-connector
	-docker rm blockchain-connector
	docker-compose -f $(DOCKER_COMPOSE_FILE) down --remove-orphans
	
build: ## alle Container bauen
	docker-compose -f $(DOCKER_COMPOSE_FILE) build

ps: ## was läuft?
	docker-compose ps

bash: ## Die bash im php Container starten
	docker-compose -f $(DOCKER_COMPOSE_FILE) exec blockchain-connector bash
	
logs: ## Alle stdout's aller Container zeigen
	docker-compose -f $(DOCKER_COMPOSE_FILE) logs -f -t
    
push: ## Container pushen auf Harbor (ondics)
	docker login harbor.kosmos.idcp.inovex.io/ondics
	docker-compose -f $(DOCKER_COMPOSE_FILE_HARBOR) push
    
