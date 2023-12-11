local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local f = ls.function_node
local c = ls.choice_node
local i = ls.insert_node
local d = ls.dynamic_node
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local line_begin = require("luasnip.extras.expand_conditions").line_begin
local tex = require("util.latex")
local rec_ls
rec_ls = function()
  return sn(nil, {
    c(1, {
      -- important!! Having the sn(...) as the first choice will cause infinite recursion.
      t({ "" }),
      -- The same dynamicNode as in the snippet (also note: self reference).
      sn(nil, { t({ "", "\t\\item " }), i(1), d(2, rec_ls, {}) }),
    }),
  })
end

-- local get_visual = function(args, parent)
--   if #parent.snippet.env.SELECT_RAW > 0 then
--     return sn(nil, i(1, parent.snippet.env.SELECT_RAW))
--   else -- If SELECT_RAW is empty, return a blank insert node
--     return sn(nil, i(1))
--   end
-- end

return {
  s(
    { trig = "newfile" },
    fmta(
      [[
% !TeX program = xelatex
\documentclass{<>}
\input{<>}	% 请检查相对路径是否有效
\title{<>}
\author{<>}

\begin{document}

\maketitle

<>

\end{document}
    ]],
      {
        i(1, "ctexart"),
        i(2, "../preamble.tex"),
        i(3),
        i(4),
        i(0),
      }
    ),
    { condition = line_begin }
  ),

  s(
    { trig = "beg", wordTrig = true, snippetType = "autosnippet" },
    fmta(
      [[
\begin{<>}
  <>
\end{<>}
]],
      {
        i(1),
        i(0),
        rep(1),
      }
    ),
    { condition = line_begin }
  ),
  s(
    { trig = "root" },
    fmta([[ % !TeX root = ./<> ]], {
      i(0),
    }),
    { condition = line_begin }
  ),

  s(
    { trig = "eqt", wordTrig = true, snippetType = "autosnippet" },
    fmta(
      [[
\begin{equation}
  <>
\end{equation}<>
]],
      { i(1), i(0) }
    ),
    { condition = line_begin }
  ),

  s({ trig = "(mk|km)", snippetType = "autosnippet", trigEngine = "ecma" }, fmta([[$<>$<>]], { i(1), i(0) })),

  s("list", {
    t({ "\\begin{itemize}", "\t\\item " }),
    i(1),
    d(2, rec_ls, {}),
    t({ "", "\\end{itemize}" }),
    i(0),
  }, { show_condition = tex.in_text }),
}
