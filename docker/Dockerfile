FROM python:3.10-slim-bullseye AS base

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=1000 \
    POETRY_VERSION=1.1.13 \
    POETRY_HOME="/opt/poetry" \
    POETRY_VIRTUALENVS_IN_PROJECT=true \
    POETRY_NO_INTERACTION=1 \
    PYSETUP_PATH="/opt/pysetup"

ENV VENV_PATH="${PYSETUP_PATH}/.venv"
ENV PATH="${POETRY_HOME}/bin:${VENV_PATH}/bin:${PATH}"

FROM base AS builder

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        curl \
        build-essential \
    && rm -rf /var/lib/apt/lists/* \
    && curl -sSL https://install.python-poetry.org | python3 -

WORKDIR ${PYSETUP_PATH}
COPY ./backend/pyproject.toml ./
COPY ./backend/poetry.lock ./
RUN poetry install --no-dev

FROM base AS production

COPY --from=builder ${VENV_PATH} ${VENV_PATH}
COPY --chmod=755 ./docker/docker-entrypoint.sh /docker-entrypoint.sh
COPY ./backend /app

WORKDIR /app

ENTRYPOINT /docker-entrypoint.sh $0 $@
CMD [ "gunicorn", "server:app" ]
