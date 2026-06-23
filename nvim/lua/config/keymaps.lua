-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.del("n", "<M-h>")
vim.keymap.del("n", "<M-j>")
vim.keymap.del("n", "<M-k>")
vim.keymap.del("n", "<M-l>")
vim.keymap.del("v", "<M-k>")
vim.keymap.del("v", "<M-l>")

-- For wordwapping a paragraph
vim.keymap.set("n", "Q", "vipgw")
