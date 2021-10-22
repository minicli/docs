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
 
To install MKDocs on Ubuntu/Debian systems, run:

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

```
mkdocs, version 1.2.3 from /home/erika/.local/lib/python3.9/site-packages/mkdocs (Python 3.9)
```

After cloning this repository, run the following command from the project's root folder: 

```shell
mkdocs serve
```
This command will block your terminal, serving the documentation website locally on `http://localhost:8000`. After making changes, you can simply reload the page to see your updates. When you are done, you can hit `CTRL+C` to stop serving the website. 

You don't need to run the `build` command, since that is automatically run by Readthedocs when the main branch has new commits.


