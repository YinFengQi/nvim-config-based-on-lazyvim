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

local gen_mat = function(ncol, nrow)
  local M = {}

  for x = 1, nrow, 1 do
    local N = {}
    table.insert(N, i(1 + (x - 1) * ncol))
    for y = 2, ncol, 1 do
      table.insert(N, t(" & "))
      table.insert(N, i(y + (x - 1) * ncol))
    end
    table.insert(N, t({ "\\\\", "" }))

    for _, v in ipairs(N) do
      table.insert(M, v)
    end
  end
  return sn(nil, M)
end

return {
  s({
    trig = [[(b|p|v|m)mat(\d)]],
    snippetType = "autosnippet",
    wordTrig = true,
    trigEngine = "ecma",
    priority = 1500,
  }, {
    f(function(_, snip)
      return { "\\begin{" .. (snip.captures[1] ~= "m" and snip.captures[1] or "") .. "matrix}", "" }
    end),
    d(1, function(_, parent)
      return gen_mat(parent.snippet.captures[2], parent.snippet.captures[2])
    end, {}, { user_args = {} }),
    f(function(_, snip)
      return { "\\end{" .. (snip.captures[1] ~= "m" and snip.captures[1] or "") .. "matrix}" }
    end),
    i(0),
  }, { condition = tex.in_mathzone }),
}
