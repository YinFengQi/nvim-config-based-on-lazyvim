-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.cmd([[set conceallevel=2]])

if vim.g.neovide then
  -- 这些都是neovide里面专用的东西, 除此之外
  -- 因为neovide不是在一个interactive shell里面启动的, 所以需要自己再处理一下环境变量
  -- neovide的配置在 ~/.zprofile 或者 ~/.zlogin 里面
  vim.g.neovide_scale_factor = 1
  vim.o.guifont = "JetBrainsMono Nerd Font:h14"
  vim.g.neovide_transparency = 0.6
  vim.g.neovide_transparency_point = 0.8
  vim.opt.linespace = -1
end

vim.cmd.sleep("10m") -- 如果没有这个延时, 信息就不能显示出来了

if string.match(vim.env.PATH, "tex") then
  vim.cmd([[echo "this env has latex"]])
else
  vim.cmd([[echo "this env has no latex, restart from shell might work?"]])
end

vim.cmd([[
set spell
set spelllang=en,cjk]])
