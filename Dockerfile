FROM python:3.8-alpine3.15 as BUILD

RUN apk add --update \
    && apk add --no-cache build-base curl-dev linux-headers bash git musl-dev\
    && rm -rf /var/cache/apk/*

COPY requirements.txt /root/test-button/requirements.txt
COPY README.md /root/test-button/README.md
COPY setup.py /root/test-button/setup.py
COPY test_button /root/test-button/test_button

RUN pip install --upgrade pip && \
    pip install -r /root/test-button/requirements.txt && \
    pip install /root/test-button

FROM python:3.8-alpine3.15

RUN apk add --no-cache --update bash

LABEL maintainer "csc-jm"
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.vcs-url="https://github.com/csc-jm/test-button"

COPY --from=BUILD usr/local/lib/python3.8/ usr/local/lib/python3.8/

COPY --from=BUILD /usr/local/bin/gunicorn /usr/local/bin/

COPY --from=BUILD /usr/local/bin/test-button /usr/local/bin/

RUN mkdir -p /app

WORKDIR /app

COPY ./deploy/app.sh /app/app.sh

RUN chmod +x /app/app.sh

ENTRYPOINT ["/bin/sh", "-c", "/app/app.sh"]
