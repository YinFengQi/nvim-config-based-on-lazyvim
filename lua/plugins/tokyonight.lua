return {
  "folke/tokyonight.nvim",
  opts = {
    transparent = true,
    terminal_colors = true,
    styles = {
      -- sidebars = "transparent", -- style for sidebars, see below
      floats = "dark", -- style for floating windows
    },
    on_highlights = function(highlights, colors)
      -- highlights.teles
    end,

    on_colors = function(colors)
      local util = require("tokyonight.util")
      colors.comment = util.lighten(colors.comment, 0.7)
      -- colors.bg_highlight = util.lighten(colors.bg_highlight, 0.9)
      -- highlight是光标所在行的高亮效果, 也是右下角语法分析器的背景灰框

      colors.fg_gutter = util.lighten(colors.fg_gutter, 0.9)
      -- fg_gutter是左侧的非光标行号, 也是高亮变量名的颜色
      colors.dark5 = util.darken(colors.blue5, 0.8)
      -- dark5是conceal的显示效果, 也是光标行的行号颜色
      colors.terminal_black = util.lighten(colors.terminal_black, 0.8)
      --- terminal_black是unused的变量名显示的颜色
    end,
  },
}
