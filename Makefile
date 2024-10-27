.PHONY: install
install: ## Install the poetry environment and install the pre-commit hooks
	@echo "🚀 Creating virtual environment using pyenv and poetry"
	@cd api && poetry install

.PHONY: generate-openapi
generate-openapi:
	@cd api && python3 ./generate_openapi.py
	@openapi-generator generate -i openapi.json -g dart-dio -o ./app/openapi