# Working with confguration values

Minicli provides a confguration manager through the `Config` class. At the same time, the `Config` class is a **built-in service** (by implementing `ServiceInterface`) resgistered as a **service** when the `App`class is instanciated, allowing it to be used inside each command controller.

## Getting Configuration values

It is expected for any application to depend on configuration values. They can be provided by static files or even from environment variables. As long as the `App` instance is accessible, the entire configuration definition will be available and just like retrieving services from the `App` container, the configuration keys will be available via `__get` magic method:
In the case of a certain configuration key is not set, `null` will be returned instead.

In your controllers, you can access the configuration values via the `config` property:

### Command Controller Example

```php
<?php
namespace App\Command\Demo;
use Minicli\Command\CommandController;
class ConfigExampleController extends CommandController
{
    public function handle(): void
    {
        $configValue = $this->config->applicationEnvironment ;
    }
}
```

### Service class example

```php
<?php
namespace App\Services;
use Minicli\App;
use Minicli\ServiceInterface;

class ExampleService implements ServiceInterface
{
    private $stencilTemplatePath;

    public function load(App $app): void
    {
        $this->stencilTemplatePath = $app->config->customStencilsPath;
    }
}
```

## Check if configuration exists via `has` method

As mentioned, if the configuration name does not exists, then null will be returned. When it is required to validate if a configuration key exists, the `has()` method is the right one.

```php
...
    if($app->config->has('customKey') {
        // ...
    }
...
```

## Setting configuration values

### When instantiating `App` (deprecated - Use method below)

An `array`of configuration values can be defined when instanciating the `App` class, given that its `__construct` will use it to create the `Config` service and add it to the app container.

```php
...
$configs = [
    'customStencilsPath' => __DIR__ . '/stencils',
    'customConfigKey' => 'custom-config-value'
];

$app = new App($configs);
```

### Using config files

In the root of your project, create a `config` folder (if you're using any of our official templates this is already done for you).

You can create multiple files to organize your configuration values. For example, you can create a `database.php` file to store your database connection information.

Each of these files must return an array of configuration values. For example:

```php
// database.php

return [
    'db_host' => 'localhost',
    'db_port' => 3306,
    'db_database' => 'myapp',
    'db_user' => 'myuser',
    'db_password' => 'secret',
];
```

All these configurations will be available via the `config` property of the `App` instance or in the `config` property of your command controllers.

```php
// somewhere in your code
$app->config->db_host; // localhost

// or in your command controller
$this->config->db_host; // localhost
```
