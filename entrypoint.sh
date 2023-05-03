#!/bin/bash
poetry run python authentication/manage.py migrate
poetry run python authentication/manage.py runserver 0.0.0.0:8000
