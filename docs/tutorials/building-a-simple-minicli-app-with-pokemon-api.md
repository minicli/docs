# How to build a simple app pulling contents from Pokemon API

_Tutorial author: [Simonarde Jr](https://github.com/simonardejr)_

In this example, we are going to build a simple app to show some info about a chosen Pokemon.

To get started, you'll need:

- php-cli
- ext-curl
- [Composer](https://getcomposer.org/)

## Creating a Simple App
First, we need to create a new project using [Minicli template app](https://docs.minicli.dev/en/latest/01-getting_started/#creating-a-structured-app-using-the-application-template), using your terminal of choice, enter the following command:

`composer create-project --prefer-dist minicli/application pokemonApiConsumer`

This will give us a starting point to build our app.

## Creating a command
Minicli will register all commands inside the directory `app/Command`. 
The name you give to a folder inside `Command` is the name of your [Command Namespace](https://docs.minicli.dev/en/latest/02-command_namespaces/), so, in this example, we will create a folder called `Pokemon`. Cd to our app root folder and type the following command:
```shell
cd pokemonApiConsumer
mkdir app/Command/Pokemon
```

Now, we have to create our Controller file, this is the actual name of the command you want to execute, so, in this example, we will create a command called `fetchinfo`:
```shell
cd app/Command/Pokemon
touch FetchInfoController.php
```

Put the following code inside `FetchInfoController`:
```php
<?php

namespace App\Command\Pokemon;

use Minicli\Command\CommandController;
use Minicli\Output\Filter\ColorOutputFilter;
use Minicli\Output\Helper\TableHelper;

class FetchInfoController extends CommandController
{
    public $baseApi = 'https://pokeapi.co/api/v2';

    public function handle(): void
    {
        if( empty($this->hasParam('name')) ) {
            $this->getPrinter()->error("Please, inform the name of Pokemon you want to fetch info.");
            $this->getPrinter()->error("Usage: ./minicli pokemon fetchinfo name=\"bulbasaur\"");
            return;
        }

        $name = $this->getParam('name');

        $this->getPrinter()->display('Showing info about ' . $name);

        $this->fetchPokemonInfo($name);

    }

    public function fetchPokemonInfo($name)
    {
        // code
    }

    public function printPokemonTableInfo($info)
    {
        // code
    }

    public function get($url)
    {
        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10);

        $response = curl_exec($ch);
        curl_close($ch);

        return $response;
    }
}
```

We will implement `fetchPokemonInfo` and `printPokemonInfo` in a minute, but, right now, you can call your command to see if works using:
```shell
./minicli pokemon fetchinfo name="bulbasaur"
```
\* remember, you have to execute this command from the root of your app.

You should see something like:

```Showing info about bulbasaur```


## Implementing fetchPokemonInfo

In this example, we are using [PokeAPI](https://pokeapi.co/). To pull the info about our chosen pokemon, we are going to use the folowing endpoint `https://pokeapi.co/api/v2/pokemon/<name>`, and, if you see the code we have putted inside `FetchInfoController.php`, we have a method called `get`, which uses curl to make a request to a given url. Let's use it then, inside `FetchInfoController.php`:

```php
public function fetchPokemonInfo($name)
{
    $pokemonInfo = $this->get($this->baseApi . '/pokemon/' . $name);
}
```

If you run fetchinfo command again, you will not see any new output, that's because we are making the request to PokeAPI, but not showing anywhere. Let's fix this!

## Implementing printPokemonTableInfo

Now we will display the info PokeAPI has returned in your last request. Open `FetchInfoController.php` and replace `printPokemonTableInfo` content with the following:
```php
public function printPokemonTableInfo($info)
{
    $info = json_decode($info, true);

    $table = new TableHelper();

    $table->addHeader(['Name', 'Height', 'Weight']);
    $table->addRow([ucfirst($info['name']), $info['height'], $info['weight']]);

    $table->addHeader(['Type', '', '']);

    array_map(function($item) use ($table) {
        $table->addRow([$item['type']['name']]);
    }, $info['types']);

    $table->addHeader(['Moves', '', '']);

    array_map(function($item) use ($table) {
        $table->addRow([str_replace('-', ' ', $item['move']['name'])]);
    }, $info['moves']);

    $this->getPrinter()->rawOutput($table->getFormattedTable(new ColorOutputFilter()));
    $this->getPrinter()->newline();
}
```
If you run `fetchinfo` command again, you will notice that the info will not be shown to us. That's because we have implemented the `printPokemonTableInfo`, but we are not calling it. Let's call it then:

```php
public function fetchPokemonInfo($name)
{
    $pokemonInfo = $this->get($this->baseApi . '/pokemon/' . $name);

    $this->printPokemonTableInfo($pokemonInfo);
}
```
Now, run `fetchinfo` again:
```shell
./minicli pokemon fetchinfo name="bulbasaur"
```

You should see some info now! Have fun!

\* disclaimer: this is a very basic piece of code, and it is, by no means, the best and the cleanest way to implement a command using Minicli. 
