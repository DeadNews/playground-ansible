.PHONY: test

install-all: install pc-install

install:
	poetry install --no-root --sync
	poetry run ansible-galaxy install -r requirements.yml

pc-install:
	pre-commit install

update-latest:
	poetry up --latest

checks: pc-run

pc-run:
	pre-commit run -a

lint:
	poetry run ansible-lint

test:
	pushd roles/docker_app && poetry run molecule test -s docker_app; popd
