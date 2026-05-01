# My Neovim setup

For me to easily bring my Neovim setup to a new machine

## Install

```bash
mkdir -p ~/.config
git clone git@github.com:ylchen1805/My-Neovim-Setup.git ~/.config/nvim
nvim
```

## Extra tools

Install required CLI tools:

- git
- ripgrep
- fd
- python
- node (if some plugins/tools need it)

## Python debugger

```bash
mkdir -p ~/.virtualenvs
cd ~/.virtualenvs
python -m venv debugpy
~/.virtualenvs/debugpy/bin/python -m pip install -U pip debugpy
```
