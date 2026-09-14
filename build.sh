#!/usr/bin/env bash
# exit on error
set -o errexit

# Install uv (Render's native environment doesn't have it by default)
pip install uv

# Sync dependencies
uv sync --frozen

# Run Django deployment commands
uv run python manage.py collectstatic --no-input
uv run python manage.py migrate
uv run python manage.py createsuperuser --username admin --email admin@admin.org --noinput || true
