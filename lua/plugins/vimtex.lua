return {
  "lervag/vimtex",
  -- lazy = true,
  config = function()
    vim.cmd([[
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
" let g:tex_conceal='abdmg'
let g:vimtex_syntax_conceal = {
          \ 'accents': 1,
          \ 'ligatures': 1,
          \ 'cites': 1,
          \ 'fancy': 1,
          \ 'spacing': 1,
          \ 'greek': 1,
          \ 'math_bounds': 1,
          \ 'math_delimiters': 1,
          \ 'math_fracs': 1,
          \ 'math_super_sub': 1,
          \ 'math_symbols': 1,
          \ 'sections': 0,
          \ 'styles': 1,
          \}


]])

    --     vim.cmd([[
    -- let g:vimtex_compiler_latexmk = {
    --         \ 'aux_dir' : '',
    --         \ 'out_dir' : '',
    --         \ 'callback' : 1,
    --         \ 'continuous' : 1,
    --         \ 'executable' : 'latexmk',
    --         \ 'hooks' : [],
    --         \ 'options' : [
    --         \   '-verbose',
    --         \   '-file-line-error',
    --         \   '-synctex=1',
    --         \   '-interaction=nonstopmode',
    --         \ ],
    --         \}
    --
    -- ]])
  end,
}
