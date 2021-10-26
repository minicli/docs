# Running Minicli with Docker

`Docker` is a tool for containerization. It's a lightweight, portable, and easy to use container runtime. It's designed to make it easier to run applications on a seperated environment, which is very useful when you want to run a lot of applications on a single machine without conflicts between packages and softwares.


### Devopment Environment
We have a sandbox repository, which is a containerized version of Minicli. It's a nice starting point for you to try out the tool. You can find it at [Minicli sandbox Github repository](https://github.com/minicli/sandbox). Once you cloned the repository, you need to run the following commands to prepare your environment:

```shell
# for creating the app container
docker-compose up -d

# to install the dependencies
docker-compose exec app composer install 
```

> **Note**: You must have Docker and Docker Compose installed on your machine to execute these commands.

After that, for you can run the previously configured command and your future custom commands, just run:

```shell
docker-compose exec app minicli your-custom-command
```

### Production?

If you want to distribute your Minicli app with Docker, you can create a custom Docker image for that. You will need a Dockerfile and a entrypoint bash script. You can use the Dockerfile in the sandbox repository and just modify it or write your own. Below you will see the sandbox Dockerfile with the changes you need to make.

The Dockerfile:
```Dockerfile
FROM php:8-fpm

ARG user=sammy
ARG uid=1000

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    vim  \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install mbstring exif gd

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Create system user to run Composer and Artisan Commands
RUN useradd -G www-data,root -u $uid -d /home/$user $user
RUN mkdir -p /home/$user/.composer && \
    chown -R $user:$user /home/$user

WORKDIR /home/$user

COPY . /home/$user

RUN chmod +x /home/$user/runner.sh

USER $user

ENTRYPOINT ["/home/sammy/runner.sh"]
```

The entrypoint script:
```shell
#!/bin/bash

php minicli "$@"
```

> **Note**: You have to create these files in the same directory as your project.

now, you can create a Docker image based on the sandbox Dockerfile. You can use the following command to create the image:

```shell
docker build -t yourname/myapp-minicli .
```

Finally, you can run the commands of your app with minicli using the command below:

```shell	
docker run --rm yourname/myapp-minicli your-custom-command
```

> Follow the instructions in the [Docker Hub](https://hub.docker.com/) to publish your image.
