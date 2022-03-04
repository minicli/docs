# Creating a new Minicli application

Minicli is a minimalist framework for building CLI-centric PHP applications. Minicli has no external package dependencies, and a single system requirement:

- PHP 8.0+ (cli)

> Note: If you want to obtain user input, then the [`readline`](https://www.php.net/manual/en/function.readline.php) PHP extension is required as well.

Apart from that, you'll need [Composer](https://getcomposer.org/) to install and use Minicli.

## Creating a Simple App

If all you need is to set up a few simple commands to run through Minicli, you can use a singe file for your application.

1. Create a directory for your new project
2. Run `composer require minicli/minicli` - this will create a `composer.json` file and download Minicli.
3. Create an executable PHP script with the following content:

```php
#!/usr/bin/php
<?php

if (php_sapi_name() !== 'cli') {
    exit;
}

require __DIR__ . '/vendor/autoload.php';

use Minicli\App;
use Minicli\Command\CommandCall;
use Minicli\Exception\CommandNotFoundException;

$app = new App();
$app->setSignature('./minicli mycommand');

$app->registerCommand('mycommand', function(CommandCall $input) {
    echo "My Command!";

    var_dump($input);
});

try {
    $app->runCommand($argv);
} catch (CommandNotFoundException $e) {
    echo 'An error occurred running the command: ',  $e->getMessage(), "\n";
}
```

This script will set up a command called `mycommand`. To execute it, first make the file executable with:

```bash
chmod +x script-name
```

Then, run your command with:

```bash
./script-name mycommand
```

## Creating a Structured App Using the Application Template

If you'd like to create an application with many commands, or you would prefer to have more structure to your commands, with support to subcommands, than you should use [Command Namespaces](/02-command_namespaces). 
To facilitate setting up such an application, we have the `minicli/application` repository, which serves as an application template you can use with `composer create-project`.

Create a new project with:

```shell
composer create-project --prefer-dist minicli/application myapp
```

This will generate a directory structure like the following:

```
.
app
└── Command
    └── Help
        ├── DefaultController.php
        ├── TableController.php
        └── TestController.php
├── composer.json
├── docs
├── LICENSE
├── minicli
├── mkdocs.yml
└── README.md

```

Each directory inside `app/Command` represents a Command Namespace.
The classes inside `app/Command/Help` represent subcommands that you can access through the main `help` command.

You can now run the boostrapped application with:

```shell
cd myapp
./minicli
```

This will show you the default app signature.

The `help` command that comes with the application template, defined in `app/Command/Help/DefaultController.php`, auto-generates a tree of available commands:

```shell
./minicli help
```

```
Available Commands

help
└──test

```

The `help test` command, defined in `app/Command/Help/TestController.php`, shows an echo test of parameters:

```
./minicli help test user=erika name=value
```

```
Hello, erika!

Array
(
    [user] => erika
    [name] => value
)
```
