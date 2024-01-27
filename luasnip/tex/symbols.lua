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
    trig = [[oo]],
    snippetType = "autosnippet",
    wordTrig = false,
  }, t("\\infty "), { condition = tex.in_mathzone }),

  s({
    trig = [[...]],
    snippetType = "autosnippet",
    wordTrig = false,
  }, t("\\cdots "), { condition = tex.in_mathzone }),
  s({
    trig = [[+-]],
    snippetType = "autosnippet",
    wordTrig = false,
  }, t("\\pm "), { condition = tex.in_mathzone }),

  s({
    trig = [[RR]],
    snippetType = "autosnippet",
    wordTrig = true,
  }, t("\\mathbb{R}"), { condition = tex.in_mathzone }),
  s({
    trig = [[ZZ]],
    snippetType = "autosnippet",
    wordTrig = true,
  }, t("\\mathbb{Z}"), { condition = tex.in_mathzone }),
  s({
    trig = [[EE]],
    snippetType = "autosnippet",
    wordTrig = true,
  }, t("\\exists "), { condition = tex.in_mathzone }),
  s({
    trig = [[AA]],
    snippetType = "autosnippet",
    wordTrig = true,
  }, t("\\forall "), { condition = tex.in_mathzone }),

  s({
    trig = [[inn]],
    snippetType = "autosnippet",
    wordTrig = true,
  }, t("\\in "), { condition = tex.in_mathzone }),

  -- 下面是一些等号
  s({
    trig = [[==]],
    snippetType = "autosnippet",
    wordTrig = true,
  }, t("\\equiv "), { condition = tex.in_mathzone }),
  s({
    trig = [[!=]],
    snippetType = "autosnippet",
    wordTrig = true,
  }, t("\\neq "), { condition = tex.in_mathzone }),
  s({
    trig = [[>=]],
    snippetType = "autosnippet",
    wordTrig = true,
  }, t("\\ge "), { condition = tex.in_mathzone }),
  s({
    trig = [[<=]],
    snippetType = "autosnippet",
    wordTrig = true,
  }, t("\\le "), { condition = tex.in_mathzone }),

  s({
    trig = [[sim]],
    snippetType = "autosnippet",
    wordTrig = true,
  }, t("\\sim "), { condition = tex.in_mathzone }),

  s({
    trig = [[\sim eq]],
    snippetType = "autosnippet",
    wordTrig = true,
  }, t("\\simeq "), { condition = tex.in_mathzone }),

  -- 下面是不等号
  s({
    trig = [[>>]],
    snippetType = "autosnippet",
    wordTrig = false,
  }, t("\\gg "), { condition = tex.in_mathzone }),
  s({
    trig = [[<<]],
    snippetType = "autosnippet",
    wordTrig = false,
  }, t("\\ll "), { condition = tex.in_mathzone }),

  -- 下面是推导符号
  s({
    trig = [[=>]],
    snippetType = "autosnippet",
    wordTrig = true,
  }, t("\\implies "), { condition = tex.in_mathzone }),
  s({
    trig = [[=<]],
    snippetType = "autosnippet",
    wordTrig = true,
  }, t("\\impliedby "), { condition = tex.in_mathzone }),
  s({
    trig = [[\le >]],
    snippetType = "autosnippet",
    wordTrig = true,
  }, t("\\iff "), { condition = tex.in_mathzone }),
}
