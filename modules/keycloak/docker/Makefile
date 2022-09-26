.PHONY: docker-compose.yml docker-compose

up:
	@docker-compose -f docker-compose.yml up -d

down:
	@docker-compose -f docker-compose.yml down -v --remove-orphans

logs-keycloak:
	@docker-compose -f docker-compose.yml logs keycloak -f

logs-postgres:
	@docker-compose -f docker-compose.yml logs postgres -f

logs:
	@docker-compose -f docker-compose.yml logs -f