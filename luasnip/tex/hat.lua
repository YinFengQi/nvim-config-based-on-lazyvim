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
    { trig = "(%a+)hat", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("\\hat{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "(%\\%a+)hat", regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 2000 },
    fmta("\\hat{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
    }),
    { condition = tex.in_mathzone }
  ),

  s(
    { trig = "(%a)dot", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("\\dot{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "(%\\%a+)dot", regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 2000 },
    f(function(_, snip)
      return snip.captures[1] ~= "\\c" and "\\dot{" .. snip.captures[1] .. "}" or snip.captures[1] .. "dot"
    end),
    { condition = tex.in_mathzone }
  ),

  s(
    { trig = "(%a+)dag", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("<>^{\\dagger}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "(%\\%a+)dag", regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 2000 },
    fmta("<>^{\\dagger}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
    }),
    { condition = tex.in_mathzone }
  ),

  s(
    { trig = "(%a+)hvec", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("\\vec{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
    }),
    { condition = tex.in_mathzone }
  ),

  s(
    { trig = "(%a+)htd", regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 1900 },
    fmta("\\tilde{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "(%\\%a+)htd", regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 2000 },
    fmta("\\tilde{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
    }),
    { condition = tex.in_mathzone }
  ),

  s(
    { trig = "(%a)bar", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("\\bar{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "(%\\%a+)bar", regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 2000 },
    fmta("\\bar{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
    }),
    { condition = tex.in_mathzone }
  ),

  s(
    { trig = "hsq", wordTrig = false, snippetType = "autosnippet" },
    fmta("\\sqrt{<>}<>", { i(1), i(0) }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "(%a+)hsq", regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 1500 },
    d(1, function(_, snip)
      return sn(
        nil,
        c(1, {
          sn(nil, { t("\\sqrt{"), t(snip.captures[1]), i(1), t("}"), i(0) }),
          sn(nil, { t("\\sqrt["), i(2), t("]{"), t(snip.captures[1]), i(1), t("}"), i(0) }),
        })
      )
    end, {}),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "(%\\%a+)hsq", regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 2000 },
    d(1, function(_, snip)
      return sn(
        nil,
        c(1, {
          sn(nil, { t("\\sqrt{"), t(snip.captures[1]), t("}"), i(1) }),
          sn(nil, { t("\\sqrt["), i(1), t("]{"), t(snip.captures[1]), t("}"), i(2) }),
        })
      )
    end, {}),
    { condition = tex.in_mathzone }
  ),
}
