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

return {
  s({
    trig = [[(?<!\\)(hbar|dagger|quad|qquad|to|max|min|sup|inf|mod)]],
    snippetType = "autosnippet",
    wordTrig = true,
    trigEngine = "ecma",
    priority = 1500,
  }, {
    f(function(_, snip)
      return "\\" .. snip.captures[1] .. " "
    end),
  }, { condition = tex.in_mathzone }),

  s({
    trig = [[2pi]],
    snippetType = "autosnippet",
    wordTrig = false,
  }, t("2\\pi "), { condition = tex.in_mathzone }),
  s({
    trig = [[(?<!\\)\b([a-zA-Z]+)opn]],
    snippetType = "autosnippet",
    wordTrig = false,
    trigEngine = "ecma",
    priority = 1500,
  }, {
    f(function(_, snip)
      return "\\operatorname{" .. snip.captures[1] .. "}"
    end),
  }, { condition = tex.in_mathzone }),

  s({
    trig = [[(?<!\\)(mu|alpha|sigma|rho|beta|Beta|gamma|delta|pi|zeta|eta|varepsilon|theta|iota|kappa|vartheta|lambda|xi|nu|pi|rho|tau|upsilon|varphi|phi|chi|psi|omega|Gamma|Delta|Theta|Lambda|Xi|Pi|Sigma|Upsilon|Phi|Psi|Omega)]],
    snippetType = "autosnippet",
    wordTrig = true,
    trigEngine = "ecma",
  }, {
    f(function(_, snip)
      return "\\" .. snip.captures[1] .. " "
    end),
  }, { condition = tex.in_mathzone }),

  s({
    trig = [[(?<!\\)(sin|cos|tan|arccot|cot|csc|ln|exp|det|arcsin|arccos|arctan|arccot|arccsc|arcsec|nabla|int)]],
    snippetType = "autosnippet",
    wordTrig = true,
    trigEngine = "ecma",
  }, {
    f(function(_, snip)
      return "\\" .. snip.captures[1] .. " "
    end),
  }, { condition = tex.in_mathzone }),

  s({
    trig = "dis",
    snippetType = "autosnippet",
    wordTrig = true,
  }, {
    t("\\displaystyle "),
  }, { condition = tex.in_mathzone }),

  s({
    trig = "ee",
    snippetType = "autosnippet",
    wordTrig = true,
  }, {
    t("\\mathrm{e}^{"),
    i(1),
    t("}"),
    i(0),
  }, { condition = tex.in_mathzone }),
  s({
    trig = "ii",
    snippetType = "autosnippet",
    wordTrig = true,
  }, {
    t("\\mathrm{i}"),
  }, { condition = tex.in_mathzone }),
}
