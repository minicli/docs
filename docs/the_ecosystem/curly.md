# minicli/curly

**Repository:** [https://github.com/minicli/curly](https://github.com/minicli/curly)

A tiny curl client built for Minicli (but can be also used standalone).

Requires `curl` and `php-curl`.

To include it in your app, first require the dependency with Composer:

```shell
composer require minicli/curly
```

The following single-command demo application will fetch a user's latest stats from DEV.to using Curly:

```php
#!/usr/bin/env php
<?php
if (php_sapi_name() !== 'cli') {
    exit;
}

require __DIR__ . '/vendor/autoload.php';

use Minicli\App;
use Minicli\Exception\CommandNotFoundException;
use Minicli\Curly\Client;

$app = new App([
    'debug' => true,
    'theme' => '\Unicorn'
]);

$app->registerCommand('devto', function () use ($app) {
    $app->display('Fetching from DEV...');
    $crawler = new Client();

    $articles_response = $crawler->get('https://dev.to/api/articles?username=DEVUSERNAME');

    if ($articles_response['code'] !== 200) {
        $app->error('Error while contacting the dev.to API.');
        return 1;
    }

    $articles = json_decode($articles_response['body'], true);
    $table[] = ['Title', 'Reactions'];
    foreach($articles as $article) {
        $table[] = [$article['title'], $article['positive_reactions_count']];
    }
    $app->printTable($table);
    return 0;
});

try {
    $app->runCommand($argv);
} catch (CommandNotFoundException $notFoundException) {
    $app->error("Command Not Found.");
    return 1;
}

return 0;
```
