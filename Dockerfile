FROM python:3.11

# Обновляем pip до последней версии
RUN python -m pip install --upgrade pip

# Устанавливаем Poetry
RUN pip install poetry

# Копируем файлы проекта
COPY . /authorization 

# Устанавливаем зависимости
WORKDIR /authorization
RUN poetry config virtualenvs.create false && \
    poetry install --no-root --no-interaction

# Запускаем миграции и сервер
CMD poetry run python authentication/manage.py migrate && \
    poetry run python authentication/manage.py runserver 127.0.0.1:8000