#!/bin/bash
sleep 30
python authentication/manage.py migrate
python authentication/manage.py runserver 0.0.0.0:8000
