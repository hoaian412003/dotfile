-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local map = vim.keymap.set

map("n", "<C-g>", function()
  Snacks.lazygit({ cwd = LazyVim.root.git() })
end, { desc = "LazyGit" })

vim.keymap.set("n", "'", function()
  Snacks.picker.grep()
end, { desc = "Grep" })

-- Telescope: ; -> Find Files
map("n", ";", "<cmd>lua Snacks.picker.files()<CR>", {
  desc = "Find Files",
})

-- Quit all
map("n", "<C-q>", "<cmd>qa<CR>", {
  desc = "Quit All",
})
