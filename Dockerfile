FROM python:3.6-alpine

ADD requirements.txt env/requirements.txt
ADD pika.tar /usr/local/lib/python3.6/site-packages/

RUN apk update \
  && apk add --virtual build-deps gcc musl-dev \
  && apk add postgresql-dev \
  && pip install psycopg2 \
  && apk del build-deps \
  && pip install -r env/requirements.txt \
  && rm -rf /var/cache/apk/*
  
CMD ["python3"]
