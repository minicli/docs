# Creating Command Controllers

Command Namespaces were designed to create a simple command tree with multiple Command Controllers under a common entry point name. 
It also enables autoloading of commands, by following a known directory/filename structure so you don't need to manually register commands when bootstrapping the application.

## Directory Structure

Command Namespaces rely on a known directory / filename structure such as the following:

```
app/Command
└── CommandNamespace
    ├── DefaultController.php
    └── SubcommandController.php
```

Take the example of [Dolphin](https://github.com/do-community/dolphin). Consider the following directory/file structure:

```
app/Command
├── Deployer
│   ├── DefaultController.php
│   ├── ListController.php
│   ├── NewController.php
│   ├── PingController.php
│   └── RunController.php
├── Dive
│   └── DefaultController.php
├── Droplet
│   ├── CreateController.php
│   ├── DestroyController.php
│   ├── InfoController.php
│   └── ListController.php
├── Fetch
│   ├── ImagesController.php
│   ├── KeysController.php
│   ├── RegionsController.php
│   └── SizesController.php
├── Help
│   └── DefaultController.php
└── Inventory
    ├── DefaultController.php
    └── JsonController.php

```

This yields the following command tree:

```
Available Commands

deployer
└──list
└──new
└──ping
└──run

dive

droplet
└──create
└──destroy
└──info
└──list

fetch
└──images
└──keys
└──regions
└──sizes

help

inventory
└──json

```

## Creating a Command Controller

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
    public function handle(): void
    {       
        $this->display("Hello World!");
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
    public function handle(): void
    {       
        $this->display("HELLO WORLD!");
    }
}
```

And this new command would be available as:

```shell
./minicli hello caps
```
