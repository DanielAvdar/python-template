.PHONY: help

install:
	uv sync --all-extras --frozen
	uv tool install pre-commit --with pre-commit-uv --force-reinstall

.PHONY: default
default: install

test:
	uv run pytest

check:
	uv run pre-commit run --all-files

coverage:
	uv run pytest --cov=ml_orchestrator --cov-report=xml
