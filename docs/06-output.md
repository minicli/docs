# Working with Output

The `OutputHandler` service has a series of methods to enable advanced output features, such as printing with colors, printing with pre-defined styles, and outputting content to a file instead of the default output.

This service is available at the application container as `printer`, also accessible via the helper method `getPrinter` on controllers:


```php
<?php
...
    public function handle()
    {       
        $this->getPrinter()->display("Hello World!");
    }
```


This will print a "Hello World!" message wrapped in new lines, using default settings. 

## Printing with Pre-defined Styles

The following shortcut methods are available via the `OutputHandler` class:

- `display($message, $alt = false)` - Uses the `default` style. If `alt` is set to true, it will use the `alt` style.
- `info($message, $alt = false)` - Uses the `info` style. If `alt` is set to true, it will use the `info_alt` style.
- `error($message, $alt = false)` - Uses the `error` style. If `alt` is set to true, it will use the `error_alt` style.
- `success($message, $alt = false)` - Uses the `success` style. If `alt` is set to true, it will use the `success_alt` style.

Example of output produced by these methods:

![Screenshot output test](images/output_styles.png)

### Other Print Methods

- `out($message, $style = null)` - Outputs a message and optionally sets a style. This won't include newlines.
- `rawOutput($message)` - Outputs a message without newlines or formatting.
- `newline()` - Prints a newline / line break.
- `printTable(array $table)` - Helper method that uses the `TableHelper` to format and print a table.

### Table Printing
You can print tables with the TableHelper. Import the TableHelper class. Then create a TableHelper object and insert the
array you want to construct. Add Headers if needed. With the getFormattedTable() method you receive a String. 

```
(...)
use Minicli\Output\Helper\TableHelper;

$app = new App();

$app->setSignature('./minicli mycommand');

$app->registerCommand('mycommand', function(CommandCall $input2) {

    $cars = array (
        array("Volvo",22,18),
        array("BMW",15,13),
        array("Saab",5,2),
        array("Land Rover",17,15)
      );

    $headers=array("Marke","available","ordered");

    $tableHelper=new TableHelper();
    $tableHelper->addHeader($headers);
    $tableHelper->__construct($cars);

    echo $tableHelper->getFormattedTable()."\r\n";
});

$app->runCommand($argv);
```

### Extended Styles

The `DefaultTheme` theme contains additional styles that can be used directly with the `out` method:


- `bold`
- `italic`
- `dim`
- `underline`
- `inverted`

![Screenshot of extended styles output](images/screenshot_extended_styles.png)

Usage example:

```php
<?php
...
    public function handle()
    {   
        $this->getPrinter()->newline();    
        $this->getPrinter()->out("Hello World!", 'underline');
        $this->getPrinter()->newline(); 
    }
```

The same usage applies for creating custom styles within a [Custom Theme](/07-themes/).

!!!note
    Remember that the `out` method doesn't wrap the content with newlines, so you'll have to use the `newline()` method to manually include your line breaks.
