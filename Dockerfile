FROM ubuntu:19.10

COPY ./api /api/api
COPY poetry.lock /poetry.lock
COPY pyproject.toml /pyproject.toml

RUN apt-get update \
    && apt-get install curl python3-dev python3-pip -y \
    && pip3 install poetry \
    && poetry config virtualenvs.create false \
    && poetry install --no-dev

ENV PYTHONPATH=/api
WORKDIR /api

EXPOSE 8000

ENTRYPOINT ["uvicorn"]
CMD ["api.main:app", "--host", "0.0.0.0"]