-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local Util = require("lazyvim.util")

keymap.set({ "i", "s" }, "jj", "<Esc>")
keymap.set({ "i", "s" }, "jk", "<Esc>")
keymap.set({ "i", "s" }, "kj", "<Esc>")

keymap.set("n", "<leader>h", "<cmd>noh<cr>", { desc = "no highlight" })

-- keymap.set("i", "<c-c>", "<cmd>lua require('luasnip.extras.select_choice')()<cr>")
-- keymap.set("i", "<c-s>", "<cmd>lua require('luasnip.extras.select_choice')()<Cr>")
keymap.set({ "i", "s" }, "<c-u>", "<cmd>lua require('luasnip.extras.select_choice')()<cr>")
keymap.set({ "i", "s" }, "<c-n>", "<Plug>luasnip-next-choice")
keymap.set({ "i", "s" }, "<c-p>", "<Plug>luasnip-prev-choice")

keymap.set("n", "<leader>uc", function()
  Util.toggle("conceallevel", false, { 0, 2 })
end, { desc = "Toggle Conceal" })

keymap.set({ "i", "n", "s" }, "<c-z>", "<cmd>undo<cr>")

keymap.set("i", "<c-e>", "<esc><c-e>a")

-- 下面的是来自 Gilles Castel 的快速拼写修正的 keymap,
-- "It basically jumps to the previous spelling mistake [s, then picks the first suggestion 1z=, and then jumps back `]a. The <c-g>u in the middle make it possible to undo the spelling correction quickly."
keymap.set("i", "<c-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u")

-- 下面是来自 Gilles Castel 的图片插入代码, 见
keymap.set(
  "i",
  "<C-f>",
  [[ <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>]]
)

keymap.set(
  "n",
  "<C-f>",
  [[ : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>]]
)
