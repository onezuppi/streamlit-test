FROM python:3.10.4-slim-buster AS development_build

ENV RABBITMQ_HOST=""
ENV RABBITMQ_PORT=""
ENV RABBITMQ_USER=""
ENV RABBITMQ_PASSWORD=""
ENV RABBITMQ_VHOST=""
ENV EXCHANGE_NAME=""
ENV DEQUE_NAME=""
ENV BINDING_KEY=""
ENV MODEL_PATH=""
ENV MONGO_HOST=""
ENV MONGO_PORT=""
ENV MONGO_USERNAME=""
ENV MONGO_PASSWORD=""
ENV NOTIF_URL=""
ENV NOTIF_PSWD=""
ENV STREAMLIT_PORT=7484

RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y
RUN pip install poetry
WORKDIR /app
COPY pyproject.toml poetry.lock /app/
COPY lct/ /app/lct
RUN poetry install
ENTRYPOINT ["poetry", "run", "start"]
