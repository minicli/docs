# Prompting User for Input

The `Input` class has methods to obtain user input as a prompt via the [readline](https://www.php.net/manual/en/function.readline.php) PHP extension.

To be able to read user input, you need to import the Input class. Then you need to create an Input object and call the read() method on it.

```php
use Minicli\Input;

(...)
    $input=new Input();
    $userInput=$input->read();

    echo $userInput;
```
Below you find an example App that continuously reads user input in a loop and echoes it. By typing "end" you end the app.

```php
#!/usr/bin/env php
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
      $userInput="";

    while($userInput!="end\r\n"){
    $input=new Input();
    $userInput=$input->read()."\r\n";

    echo $userInput;
    }

});

$app->runCommand($argv);
```

