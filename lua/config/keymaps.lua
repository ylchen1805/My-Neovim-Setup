-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- 單次 Esc 給 terminal 程式
-- 連按兩次才退出 terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")
