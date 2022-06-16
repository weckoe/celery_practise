FROM python:3.10-alpine
WORKDIR /app
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED=1

COPY Pipfile .
COPY Pipfile.lock .
RUN pip install pipenv &&  pipenv install --deploy --system
RUN PIPENV_VENV_IN_PROJECT=1 pipenv install --deploy
COPY . /app/
WORKDIR /app/