.PHONY: help

install:
	poetry install
	poetry run pre-commit install

.PHONY: default
default: install

test:
	poetry run pytest
check:
	poetry run pre-commit run --all-files
