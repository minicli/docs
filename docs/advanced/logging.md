# Logging

Minicli provides a `Logger` class that can be used to log messages to a file.

## Configuration

The `Logger` class is configured via the `config/logging.php` file. The following configuration keys are available:

```php
<?php

declare(strict_types=1);

use Minicli\Logging\LogLevel;
use Minicli\Logging\LogType;

return [
    /****************************************************************************
     * Logging Configuration
     * --------------------------------------------------------------------------
     *
     * This configuration defines the logging settings for your application.
     *****************************************************************************/

    'logging' => [
        'type' => LogType::SINGLE->value,

        'level' => LogLevel::INFO->value,

        'timestamp_format' => 'Y-m-d H:i:s',
    ],
];
```

The `type` key defines the type of logging to be used. The following types are available:

- `LogType::SINGLE` - A single file will be used to log all messages.
- `LogType::DAILY` - A new file will be created for each day.

The `level` key defines the minimum level of logging to be used. The following levels are available:

- `LogLevel::DEBUG` - Detailed debug information.
- `LogLevel::INFO` - Interesting events. Examples: User logs in, SQL logs.
- `LogLevel::WARNING` - Exceptional occurrences that are not errors. Examples: Use of deprecated APIs, poor use of an API, undesirable things that are not necessarily wrong.
- `LogLevel::ERROR` - Runtime errors that do not require immediate action but should typically be logged and monitored.

The `timestamp_format` key defines the format of the timestamp to be used in the log messages. The default value is `Y-m-d H:i:s`.

## Usage

The `Logger` class is a **built-in service** (by implementing `ServiceInterface`) resgistered as a **service** when the `App`class is instanciated, allowing it to be used by the App and each command controller:

```php
// From the App instance
$app->logger->log('This is a log message');

// From a command controller
$this->logger->log('This is a log message');
```

The `log` method accepts two parameters:

- `$message` - The message to be logged.
- `$level` - The level of the message to be logged. The default value is the one defined in the config file.

Besides the `log` method, the following methods are available:

- `debug` - Logs a message with the `DEBUG` level.
- `info` - Logs a message with the `INFO` level.
- `warning` - Logs a message with the `WARNING` level.
- `error` - Logs a message with the `ERROR` level.
