-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- ~/.config/nvim/lua/config/options.lua

local opt = vim.opt

-- A TAB character will look like 4 spaces if it appears
opt.tabstop = 4

-- Pressing the TAB key will insert spaces instead of a TAB character
opt.expandtab = true

-- Number of spaces inserted instead of a TAB character (when expandtab is on)
opt.softtabstop = 4

-- Number of spaces inserted when indenting (e.g., using >> or auto-indent)
opt.shiftwidth = 4

-- Ensure auto-indentation rounds to the nearest shiftwidth
opt.shiftround = true
