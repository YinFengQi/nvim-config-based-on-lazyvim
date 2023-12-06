return {
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    -- dependencies = {
    -- 	"rafamadriz/friendly-snippets",
    -- 	config = function()
    -- 		require("luasnip.loaders.from_vscode").lazy_load()
    -- 	end,
    -- },

    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
    config = function()
      require("luasnip").config.set_config({
        enable_autosnippets = true,
        store_selection_keys = "``",
      })
      require("luasnip.loaders.from_lua").load({ paths = { "~/.config/nvim/luasnip" } })

      local auto_expand = require("luasnip").expand_auto
      require("luasnip").expand_auto = function(...)
        vim.o.undolevels = vim.o.undolevels
        auto_expand(...)
      end
    end,
  },
}
