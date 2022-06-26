# Setting up a Minicli app as a GitHub Action

Minicli applications can also be turned into GitHub Actions with proper containerization, as demonstrated in [this DEV.to tutorial](https://dev.to/erikaheidi/how-to-create-a-github-action-to-import-posts-from-dev-to-a-repository-you-own-3mg1).

The process mainly involves:

1. creating a proper Dockerfile to run the application;
2. creating an `action.yml` file with metadata for your Action.

Both files must live in the root of your GitHub Action repository.

## The Minicli Action Dockerfile

This is what a Dockerfile from a functional Minicli GitHub Action looks like:

```dockerfile
FROM php:8.1-cli

RUN apt-get update && apt-get install -y \
    git \
    curl \
    libxml2-dev \
    zip \
    unzip

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Composer and set up application
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN mkdir /application
COPY . /application/
RUN cd /application && composer install

ENTRYPOINT [ "php", "/application/minicli" ]
CMD ["mycommand", "args"]
```

## The `action.yml` file
This is what an `action.yml` for this action would look like:

```yaml
name: 'Name of MyAction'
description: 'What the action does'
outputs:
  response:
    description: 'Output from command'
runs:
  using: 'docker'
  image: 'Dockerfile'

```

For more detailed information on how to create GitHub Actions with Minicli, check [this tutorial on how to build a GitHub action to import posts from DEV.to](https://dev.to/erikaheidi/how-to-create-a-github-action-to-import-posts-from-dev-to-a-repository-you-own-3mg1).