.PHONY: help
.PHONY: default
default: install


install:
	uv sync --all-extras --all-groups --frozen
	uv tool install pre-commit --with pre-commit-uv --force-reinstall

update:
	uv lock
	uvx pre-commit autoupdate
	$(MAKE) install

test:
	uv run pytest

check:
	uv run pre-commit run --all-files

coverage:
	uv run pytest --cov=my_pkg --cov-report=xml --junitxml=junit.xml -o junit_family=legacy
	# todo: change my_pkg to the name of the package

mypy:
	uv tool run mypy my_pkg --config-file pyproject.toml # todo: change my_pkg to the name of the package
