default: build

COMPOSE_FILE = docker-compose.yml
COMPOSE_FILE_DEV = docker-compose-dev.yml

# Use 'docker compose' if available (Docker 20.10+), otherwise fall back to 'docker-compose'
DOCKER_COMPOSE := $(shell if docker compose version >/dev/null 2>&1; then echo "docker compose"; elif command -v docker-compose >/dev/null 2>&1; then echo "docker-compose"; else echo "docker compose"; fi)

# dev
dev_build:
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE_DEV) build

dev_run:
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE_DEV) up

dev_up:
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE_DEV) up -d

dev_logs:
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE_DEV) logs -f

dev_stop:
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE_DEV) stop

dev_ps:
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE_DEV) ps

dev_shell:
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE_DEV) exec aps_wordpress sh


# production
build:
	@$(DOCKER_COMPOSE) build

run:
	@$(DOCKER_COMPOSE) up

up:
	@$(DOCKER_COMPOSE) up -d

logs:
	@$(DOCKER_COMPOSE) logs -f

stop:
	@$(DOCKER_COMPOSE) stop

ps:
	@$(DOCKER_COMPOSE) ps

shell:
	@$(DOCKER_COMPOSE) exec aps_wordpress sh


theme_clone:
	git clone --no-checkout https://github.com/bireme/wordpress-themes.git themes
	cd themes \
	git sparse-checkout init --cone && \
	git sparse-checkout set bvs-aps

theme_update:
	cd themes && git pull
