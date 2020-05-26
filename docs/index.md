# About

Minicli is a minimalist framework for building CLI-centric PHP applications. Minicli has no external package dependencies.

## Dependency-free: What Does it Mean

What does it mean to be dependency-free? It means that you can build a functional CLI PHP application without dozens of nested user-land dependencies. The basic `minicli/minicli` package has only **testing** dependencies (only installed when you clone Minicli for development), and a couple system requirements:

- PHP >= 7.2
- `ext-readline` for obtaining user input

Apart from that, you'll need [Composer](https://getcomposer.org/) to install and use Minicli.

## Getting Started

There are mainly two ways to get started: you can choose to create a project from scratch, or you can use our application repository template, which sets up a minimal structure with Command Namespaces and Controllers.

Both methods are explained in detail in the [Getting Started Guide](/01-getting_started).
## Building Minicli

The following tutorials on [dev.to](https://dev.to/erikaheidi) compose a series named "Building Minicli", where we created the first version of `minicli` from scratch:

 - Part 1: [Bootstrapping a CLI PHP Application in Vanilla PHP](https://dev.to/erikaheidi/bootstrapping-a-cli-php-application-in-vanilla-php-4ee) [ [minicli v.0.1.0](https://github.com/erikaheidi/minicli/tree/0.1.0) ]
 - Part 2: [Building minicli: Implementing Command Controllers](https://dev.to/erikaheidi/php-in-the-command-line-implementing-command-controllers-13lh) [ [minicli v.0.1.2](https://github.com/erikaheidi/minicli/tree/0.1.2) ]
 - Part 3: [Building minicli: Autoloading Command Namespaces](https://dev.to/erikaheidi/building-minicli-autoloading-command-namespaces-3ljm) [ [minicli v.0.1.3](https://github.com/erikaheidi/minicli/tree/0.1.3) ]
 - Part 4: [Introducing minicli: a microframework for CLI-centric PHP applications](https://dev.to/erikaheidi/introducing-minicli-a-microframework-for-cli-centric-php-applications-44ik)

!!! note
    Minicli has evolved a lot since that series was initially written, but that was the base for what Minicli is today.

## Created with Minicli

- [Dolphin](https://github.com/do-community/dolphin) - a CLI tool for managing DigitalOcean servers with Ansible.
