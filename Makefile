
.PHONY: binary
binary:
	chmod +x scripts/binary.sh
	bash scripts/binary.sh

.ONESHELL:
.PHONY: smoke-test
smoke-test:
	set -ex
	touch .env
	docker compose --env-file tests/.env --file tests/docker-compose.yaml pull
	docker-compose --env-file tests/.env --file tests/docker-compose.yaml pull
	set +ex
