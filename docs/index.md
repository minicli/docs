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

# Home
Minicli is a minimalist, dependency-free framework for building CLI-centric PHP applications. It provides a structured way to organize your commands, as well as various helpers to facilitate working with command arguments, obtaining input from users, and printing colored output.

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
![image](./images/output_index.png "Image of a terminal with the output of the code above.")


## Dependency-free: What Does it Mean

What does it mean to be dependency-free? It means that you can build a functional CLI PHP application without dozens of nested user-land dependencies. The basic `minicli/minicli` package has only **testing** dependencies (only installed when you clone Minicli for development), and a single system requirement:

- PHP >= 7.3

> Note: If you want to obtain user input, then the [`readline`](https://www.php.net/manual/en/function.readline.php) PHP extension is required as well.
    

Apart from that, you'll need [Composer](https://getcomposer.org/) to install and use Minicli.

## Getting Started

There are mainly two ways to get started: you can choose to create a project from scratch, or you can use our application repository template, which sets up a minimal structure with Command Namespaces and Controllers.

Both methods are explained in detail in the [Getting Started Guide](/01-getting_started).
## Building Minicli

!!! note
    Minicli has evolved a lot since that series was initially written, but that was the base for what Minicli is today.

The following tutorials on [dev.to](https://dev.to/erikaheidi) compose a series named "Building Minicli", where we created the first version of `minicli` from scratch:

 - Part 1: [Bootstrapping a CLI PHP Application in Vanilla PHP](https://dev.to/erikaheidi/bootstrapping-a-cli-php-application-in-vanilla-php-4ee) [ [minicli v.0.1.0](https://github.com/erikaheidi/minicli/tree/0.1.0) ]
 - Part 2: [Building minicli: Implementing Command Controllers](https://dev.to/erikaheidi/php-in-the-command-line-implementing-command-controllers-13lh) [ [minicli v.0.1.2](https://github.com/erikaheidi/minicli/tree/0.1.2) ]
 - Part 3: [Building minicli: Autoloading Command Namespaces](https://dev.to/erikaheidi/building-minicli-autoloading-command-namespaces-3ljm) [ [minicli v.0.1.3](https://github.com/erikaheidi/minicli/tree/0.1.3) ]
 - Part 4: [Introducing minicli: a microframework for CLI-centric PHP applications](https://dev.to/erikaheidi/introducing-minicli-a-microframework-for-cli-centric-php-applications-44ik)

## Created with Minicli

- [Librarian](https://github.com/librarianphp/librarian) - A minimalist file-based CMS / markdown document indexer
- [Dynacover](https://github.com/erikaheidi/dynacover) - Dynamic Twitter images and banners
- [GDaisy](https://github.com/erikaheidi/gdaisy) - php-gd based image templates
