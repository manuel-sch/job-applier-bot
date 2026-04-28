.PHONY: install run test lint clean

install:
	pip install -r requirements.txt

run:
	python -m core.main

test:
	pytest

lint:
	ruff check .

clean:
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type d -name ".pytest_cache" -exec rm -rf {} +
