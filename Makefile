.PHONY: help

install:
	poetry install
	poetry run pre-commit install

test:
	poetry run pytest
.PHONY: default
default: install

check:
	poetry run pre-commit run --all-files
