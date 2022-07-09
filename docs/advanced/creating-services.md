# Creating and Registering Services

The `App` class is a container that supports registering new services through the `registerService` method. You can create your own service by implementing the `ServiceInterface` interface.

Services are *lazily loaded*, which means they'll only be loaded when requested from within the application.
A `load` method will be called the first time that service is requested.

Built-in Services:

- Config (registered as `config`)
- CommandRegistry (registered as `commandRegistry`)
- OutputHandler (registered as `printer`)

Registering a service:

```php
<?php
...
$my_service = new MyService();

$app = new App();
$app->registerService('my-service', $my_service);
```

This service will be available from controllers via magic `__get` method:

```php
<?php
//A controller class 
...

public function handle(): void
{
    $service = $this->getApp()->my-service;
    $service->doSomething();
}
```


