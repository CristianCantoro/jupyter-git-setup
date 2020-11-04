# Jupyter Git Setup

This is a simple script to setup your repo to use [jupytext][jupytext] and
put your Jupyter notebooks under version control.

In other words, Jupyter notebooks + Jupytext + Git = ❤.

## Rationale

In short, once set up your notebooks will automatically be converted to `.py`
standalone scripts, which should be the ones that you put under version
control.

You can choose if you want to put your notebooks under version control or not.
There are basically two different schools of thought about whether you want
to do it or not.

## Install

By executing `./setup.sh` you will set two git hooks - `post-update` and
`pre-commit`. These hooks will automatically execute `black` and `flake8` to
reformat your code and then `jupytext` to produce a `.py` and an `.html`
export of your notebooks.

The setup script will also set the repo to use `nbdime` as a tool for diffing
notebooks.

### Dependencies

1. Install [jupytext][jupytext].
2. Install [nbdime][nbdime].
3. Install [black][black].
4. Install [flake8][flake8].

```bash
pip3 install jupytext nbdime black flake8
```

[jupytext]: https://github.com/mwouts/jupytext
[nbdime]: https://github.com/jupyter/nbdime
[black]: https://github.com/psf/black
[flake8]: https://gitlab.com/pycqa/flake8

### Usage

```bash
./setup.sh
```

Then you can use `git` normally (`git diff`, `git commit`, etc).
