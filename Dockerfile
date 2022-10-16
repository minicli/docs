FROM python:3-alpine

WORKDIR /mkdocs/src/

RUN apk add --no-cache --virtual .build-deps gcc musl-dev

RUN pip install mkdocs mkdocs-material

RUN apk del .build-deps

EXPOSE 8080
