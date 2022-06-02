# Sharing Minicli Commands

As of version 3.1, you can extend Minicli with commands shared as Composer libraries, following a structure demonstrated in [minicli/command-demo](https://github.com/minicli/command-demo).

This is possible because the `CommandRegistry` now uses an array to define its command source paths. The implementation also creates a shortcut to facilitate referencing packages inside the vendor folder, so the config looks cleaner.

We hope to improve this method in the future, and introduce some safety checks for imported commands. For now, we have a basic implementation that focuses on versatility.

## Quickstart

These are the steps necessary to share an open source Minicli command so that you're able to import it from multiple Minicli applications:

1. Create your command following the [minicli/command-demo](https://github.com/minicli/command-demo) structure.
2. Configure the `composer.json` for the command accordingly and submit it to [Packagist](https://packagist.org).
3. Require the command from your base Minicli app.
4. Include a reference to the command in your app config. For instance:

```php
<?php

$app = new App([
    'app_path' => [
            __DIR__ . '/app/Command',
            '@minicli/command-demo'
        ],
    'debug' => true
]);

```