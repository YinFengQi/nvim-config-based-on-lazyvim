-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

if vim.g.neovide then
  -- 这些都是neovide里面专用的东西, 除此之外
  -- 因为neovide不是在一个interactive shell里面启动的, 所以需要自己再处理一下环境变量
  -- neovide的配置在 ~/.zprofile 或者 ~/.zlogin 里面
  vim.g.neovide_scale_factor = 1
  vim.o.guifont = "Hack Nerd Font Mono:h14"
  vim.g.neovide_transparency = 0.9
  -- vim.g.neovide_transparency_point = 1
  -- vim.opt.linespace = -1
end

-- if string.match(vim.env.PATH, "tex") then
--   vim.notify("this env has latex")
-- else
--   vim.notify("this env has no latex, restart from shell might work?")
-- end

vim.cmd([[
set spell
set spelllang=en,cjk]])

vim.cmd([[let $http_proxy='127.0.0.1:7890'
let $http_proxy='127.0.0.1:7890']])
