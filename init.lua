-- bootstrap lazy.nvim, LazyVim and your plugins

require("config.lazy")

require("tokyonight").setup({
  on_colors = function(colors)
    local util = require("tokyonight.util")
    colors.comment = util.lighten(colors.comment, 0.6)
    colors.dark5 = util.darken(colors.blue5, 0.8)
  end,
})

vim.cmd.colorscheme("tokyonight-night")
