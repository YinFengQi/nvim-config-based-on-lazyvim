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

local differential = function(diff, order)
  if order == 1 then
    return sn(
      nil,
      fmta([[\frac{]] .. diff .. [[ <>}{]] .. diff .. [[ <>]] .. [[}<>]], {
        i(1),
        i(2),
        i(0),
      })
    )
  else
    return sn(
      nil,
      fmta([[\frac{]] .. diff .. [[^]] .. order .. [[ <>}{]] .. diff .. [[ <>^]] .. order .. [[}<>]], {
        i(1),
        i(2),
        i(0),
      })
    )
  end
end

local full_derivative = function(_, _, _, diff)
  M = {}
  for i = 1, 9, 1 do
    table.insert(M, differential(diff, i))
  end
  return sn(nil, { c(1, M) })
end

return {
  s({
    trig = "dd",
    snippetType = "autosnippet",
    wordTrig = true,
    trigEngine = "pattern",
  }, t("\\mathrm{d} "), { condition = tex.in_mathzone }),

  s({
    trig = "DD",
    snippetType = "autosnippet",
    wordTrig = true,
    trigEngine = "pattern",
  }, t("\\mathcal{D} "), { condition = tex.in_mathzone }),

  s({
    trig = "diff",
    snippetType = "autosnippet",
    wordTrig = true,
    trigEngine = "pattern",
  }, d(1, full_derivative, {}, { user_args = { [[\mathrm{d}]] } }), { condition = tex.in_mathzone }),
  s({
    trig = "part",
    snippetType = "autosnippet",
    wordTrig = true,
    trigEngine = "pattern",
  }, d(1, full_derivative, {}, { user_args = { [[\partial]] } }), { condition = tex.in_mathzone }),
  s({
    trig = "vara",
    snippetType = "autosnippet",
    wordTrig = true,
    trigEngine = "pattern",
  }, d(1, full_derivative, {}, { user_args = { [[\delta]] } }), { condition = tex.in_mathzone }),

  s(
    {
      trig = [[([2-9])diff]],
      snippetType = "autosnippet",
      wordTrig = true,
      trigEngine = "ecma",
    },
    d(1, function(_, parent)
      return differential([[\mathrm{d}]], parent.snippet.captures[1])
    end, {}),
    { condition = tex.in_mathzone }
  ),

  s(
    {
      trig = [[([2-9])part]],
      snippetType = "autosnippet",
      wordTrig = true,
      trigEngine = "ecma",
    },
    d(1, function(_, parent)
      return differential([[\partial]], parent.snippet.captures[1])
    end, {}),
    { condition = tex.in_mathzone }
  ),
}
