return {
  "lervag/vimtex",
  -- lazy = true,
  config = function()
    vim.cmd([[
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=0]])
    vim.cmd([[let g:vimtex_compiler_method = 'tectonic' ]])
    vim.g.vimtex_compiler_method = "tectonic"
  end,
}
