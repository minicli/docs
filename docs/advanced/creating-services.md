# Creating and Registering Services

The `App` class is a container that supports registering new services through the `addService` method. You can create your own service by implementing the `ServiceInterface` interface.

Services are *lazily loaded*, which means they'll only be loaded when requested from within the application.
A `load` method will be called the first time that service is requested.

Built-in Services:

- Config (registered as `config`)
- CommandRegistry (registered as `commandRegistry`)
- OutputHandler (registered as `printer`)

## Registering a service manually (deprecated - Use method below)

```php
<?php
...
$my_service = new MyService();

$app = new App();
$app->addService('my_service', $my_service);
```

## Registering a service with config files

You can register a service by adding a new entry to the `services` section of the `config/services.php` file.
This file already comes in our official templates.

```php
<?php

declare(strict_types=1);

return [
    /****************************************************************************
     * Application Services
     * --------------------------------------------------------------------------
     *
     * The services to be loaded for your application.
     *****************************************************************************/

    'services' => [
        'my_service' => \App\Services\MyService::class,
    ],
];
```

## Using Registered Services

The services will be available from controllers via magic `__get` method:

```php
<?php
//A controller class 
...

public function handle(): void
{
    $service = $this->getApp()->my_service;
    $service->doSomething();
}
```
