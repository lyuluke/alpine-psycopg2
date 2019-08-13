FROM python:3.6-alpine

RUN apk update \
  && apk add --virtual build-deps gcc musl-dev \
  && apk add postgresql-dev \
  && pip install psycopg2 \
  && apk del build-deps

RUN pip install --upgrade pip
ADD requirements.txt env/requirements.txt
RUN pip install -r env/requirements.txt
ADD pika.tar /usr/local/lib/python3.6/site-packages/
CMD ["python3"]
