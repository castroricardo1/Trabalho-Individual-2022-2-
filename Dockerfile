FROM python:3.8-slim-buster

WORKDIR /app

COPY requirements.txt .
COPY poetry.lock poetry.toml ./

RUN pip install --no-cache-dir -r requirements.txt
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python

ENV PATH="/root/.poetry/bin:$PATH"

RUN poetry install --no-dev --no-interaction

COPY . .

CMD ["python", "src/main.py"]

COPY build_docs.sh /app/
RUN chmod +x /app/build_docs.sh

RUN /app/build_docs.sh

