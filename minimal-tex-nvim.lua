local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },

    config = function()
      require("luasnip").config.set_config({
        enable_autosnippets = true,
        store_selection_keys = "`",
      })

      local auto_expand = require("luasnip").expand_auto
      require("luasnip").expand_auto = function(...)
        vim.o.undolevels = vim.o.undolevels
        auto_expand(...)
      end
    end,

    keys = {
      {
        "<tab>",
        function()
          return require("luasnip").expand_or_jumpable(1) and "<Plug>luasnip-expand-or-jump" or "<tab>"
        end,
        expr = true,
        silent = true,
        mode = "i",
      },
      {
        "<cr>",
        function()
          return require("luasnip").expand_or_jumpable(1) and "<Plug>luasnip-expand-or-jump" or "<cr>"
        end,
        expr = true,
        silent = true,
        mode = "i",
      },
      {
        "<tab>",
        function()
          require("luasnip").jump(1)
        end,
        mode = "s",
      },
      {
        "<s-tab>",
        function()
          require("luasnip").jump(-1)
        end,
        mode = { "i", "s" },
      },
    },
  },

  {
    "folke/tokyonight.nvim",
  },

  {
    "lervag/vimtex",
  },
})

vim.cmd([[colorscheme tokyonight-day]]) -- habbamax, desert
require("luasnip.loaders.from_lua").lazy_load({ paths = { "~/.config/nvim/luasnip" } })
-- NOTE!! 这里面的 lazy_load 是重要的, 否则不会正确加载

local keymap = vim.keymap
keymap.set({ "i", "s" }, "jj", "<Esc>")
keymap.set({ "i", "s" }, "jk", "<Esc>")
keymap.set({ "i", "s" }, "kj", "<Esc>")
keymap.set({ "i", "s" }, "<c-u>", "<cmd>lua require('luasnip.extras.select_choice')()<cr>")
keymap.set({ "i", "s" }, "<c-n>", "<Plug>luasnip-next-choice")
keymap.set({ "i", "s" }, "<c-p>", "<Plug>luasnip-prev-choice")

keymap.set({ "i", "n" }, "<c-z>", "<cmd>undo<CR>")
keymap.set({ "i", "n" }, "wq", "<cmd>wq<CR>")
keymap.set({ "n" }, "j", "gj")
keymap.set({ "n" }, "k", "gk")

-- auto commands
vim.cmd([[set ft=tex]])
vim.cmd([[set statusline=put\ your\ latex\ code\ here\ \ \ \ \ \ \ \ \ \ \ \ \ \ \press\ wq\ to\ leave]])
vim.cmd([[autocmd BufEnter * startinsert | call cursor(1, 2)]])
