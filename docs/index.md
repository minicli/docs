# Getting Started

Minicli is a minimalist framework for building CLI-centric PHP applications.

## Creating a Project

You'll need `php-cli` and [Composer](https://getcomposer.org/) to get started.

Create a new project with:

```shell
composer create-project --prefer-dist minicli/application myapp
```

Once the installation is finished, you can run `minicli` with:

```shell
cd myapp
./minicli
```

This will show you the default app signature.

The `help` command that comes with minicli, defined in `app/Command/Help/DefaultController.php`, auto-generates a tree of available commands:

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

## Creating your First Command

The simplest way to create a command is to edit the `minicli` script and define a new command as an anonymous function within the Application via `registerCommand`:

```php
#!/usr/bin/php
<?php

if (php_sapi_name() !== 'cli') {
    exit;
}

require __DIR__ . '/vendor/autoload.php';

use Minicli\App;
use Minicli\Command\CommandCall;

$app = new App();
$app->setSignature('./minicli mycommand');

$app->registerCommand('mycommand', function(CommandCall $input) {
    echo "My Command!";

    var_dump($input);
});

$app->runCommand($argv);
```

You could then execute the new command with:

```shell
./minicli mycommand
```

## Using Command Controllers

To organize your commands into controllers, you'll need to use [Command Namespaces](/command_namespaces#). 

Let's say you want to create a command named  `hello`. You should start by creating a new directory under the `app/Commands` folder:

```shell
mkdir app/Commands/Hello
```

Now `Hello` is your Command Namespace. Inside that directory, you'll need to create at least one Command Controller. You can start with the `DefaultController`, which will be called by default when no subcommand is provided.

This is how this `DefaultController` class could look like:

```php
<?php

namespace App\Command\Hello;

use Minicli\Command\CommandController;

class DefaultController extends CommandController
{
    public function handle()
    {       
        $this->getPrinter()->display("Hello World!");
    }
}
```

This command would be available as:

```shell
./minicli hello
```

Becase a subcommand was not provided, it is inferred that you want to execute the **default** command. This command can also be invoked as:

```shell
./minicli hello default
```

Any other Command Controller placed inside the `Hello` namespace will be available in a similar way. For instance, let's say you want to create a new subcommand like `hello caps`.

You would then create a new Command Controller named `CapsController`:

```php
<?php

namespace App\Command\Hello;

use Minicli\Command\CommandController;

class CapsController extends CommandController
{
    public function handle()
    {       
        $this->getPrinter()->display("HELLO WORLD!");
    }
}
```

And this new command would be available as:

```shell
./minicli hello caps
```

## Working with Parameters

Minicli uses a few conventions for command call arguments:

* Args / Arguments: Parsed arguments - anything that comes from $argv that is not a `key=value` and not a `--flag`.
* Params / Parameters: Key-value pairs such as `user=erika`
* Flags: single arguments prefixed with `--` such as `--update`

The parent `CommandController` class exposes a few handy methods to work with the command call parameters.
For instance, let's say you want to update the previous `hello` command to use an optional parameter to tell the name of the person that will be greeted.

```php
<?php

namespace App\Command\Hello;

use Minicli\Command\CommandController;
use Minicli\Input;

class HelloController extends CommandController
{
    public function handle()
    {       
        $name = $this->hasParam('user') ? $this->getParam('user') : 'World';
        $this->getPrinter()->display(sprintf("Hello, %s!", $name));
    }
}
```

Now, to use the custom version of the command, you'll need to run:

```shell
./minicli hello user=erika 
```

And you'll get the output:

```shell
Hello, erika!
```

### `CommandCall` Class Methods
* `hasParam(string $key) : bool` - Returns true if a parameter exists.
* `getParam(string $key) : string` - Returns a parameter, or null if its non existent.
* `hasFlag(string $key) : bool` - Returns whether or not a flag was passed along in the command call.

## Printing Output

The `CliPrinter` class has shortcut methods to print messages with various colors and styles. 
It comes with two bundled *themes*: `regular` and `unicorn`. This is set up within the App bootstrap config array, and by default it's configured to use the `regular` theme.

```php
    public function handle()
    {       
        $this->getPrinter()->info("Starting Minicli...");
        if (!$this->hasParam('message')) {
            $this->getPrinter()->error("Error: you must provide a message.");
            exit;
        }
        
        $this->getPrinter()->success($this->getParam('message'));
    }
```
### `CliPrinter` Class Methods

* `display(string $message) : void` - Displays a message wrapped in new lines.
* `error(string $message) : void` - Displays an error message wrapped in new lines, using the current theme colors.
* `success(string $message) : void` - Displays a success message wrapped in new lines, using the current theme colors.
* `info(string $message) : void` - Displays an info message wrapped in new lines, using the current theme colors.
* `newline() : void` - Prints a new line.
* `format(string $message, string $style="default") : string` - Returns a formatted string with the desired style.
* `out(string $message) : void` - Prints a message.