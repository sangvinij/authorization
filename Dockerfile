FROM python:3.11

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Creating a new user, upgrading pip to the latesr version and installing poetry
RUN useradd -ms /bin/bash newuser && \
    python -m pip install --upgrade pip && \
    pip install poetry

# Copy pyproject.toml and poetry.lock to install dependencies
WORKDIR /authorization
COPY pyproject.toml poetry.lock ./

# Installing dependencies to system python
RUN poetry config virtualenvs.create false && \
    poetry install --no-root --no-interaction

# Сopy the remaining files
COPY . .

# Runing the file as an executable script
RUN chmod +x entrypoint.sh

# Changing user 
USER newuser

# Launching the script
ENTRYPOINT [ "./entrypoint.sh" ]

# Checking health status
HEALTHCHECK --interval=2s --timeout=10s --start-period=2s --retries=2 \
  CMD curl -f http://localhost:8000/asd || exit 1
