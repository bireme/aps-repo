default: build

COMPOSE_FILE = docker-compose.yml
COMPOSE_FILE_DEV = docker-compose-dev.yml


## docker-compose shortcuts
dev_build:
	@docker-compose -f $(COMPOSE_FILE_DEV) build

dev_run:
	@docker-compose -f $(COMPOSE_FILE_DEV) up

dev_up:
	@docker-compose -f $(COMPOSE_FILE_DEV) up -d

dev_logs:
	@docker-compose -f $(COMPOSE_FILE_DEV) logs -f

dev_stop:
	@docker-compose -f $(COMPOSE_FILE_DEV) stop

dev_ps:
	@docker-compose -f $(COMPOSE_FILE_DEV) ps

dev_shell:
	@docker-compose -f $(COMPOSE_FILE_DEV) exec aps_wordpress sh


build:
	@docker-compose -f $(COMPOSE_FILE) build

run:
	@docker-compose -f $(COMPOSE_FILE) up

up:
	@docker-compose -f $(COMPOSE_FILE) up -d

logs:
	@docker-compose -f $(COMPOSE_FILE) logs -f

stop:
	@docker-compose -f $(COMPOSE_FILE) stop

ps:
	@docker-compose -f $(COMPOSE_FILE) ps

shell:
	@docker-compose -f $(COMPOSE_FILE) exec aps_wordpress sh
