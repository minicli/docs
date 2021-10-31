# Working with Color Themes

Minicli supports the use of color themes to change the style of command line output. There is currently 1 built-in theme other than the default theme:

- Unicorn

To set the theme, pass in a configuration array with a `theme` value when initializing App in the script. Built-in themes need a leading `\` character:

```php
$app = new App([
    'theme' => '\Unicorn'
]);
```

To use the default built-in theme, do not include the theme configuration setting, or set it to an empty string.

User-defined themes can also be created and defined in your project. In this case, set the theme name including its namespace without a leading `\`:


```php
$app = new App([
    'theme' => 'App\Theme\Blue'
]);
```

The above setting would use the following example theme:

```php
<?php
// File: app/Theme/BlueTheme.php

namespace App\Theme;

use Minicli\Output\Theme\DefaultTheme;
use Minicli\Output\CLIColors;

class BlueTheme extends DefaultTheme
{
    public function getThemeColors(): array
    {
        return [
            'default'     => [ CLIColors::$FG_BLUE ],
            'alt'         => [ CLIColors::$FG_BLACK, CLIColors::$BG_BLUE ],
            'info'        => [ CLIColors::$FG_WHITE],
            'info_alt'    => [ CLIColors::$FG_WHITE, CLIColors::$BG_BLUE ]
        ];
    }
}
```

User-defined themes only need to define styles which will override those in the default theme.

## Theme screenshots
The default Theme:

![Screenshot default Theme](images/defaultTheme.png)

The Unicorn Theme:

![Screenshot unicorn Theme](images/unicornTheme.png)

The matching method calls for the output:

```php
      $app->getPrinter()->display("Hello World");
      $app->getPrinter()->error("Hello World");
      $app->getPrinter()->info("Hello World");
      $app->getPrinter()->success("Hello World");
      $app->getPrinter()->display("Hello World",true);
      $app->getPrinter()->error("Hello World",true);
      $app->getPrinter()->info("Hello World",true);
      $app->getPrinter()->success("Hello World",true);
      $app->getPrinter()->out("Hello World!\r\n", 'underline');
      $app->getPrinter()->out("Hello World!\r\n", 'dim');
      $app->getPrinter()->out("Hello World!\r\n", 'bold');
      $app->getPrinter()->out("Hello World!\r\n", 'inverted');
      $app->getPrinter()->out("Hello World!\r\n", 'italic');
 ```


