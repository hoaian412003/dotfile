-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Telescope: ; -> Find Files
map("n", ";", "<cmd>lua Snacks.picker.files()<CR>", {
  desc = "Find Files",
})

-- Quit all
map("n", "<C-q>", "<cmd>qa<CR>", {
  desc = "Quit All",
})
