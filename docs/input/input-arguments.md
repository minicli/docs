# Arguments, Parameters and Flags

Minicli commands use the following structure and nomenclature for commands and arguments:

```
./minicli command subcommand param1=value1 param2=value2 --flag1 --flag2
```

- `minicli`: The executable script that instantiates the application. It can be named however you like. When using the application template, this will be named `minicli` by default, but you are free to rename it so that it reflects your application name.
- `command`: The main command namespace or single command being called.
- `subcommand`: A subcommand from the `command` namespace.
- `param1=value2`: Parameters are identified as keypairs and injected into the controller automatically.
- `--flag1`: Flags are identified by preceding `--` characters, and are also injected into the controller automatically. 

The controller surfaces several methods to obtain the parameters used to call the application:

## getArgs(): array

Obtains all arguments included in the command call. This will return the contents obtained via the `$argv[]` global variable, where position `0` corresponds to the script name, and the following items are each command argument.
## hasParam(): bool, getParam(): string

Both methods are used to work with parameters. In the next example, we check if a parameter was set, then adjust the output accordingly:

```php
<?php
...
    public function handle(): void
    {       
        $name = "World";
        if ($this->hasParam('name')) {
            $name = $this->getParam('name');
        }  
        $this->display("Hello $name!");
    }
```

To print a customized "Hello" message, you'd include `name=myname` as additional command call argument when running your app.


## hasFlag(): bool

Identifies if a flag has been set.

```php
<?php
...
    public function handle(): void
    {       
        $message = "Hello World";
        if ($this->hasFlag('shout')) {
            $message = strtoupper($message);
        }

        $this->display($message);
    }
```
