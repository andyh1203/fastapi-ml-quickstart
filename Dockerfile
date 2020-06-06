FROM ubuntu:19.10

COPY . /app

WORKDIR /app

RUN apt-get update \
    && apt-get install curl python3-dev python3-pip -y \
    && pip3 install poetry \
    && poetry config virtualenvs.create false \
    && poetry install

EXPOSE 8000

ENTRYPOINT ["uvicorn"]
CMD ["api.main:app", "--host", "0.0.0.0"]