FROM python:3.6-alpine

RUN apk update \
  && apk add --virtual build-deps gcc musl-dev \
  && apk add postgresql-dev \
  && pip install psycopg2 \
  && apk del build-deps

RUN apk add supervisor

RUN pip install --upgrade pip
ADD requirements.txt env/requirements.txt
RUN pip install -r env/requirements.txt

CMD ["python3"]