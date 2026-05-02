# My Neovim setup

For me to easily bring my Neovim setup to a new machine

## Install LazyVim

```shell
git clone https://github.com/LazyVim/starter ~/.config/nvim
```

## Extra tools

Install required CLI tools:

- git
- ripgrep
- fd
- python
- node (if some plugins/tools need it)

## Install

```bash
git clone https://github.com/ylchen1805/My-Neovim-Setup.git
rm -rf ~/.config/nvim/lua
mv -f My-Neovim-Setup/* ~/.config/nvim/
nvim
```

## Python debugger

```bash
mkdir -p ~/.virtualenvs
cd ~/.virtualenvs
python -m venv debugpy
~/.virtualenvs/debugpy/bin/python -m pip install -U pip debugpy
```
