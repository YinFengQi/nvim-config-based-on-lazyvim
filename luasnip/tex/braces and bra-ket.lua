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
    return parent.snippet.env.SELECT_RAW
  else -- If SELECT_RAW is empty, return a blank insert node
    return ""
  end
end

return {
  s({
    trig = [[@\)]],
    snippetType = "autosnippet",
    wordTrig = false,
    trigEngine = "ecma",
  }, {
    t("\\left( "),
    i(1),
    t(" \\right)"),
    i(0),
  }, { condition = tex.in_mathzone }),

  s({
    trig = [[(@\])]],
    snippetType = "autosnippet",
    wordTrig = false,
    trigEngine = "ecma",
  }, {
    t("\\left[ "),
    i(1),
    t(" \\right]"),
    i(0),
  }, { condition = tex.in_mathzone }),

  s({
    trig = [[(@\})]],
    snippetType = "autosnippet",
    wordTrig = false,
    trigEngine = "ecma",
  }, {
    t("\\left\\{ "),
    i(1),
    t(" \\right\\}"),
    i(0),
  }, { condition = tex.in_mathzone }),

  s({
    trig = "set",
    snippetType = "autosnippet",
    wordTrig = true,
  }, {
    t("\\{ "),
    i(1),
    t(" \\}"),
    i(0),
  }, { condition = tex.in_mathzone }),
}
