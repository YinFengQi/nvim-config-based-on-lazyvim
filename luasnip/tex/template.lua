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
    { trig = "newfile", snippetType = "autosnippet" },
    fmta(
      [[
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
    )
  ),

  s(
    { trig = "beg", wordTrig = false, snippetType = "autosnippet" },
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
    )
  ),

  s(
    { trig = "eqt", wordTrig = false, snippetType = "autosnippet" },
    fmta(
      [[
\begin{equation}
  <>
\end{equation}<>
]],
      { i(1), i(0) }
    )
  ),
  s(
    { trig = "(mk)|(km)", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta([[$<>$<>]], { i(1), i(0) })
  ),

  s(
    { trig = "ov", snippetType = "autosnippet" },
    c(1, {
      sn(nil, { t("\\odv{"), i(1), t("}{"), i(2), t("}") }),
      sn(nil, { t("\\odv[order={"), i(3), t("}]{"), i(1), t("}{"), i(2), t("}") }),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "(%d+)/", regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 100 },
    fmta("\\frac{<>}{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
    }),
    { condition = tex.in_mathzone }
  ),
}
