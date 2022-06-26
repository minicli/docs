# minicli/stencil

> **/ˈstɛns(ə)l/** (noun):
a thin sheet of card, plastic, or metal with a pattern or letters cut out of it, used to produce the cut design on the surface below by the application of ink or paint through the holes.

**Minicli/Stencil** is a dummy content replacer useful for generating templates.

Stencils are like lightweight templates with no advanced functionality (so it's not an engine). It simply replaces placeholders with content set up in a string-indexed array or dictionary.

If you are looking for a templating system for front-end views, this is not it! Go check [Twig](https://twig.symfony.com/). Stencil is useful for generating skeleton content (such as to auto-generate classes, Markdown docs and other files following a certain structure).

## Dependencies
Stencil is a tiny standalone library that has only testing dependencies.

## Usage

### Within Minicli
If you want to use Stencil within a Minicli app, you should have a look at the [Minicli Stencil command](https://github.com/minicli/command-stencil) that contains a basic implementation of a command using Stencil to generate documents based on templates. Check that repo for usage instructions.

### Standalone
For more freedom to include Stencil on your codebase, install standalone Stencil via Composer:

```shell
composer require minicli/stencil
```

Set up a directory within your project to hold your stencils:

```shell
mkdir stencils
cd stencils
```

Create a new `.tpl` file with some variables:

```shell
#stencils/mytemplate.tpl

## This is my Template

My name is {{ name }} and I am a {{ description }}.
```

From your project, instantiate a new Stencil, passing along the stencils directory you set up. Then, call the `applyTemplate` method with an array containing your values:

```php
<?php

$stencil = new Stencil(__DIR__ . '/stencils');

$values = [
    'name' => 'Stencil',
    'description' => 'minimalist, dummy template generator.'
];

$parsedContent = $stencil->applyTemplate('mytemplate', $values);
var_dump($parsedContent);
```
```shell
string(92) "## This is my Template

My name is Stencil and I am a minimalist, dummy template generator.."
```

## Querying templates for variables

You can also obtain the variables set within a template in order to build your array of values in a step-by-step way, such as interactively via command-line prompts.

This is an example code that collects variables from a Stencil template and then prompts users for each variable found, returning an array that can then be used with `$stencil->applyTemplate()`:

```php
<?php

$stencil = new Minicli\Stencil(__DIR__ . '/stencils');
$template = 'mytemplate';
$values = [];
$variables = $stencil->scanTemplateVars($template);

echo "Building template $template\n";
foreach ($variables as $variable) {
    echo ucfirst($variable);
    $values[$variable] = readline(': ');
}

echo $stencil->applyTemplate($template, $values);

```