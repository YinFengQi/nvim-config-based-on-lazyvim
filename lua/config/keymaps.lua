-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local Util = require("lazyvim.util")

keymap.set({ "i", "s" }, "jj", "<Esc>")
keymap.set("n", "<leader>h", "<cmd>noh<cr>", { desc = "no highlight" })

-- keymap.set("i", "<c-c>", "<cmd>lua require('luasnip.extras.select_choice')()<cr>")
-- keymap.set("i", "<c-s>", "<cmd>lua require('luasnip.extras.select_choice')()<cr>")
keymap.set({ "i", "s" }, "<c-u>", "<cmd>lua require('luasnip.extras.select_choice')()<cr>")
keymap.set({ "i", "s" }, "<c-n>", "<Plug>luasnip-next-choice")
keymap.set({ "i", "s" }, "<c-p>", "<Plug>luasnip-prev-choice")

keymap.set("n", "<leader>uc", function()
  Util.toggle("conceallevel", false, { 0, 2 })
end, { desc = "Toggle Conceal" })

keymap.set({ "i", "n", "s" }, "<c-z>", "<cmd>undo<cr>")
