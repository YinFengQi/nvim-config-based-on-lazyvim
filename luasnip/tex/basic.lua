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

local get_visual = function(args, parent)
  if #parent.snippet.env.SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.SELECT_RAW))
  else -- If SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

return {
  s(
    { trig = "td", wordTrig = true, snippetType = "autosnippet" },
    { t("_{"), i(1), t("}"), i(0) },
    { condition = tex.in_mathzone }
  ),
  --自动下标
  s(
    { trig = "([%a%)%]%}])(%d)", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("<>_<>", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      f(function(_, snip)
        return snip.captures[2]
      end),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "([%a%)%]%}])_(%d)(%d)", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("<>_{<><>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      f(function(_, snip)
        return snip.captures[2]
      end),
      f(function(_, snip)
        return snip.captures[3]
      end),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "(%a)(%a)%2", regTrig = true, wordTrig = true, snippetType = "autosnippet", priority = 100 },
    fmta("<>_<>", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      f(function(_, snip)
        return snip.captures[2]
      end),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "([%a%)%]%}])_(%a)(%a)%3", regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 2000 },
    fmta("<>_{<><>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      f(function(_, snip)
        return snip.captures[2]
      end),
      f(function(_, snip)
        return snip.captures[3]
      end),
    }),
    { condition = tex.in_mathzone }
  ),

  s(
    { trig = "(%d+)/", regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 100 },
    fmta("\\frac{<>}{<>}<>", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
      i(0),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "(%a)/", regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 100 },
    fmta("\\frac{<>}{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
    }),
    { condition = tex.in_mathzone }
  ),
  s( -- 带括号的分数
    { trig = "%((.+)%)/", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("\\frac{<>}{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "(\\%a+)/", regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 2000 },
    fmta("\\frac{<>}{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "(\\%a+%{%a+%})/", regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 3000 },
    fmta("\\frac{<>}{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "\\%)(%a)", regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 2000 },
    fmta("\\) <>", {
      f(function(_, snip)
        return snip.captures[1]
      end),
    })
  ),

  s(
    { trig = "lim", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    c(1, {
      sn(nil, { t("\\lim "), i(1) }),
      sn(nil, { t("\\lim_{"), i(1, "x"), t(" \\to "), i(2, "\\infty"), t("} "), i(0) }),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "sum", snippetType = "autosnippet" },
    c(1, {
      sn(nil, { t("\\sum_{"), i(1), t("}^{"), i(2), t("} ") }),
      sn(nil, { t("\\sum_{"), i(1), t("} ") }),
      sn(nil, { t("\\sum"), i(1) }),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "prod", snippetType = "autosnippet" },
    c(1, {
      sn(nil, { t("\\prod{"), i(1), t("}^{"), i(2), t("} ") }),
      sn(nil, { t("\\prod{"), i(1), t("} ") }),
      sn(nil, { t("\\prod"), i(1) }),
    }),
    { condition = tex.in_mathzone }
  ),

  s(
    { trig = "bnn", regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 2000 },
    fmta("\\bigcap\\limits_{<>}^{<>}", {
      i(1),
      i(0),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "buu", regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 2000 },
    fmta("\\bigcup\\limits_{<>}^{<>}", {
      i(1),
      i(0),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "dint", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    c(1, {
      sn(
        nil,
        fmta("\\int_{<>}^{<>} <> \\mathrm{d}<> <>", {
          i(1, "-\\infty"),
          i(2, "+\\infty"),
          i(3),
          i(4, "x"),
          i(0),
        })
      ),
      sn(
        nil,
        fmta("\\int <> \\mathrm{d}<> <>", {
          i(1),
          i(2, "x"),
          i(0),
        })
      ),
    }),
    { condition = tex.in_mathzone }
  ),
}
