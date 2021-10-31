# About
<p align="center">
<img src="https://minicli.dev/images/minicli_logo_term_pink.png" align="center" alt="logo" title="Minicli logo" alt="Minicli Logo" width="200">
</p>

<p align="center">
    <a href="//packagist.org/packages/minicli/minicli">
        <img src="https://poser.pugx.org/minicli/minicli/v" alt="Latest Stable Version" title="Latest Stable Version">
    </a>
    <a href="//packagist.org/packages/minicli/minicli">
        <img src="https://poser.pugx.org/minicli/minicli/downloads" alt="Total Downloads" title="Total Downloads">
    </a>
    <a href="//packagist.org/packages/minicli/minicli">
        <img src="https://poser.pugx.org/minicli/minicli/license" alt="License" title="License">
    </a>
    <a href="https://docs.minicli.dev/en/latest/?badge=latest">
        <img src="https://readthedocs.org/projects/minicliphp/badge/?version=latest" alt="Documentation Status" title="Documentation Status">
    </a>
</p>

Minicli is a minimalist, dependency-free framework for building CLI-centric PHP applications. It provides a structured way to organize your commands, as well as various helpers to facilitate working with command arguments, obtaining input from users, and printing colored output.

## Requirements

What does it mean to be dependency-free? It means that you can build a functional CLI PHP application without dozens of nested user-land dependencies. The basic `minicli/minicli` package has only **testing** dependencies (only installed when you clone Minicli for development), and a single system requirement:

- PHP >= 7.3

!!! note
    Note: If you want to obtain user input via prompts, then the [`readline`](https://www.php.net/manual/en/function.readline.php) PHP extension is required as well.


Apart from that, you'll need [Composer](https://getcomposer.org/) to install and use Minicli.

## Installation

There are mainly two ways to get started: you can choose to create a project from scratch, which might be a good choice for single command apps or to integrate your command / app within another system, or you can use our application repository template, which sets up a minimal structure with Command Namespaces and Controllers - this is the recommended way if you're creating a new standalone command-line application with Minicli.

Both methods are explained in detail in the [Getting Started Guide](/getting_started).

## Example Code

The following example shows a simple application with a single command registered as callback under the name `test`. The command prints output in different colors:

```php
#!/usr/bin/php
<?php

if($php_sapi_name !== 'cli') {
    exit;
}

require __DIR__ . '/vendor/autoload.php';

use Minicli\App;

$app = new App([
    'app_path' => __DIR__ . '/app/Command',
    'theme' => '\Unicorn', 
    'debug' => false,
]);

$app->registerCommand('test', function () use ($app) {
    $app->getPrinter()->success('Hello World!' , false);
    $app->getPrinter()->info('With Background!' , true);
    $app->getPrinter()->error('Quitting!', false);
});

$app->runCommand($argv);
```

You can run the registered command with: `./minicli test`. The output looks like the following:

![image](./images/output_index.png "Image of a terminal with the output of the code above.")

## Contributing

We welcome all types of contributions and contributors to Minicli and its adjacent repositories, as long as you stick to our [code of conduct](https://github.com/minicli/minicli/blob/main/CODE_OF_CONDUCT.md) and follow our simple [contributing guidelines](https://github.com/minicli/minicli/blob/main/CONTRIBUTING.md). The TL;DR is:

- be excellent to each other
- feel free to ask all the questions
- keep simplicity always in mind
- discuss ideas before implementing something big
- follow the [PSR-12](https://www.php-fig.org/psr/psr-12/) PHP code standards if you are contributing with code

## Building Minicli

The following tutorials on [dev.to](https://dev.to/erikaheidi) compose a series named "Building Minicli", where we created the first version of `minicli` from scratch:

 - Part 1: [Bootstrapping a CLI PHP Application in Vanilla PHP](https://dev.to/erikaheidi/bootstrapping-a-cli-php-application-in-vanilla-php-4ee) [ [minicli v.0.1.0](https://github.com/erikaheidi/minicli/tree/0.1.0) ]
 - Part 2: [Building minicli: Implementing Command Controllers](https://dev.to/erikaheidi/php-in-the-command-line-implementing-command-controllers-13lh) [ [minicli v.0.1.2](https://github.com/erikaheidi/minicli/tree/0.1.2) ]
 - Part 3: [Building minicli: Autoloading Command Namespaces](https://dev.to/erikaheidi/building-minicli-autoloading-command-namespaces-3ljm) [ [minicli v.0.1.3](https://github.com/erikaheidi/minicli/tree/0.1.3) ]
 - Part 4: [Introducing minicli: a microframework for CLI-centric PHP applications](https://dev.to/erikaheidi/introducing-minicli-a-microframework-for-cli-centric-php-applications-44ik)

!!! note
    Minicli has evolved a lot since that series was initially written, with the help of many contributors. Thank you!

## Created with Minicli

The following applications were created using Minicli:

- [Librarian](https://github.com/librarianphp/librarian) - A minimalist file-based CMS / markdown document indexer
- [Dynacover](https://github.com/erikaheidi/dynacover) - Dynamic Twitter images and banners
- [GDaisy](https://github.com/erikaheidi/gdaisy) - `php-gd` based image templates
- [Minileaf](https://github.com/erikaheidi/minileaf) - control your Nanoleaf panels via the CLI
