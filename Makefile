DOCKER_COMPOSE := $(shell docker compose version > /dev/null 2>&1 && echo 'docker compose' || echo 'docker-compose')

run:
	$(DOCKER_COMPOSE) up

build:
	$(DOCKER_COMPOSE) build --build-arg SSH_PRIVATE_KEY="$$(cat  ~/.ssh/id_rsa)" --build-arg SSH_KNOWN_HOSTS="$$(cat  ~/.ssh/known_hosts)"

makemigrations:
	$(DOCKER_COMPOSE) run web python manage.py makemigrations

migrate:
	$(DOCKER_COMPOSE) run web python manage.py migrate

user:
	$(DOCKER_COMPOSE) run web python manage.py createsuperuser

build_force:
	$(DOCKER_COMPOSE) build --build-arg SSH_PRIVATE_KEY="$$(cat  ~/.ssh/id_rsa)" --build-arg SSH_KNOWN_HOSTS="$$(cat  ~/.ssh/known_hosts)" --no-cache

test:
	$(DOCKER_COMPOSE) run web python manage.py test $(tests)

coverage:
	$(DOCKER_COMPOSE) run web python manage.py test $(tests) --with-coverage

run_command:
	$(DOCKER_COMPOSE) run web python manage.py $(command)