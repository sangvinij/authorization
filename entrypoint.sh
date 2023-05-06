#!/bin/bash
set -e

python authentication/manage.py migrate
python authentication/manage.py runserver 0.0.0.0:8000 &

# Получаем PID запущенного процесса
pid=$!

# Ожидаем изменения статуса healthcheck
while sleep 10; do
  if ps -p $pid > /dev/null; then
    echo "Server is running"
  else
    echo "Server is not running, stopping container"
    exit 1
  fi
done
