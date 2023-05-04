# Minicli OCI Runtimes

Minicli Runtimes are minimalist / distroless OCI images for running Minicli with PHP on cloud-native environments.

Images are built every night and published to [Docker Hub](https://hub.docker.com/u/minicli) via GitHub Actions.

## Available Images
The following images are currently available. You can find more information and usage instructions on the README file that is included within each image folder in this repository.

### minicli/php81
[![Publish minicli/php81 Image](https://github.com/minicli/runtimes/actions/workflows/php81.yml/badge.svg)](https://github.com/minicli/runtimes/actions/workflows/php81.yml)

The `php81` image is a distroless, Alpine-based image with several PHP extensions, including full GD support. It doesn't come with Composer or apk. Used to run Minicli apps on production.

- Total size: 48MB
- Docker Hub: [minicli/php81](https://hub.docker.com/repository/docker/minicli/php81)
- Source: [php81](/php81)

### minicli/php81-dev
[![Publish minicli/php81-dev Image](https://github.com/minicli/runtimes/actions/workflows/php81-dev.yml/badge.svg)](https://github.com/minicli/runtimes/actions/workflows/php81-dev.yml)

The `php81-dev` image is a development image that includes all packages from `php81` and also `apk-tools`, Composer, and `vim`. Used to develop and debug Minicli apps.
This image's default entry point is a shell.

- Total size: 79.5MB
- Docker Hub: [minicli/php81-dev](https://hub.docker.com/repository/docker/minicli/php81-dev)
- Source: [php81-dev](/php81-dev)

### minicli/php81-curl
[![Publish minicli/php81-curl Image](https://github.com/minicli/runtimes/actions/workflows/php81-curl.yml/badge.svg)](https://github.com/minicli/runtimes/actions/workflows/php81-curl.yml)

The `php81-curl` image is tailored for running API requests with Curl, ideal for bots and crawlers using [minicli/curly](https://github.com/minicli/curly). This image doesn't include GD.

- Total size: 30MB
- Docker Hub: [minicli/php81-curl](https://hub.docker.com/repository/docker/minicli/php81-curl)
- Source: [php81-curl](/php81-curl)

## Images Compared
The following table shows a quick overview of what's included with each image and how they differ.

|                   | php81 | php81-curl | php81-dev |
|-------------------|-------|------------|-----------|
| Alpine base       | X     | X          | X         |
| apk-tools         |       |            | X         |
| curl              | X     | X          | X         |
| git               | X     | X          | X         |
| zip               | X     | X          | X         |
| unzip             | X     | X          | X         |
| libxml2-dev       | X     | X          | X         |
| freetype-dev      | X     |            | X         |
| libjpeg-turbo-dev | X     |            | X         |
| libpng-dev        | X     |            | X         |
| php81             | X     | X          | X         |
| php81-gd          | X     |            | X         |
| php81-curl        | X     | X          | X         |
| php81-mbstring    | X     | X          | X         |
| php81-phar        | X     | X          | X         |
| php81-openssl     | X     | X          | X         |
| php81-pcntl       | X     | X          | X         |
| Composer          |       |            | X         |
| Vim               |       |            | X         |