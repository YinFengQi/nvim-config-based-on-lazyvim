local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local f = ls.function_node
local i = ls.insert_node
local d = ls.dynamic_node
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local line_begin = require("luasnip.extras.expand_conditions").line_begin
local tex = require("util.latex")

-- local get_visual = function(args, parent)
--   if #parent.snippet.env.SELECT_RAW > 0 then
--     return sn(nil, i(1, parent.snippet.env.SELECT_RAW))
--   else -- If SELECT_RAW is empty, return a blank insert node
--     return sn(nil, i(1))
--   end
-- end

return {
  s({ trig = "vsp", snippetType = "autosnippet" }, {
    t("\\vspace{\\baselineskip}"),
  }),
  s("trig", {
    i(1),
    t("text"),
    i(2),
    t("text again"),
    i(3),
  }),
  s({ trig = "trigger", snippetType = "autosnippet" }, {}),
  s(
    { trig = "lim", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("\\lim_{<>}", {
      i(0),
    }),
    {
      condition = tex.in_mathzone,
    }
  ),
}
