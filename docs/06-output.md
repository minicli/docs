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

## Print Methods

The following shortcut methods are available via the `OutputHandler` class:

- `display($message, $alt = false)` - Uses the `default` style. If `alt` is set to true, it will use the `alt` style.
- `info($message, $alt = false)` - Uses the `info` style. If `alt` is set to true, it will use the `info_alt` style.
- `error($message, $alt = false)` - Uses the `error` style. If `alt` is set to true, it will use the `error_alt` style.
- `success($message, $alt = false)` - Uses the `success` style. If `alt` is set to true, it will use the `success_alt` style.


To output content without predefined styles, you can use:

- `out($message, $style = null)` - Outputs a message and optionally sets a style. This won't include newlines.
- `rawOutput($message)` - Outputs a message without newlines or formatting.

Other helper methods:
- `newline()` - Prints a newline / line break.
- `printTable(array $table)` - Helper method that uses the `TableHelper` to format and print a table. The table must be provided as an array where each item is a row of the table, also in array format:

```php
<?php
...
$table = [
    [ 'header1', 'header2', 'header3' ],
    [ 'item2', 'item2', 'item3']
];

$this->getPrinter()->printTable($table);
...
```


## Filters and Adapters



The `OutputHandler` has two different components that define how the output is handled: **Output Filters** and **Printer Adapters**.

- Output Filters: define **how** the message is printed.
- Printer Adapters: define **where** the message is printed.

## Output Filters

Filters implement the `OutputFilterInterface`. They modify the output before it is sent to the printer. By default, the application sets up a `ColorOutputFilter` using a standard `CLITheme`. A `SimpleOutputFilter` is available as alternative to print messages without styling, and a `TimestampOutputFilter` is available for including timestamps to each message being printed, which makes it good for using with logs. 

You can register multiple output filters within the `OutputHandler` class.

### Changing the Default Output Filter

```php
<?php 
...
# Sets the OutputHandler to print to a file
$app = new App();
$app->setOutputHandler(new OutputHandler(new DefaultPrinterAdapter()));


$app->registerCommand('mycommand', function(CommandCall $input) {
    echo "My Command!";

    var_dump($input);
});

$app->runCommand($argv);
```

## Printer Adapters

Printer adapters implement the `PrinterAdapterInterfacedefine`. By default, messages are printed to the terminal, using the `DefaultPrinterAdapter`. Messages can be printed to a file with the `FilePrinterAdapter`. 


##