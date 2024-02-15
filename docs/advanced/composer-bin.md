# Setting up a Minicli app as Composer bin command

If you want to distribute your application with an executable that runs from [Composer's bin folder](https://getcomposer.org/doc/articles/vendor-binaries.md), you can use Minicli as an entry point for that.

In this case, when including the Composer autoload script, you'll need to first check if the application is being called from vendor/bin (as a required dependency) or if it's being called from the application folder itself (as a standalone project).

Update your script to include this check:

```php title='Updating your Minicli to handle path changes'
#!/usr/bin/php
<?php

if (php_sapi_name() !== 'cli') {
    exit;
}

$root_app = dirname(__DIR__);

if (!is_file($root_app . '/vendor/autoload.php')) {
    $root_app = dirname(__DIR__, 4);
}

require $root_app . '/vendor/autoload.php';

$app = new App();
//code continues...
```
If you are running your minicli app as a dependency of a larger project. e.g. A Laravel Project, set the app root as the location of your CLI like so:

```php
$app = new App(appRoot: dirname(__DIR__, 1));
```


With your script ready, edit the project's `composer.json` file to include `minicli` in your `bin` section:

```json
  "bin": [
    "bin/minicli"
  ]
```

This is an example of a valid `composer.json` file from a demo package built that way:

```json
{
  "name": "minicli/advice-slip",
  "description": "Demo - Advice Slip",
  "license": "MIT",
  "homepage": "https://github.com/minicli/advice-slip",
  "keywords": ["cli","command-line", "demo"],
  "require": {
    "minicli/minicli": "^2.0",
    "ext-json": "*"
  },
  "bin": [
    "bin/minicli"
  ]
}
```

If your project is already on Packagist, then you'll need to commit and push your changes to the remote repository so that they are picked up by Packagist.
You may need to create a new release of your project in order to deliver the changes to existing users.

For more information on how to create a Composer bin command with Minicli, [check this tutorial on DEV.to](https://dev.to/erikaheidi/how-to-create-a-composer-bin-command-with-minicli-35ih).