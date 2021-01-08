# LICENSE AGPLv3
#
# Copyright (c) 2021, Bernd Braemer.
#

FROM alpine:3.12
MAINTAINER Bernd Braemer

LABEL name="BB Django image"
LABEL version = "1.0.0"
LABEL description = "Django image with Alpine Linux"

ENV PROJECT_NAME=app \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    PYTHONUNBUFFERED=1

WORKDIR /code

# Packages
RUN apk update \
    && apk upgrade --available \
    && apk add \ 
    tzdata \
    chrony \
    python3 \
    py3-pip \ 
    libpq \
    gettext \
    postgresql-dev \
    gcc \
    python3-dev \
    musl-dev \
    --no-cache \
    && cp /usr/share/zoneinfo/America/Chicago /etc/localtime \
    && echo "America/Chicago" > /etc/timezone

# Make sure the executable flag is set -> chmod +x
COPY scripts/django.sh /usr/local/bin/

# Copying requirements file
COPY ./requirements/ .

RUN pip3 install --upgrade pip \
    && pip3 install -r requirements.txt \
    && apk del \
    postgresql-dev \
    gcc \
    python3-dev \
    musl-dev \
    && rm -r /var/cache/apk/*

VOLUME /code

EXPOSE 8000
STOPSIGNAL SIGINT

ENTRYPOINT ["/usr/local/bin/django.sh"]

CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
