.PHONY: init
init:  ## Install Python libraries with pipenv
	pipenv install

.PHONY: up
up:  ## Run containers
	docker-compose up -d
	@echo "You can access to pgAdmin: http://localhost:8080"

.PHONY: down
down:  ## Shutdown containers
	docker-compose down

.PHONY: import
import:  ## Import GTFS into database
	pipenv run gtfsdb-load -g --database_url $(DATABASE_URL) $(GTFS)

.PHONY: help
help:  ## Show this message
	@echo "Usage: make <COMMAND>"
	@echo ""
	@echo "Options:"
	@echo "    DATABASE_URL     Database URL that has the style of schema://user:pass@host:port/db"
	@echo "    GTFS             Absolute path to GTFS"
	@echo ""
	@echo "Commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "    \033[36m%-20s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
