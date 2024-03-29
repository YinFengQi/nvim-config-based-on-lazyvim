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
    trig = "txt",
    snippetType = "autosnippet",
    wordTrig = true,
    trigEngine = "pattern",
    priority = 1500,
  }, { t("\\text{"), f(get_visual), i(1), t("}"), i(0) }, { condition = tex.in_mathzone }),

  s(
    {
      trig = "(%a+)cal",
      snippetType = "autosnippet",
      wordTrig = true,
      trigEngine = "pattern",
    },
    { f(function(_, snip)
      return "\\mathcal{" .. string.upper(snip.captures[1]) .. "}"
    end) },
    { condition = tex.in_mathzone }
  ),
  s({
    trig = "(%a+)scr",
    snippetType = "autosnippet",
    wordTrig = true,
    trigEngine = "pattern",
  }, { f(function(_, snip)
    return "\\mathscr{" .. snip.captures[1] .. "}"
  end) }, { condition = tex.in_mathzone }),
}
