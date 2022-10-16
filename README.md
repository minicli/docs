# Minicli Docs

Official documentation repository for [minicli/minicli](https://github.com/minicli/minicli).

The documentation at [docs.minicli.dev](https://docs.minicli.dev) lives in the `docs` folder of this repository. The `landing` folder contains the landing page at [minicli.dev](https://minicli.dev).

## Contributing

Check our [contributing guidelines](https://github.com/minicli/docs/blob/master/CONTRIBUTING.md) for details on how you can contribute to Minicli.

Because the documentation is built in markdown files, you can contribute directly from the GitHub website by accessing the documentation page you want to change and clicking on the pencil icon on the top right. This will automatically create a fork of the repository on your own GitHub profile, and upon committing your changes you'll be able to create a pull request directly.

## Setting Up the Documentation Website

The documentation website is built with [MKDocs](https://www.mkdocs.org/) and hosted with [Read the Docs](https://readthedocs.org/).

### Setting Up MKDocs Locally

Although not necessary for contributing, in order to be able to run the documentation website locally and see your changes you'll need to set up MKDocs on your development machine. This will require:

- Python 3
- Pip

#### Ubuntu/Debian systems

Make sure you have python3 and pip installed:

```shell
sudo apt install python3 python3-pip
```

Then, install `mkdocs` and the `mkdocs-material` theme with:

```shell
sudo pip install mkdocs mkdocs-material
```

Check if `mkdocs` was successfully installed with:

```shell
mkdocs --version
```

After cloning this repository, run the following command from the project's root folder: 

```shell
mkdocs serve
```

This command will block your terminal, serving the documentation website locally on `http://localhost:8000`. After making changes, you can simply reload the page to see your updates. When you are done, you can hit `CTRL+C` to stop serving the website. 

You don't need to run the `build` command, since that is automatically run by Readthedocs when the main branch has new commits.

#### macOS systems

Make sure you have Homebrew installed:

```shell
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Then install Python:

```shell
brew install python
```

Download the pip installer:

```shell
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
```

And run it, to install pip:

```shell
python3 get-pip.py
```

Then, install `mkdocs` and the `mkdocs-material` theme with:

```shell
pip install mkdocs mkdocs-material
```

#### using Docker

You can use the provided Dockerfile to build a container that includes mkdocs and mkdocs-material, just follow the lines below.

First, build the image using the following command from the project's root folder:
```shell
docker build -t mkd:v1 .
```

Then, run the server
```shell
docker run --rm -it -v "$(pwd)":/mkdocs/src -p 8080:8080 mkd:v1 mkdocs serve --dev-addr 0.0.0.0:8080
```

This command will block your terminal. Now, you can open `http://localhost:8080` on your browser. After making changes, you can simply reload the page to see your updates. When you are done, you can hit `CTRL+C` to stop serving the website.

You don't need to run the `build` command, since that is automatically run by Readthedocs when the main branch has new commits.
