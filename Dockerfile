FROM python:3.7
USER root

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN mkdir /var/app
WORKDIR /var/app

COPY TrainingLog ./
COPY Pipfile ./
COPY Pipfile.lock ./

RUN pip install pipenv
RUN pipenv install --system

CMD ["python", "app.py"]
