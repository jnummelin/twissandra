FROM gliderlabs/alpine:3.2
MAINTAINER "Jussi Nummelin <jussi.nummelin@gmail.com>"

RUN apk --update add python py-pip openssl ca-certificates

WORKDIR app

ADD requirements.txt /app/

RUN apk --update add --virtual build-dependencies python-dev build-base wget \
  && pip install -r requirements.txt \
  && apk del build-dependencies

ADD . /app/

CMD ["python", "manage.py", "runserver", "0.0.0.0:8080"]

EXPOSE 8080
