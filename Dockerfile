FROM python:3.11

# Upgrading pip to the latesr version
RUN python -m pip install --upgrade pip

# Installing Poetry
RUN pip install poetry

# Copy pyproject.toml and poetry.lock to install dependencies
WORKDIR /authorization
COPY pyproject.toml poetry.lock ./

# Installing dependencies
RUN poetry config virtualenvs.create false && \
    poetry install --no-root --no-interaction

# Сopy the remaining files
COPY . .

# Runing the file as an executable script
RUN chmod +x entrypoint.sh

# Runing commands from entrypoint.sh
ENTRYPOINT [ "./entrypoint.sh" ]
