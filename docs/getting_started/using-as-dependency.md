# Using Minicli in your Project

If you want to use Minicli to create a command-line helper for your PHP project, you can use `minicli/minicli` directly and this won't bring in any additional dependencies.

Start by requiring `minicli/minicli` from your project:

```shell
composer require minicli/minicli
```

You'll then need to create a PHP script to implement your Minicli command. In this example, we'll build a demo command that echoes the arguments and parameters passed at execution time.

Although you can create this file directly in the root of your project, if you plan on having additional executables you should consider having a `bin` folder in your project. We'll follow this methodology for this example:

```shell
mkdir bin
```
Create a new file in the root of your project. In this example we'll call it `minicli`, but you can give it a name that is more relevant to your project or to the functionality being implemented.

```shell
nano bin/minicli
```
Place the following contents in this file:

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

!!! note
    The first `if` makes sure the script can only be executed from the command line. Minicli was not made for the web.

Save the file. From the command line, set the permissions of this file to `+x`:

```shell
chmod +x bin/minicli
```

Now you can execute your implemented command with:

```shell
./bin/minicli mycommand name=erika --test
```

```shell title="Var dump of CommandCall object"
My Command!object(Minicli\Command\CommandCall)#11 (6) {
  ["command"]=>
  string(9) "mycommand"
  ["subcommand"]=>
  string(7) "default"
  ["args"]=>
  array(2) {
    [0]=>
    string(6) "./test"
    [1]=>
    string(9) "mycommand"
  }
  ["rawArgs"]=>
  array(4) {
    [0]=>
    string(6) "./test"
    [1]=>
    string(9) "mycommand"
    [2]=>
    string(10) "name=erika"
    [3]=>
    string(6) "--test"
  }
  ["params"]=>
  array(1) {
    ["name"]=>
    string(5) "erika"
  }
  ["flags"]=>
  array(1) {
    [0]=>
    string(6) "--test"
  }
}
```