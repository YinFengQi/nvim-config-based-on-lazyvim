-- bootstrap lazy.nvim, LazyVim and your plugins

require("config.lazy")

require("tokyonight").setup({
  -- use the night style
  -- style = "night",
  -- disable italic for functions
  on_colors = function(colors)
    colors.comment = "#7d86b0"
    colors.dark5 = "#95bd75"
  end,
})

vim.cmd.colorscheme("tokyonight-night")
