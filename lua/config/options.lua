-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- disable some extension providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

-- then you need to set the option below.
vim.g.lazyvim_picker = "telescope"

vim.cmd[[nnoremap <ScrollWheelRight> <Nop>]]
vim.cmd[[nnoremap <ScrollWheelLeft> <Nop>]]
vim.cmd[[nnoremap <S-ScrollWheelUp> <ScrollWheelRight>]]
vim.cmd[[nnoremap <S-ScrollWheelDown> <ScrollWheelLeft>]]

-- disable some fanzy UI stuff when run in Neovide
if vim.g.neovide then
  vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_floating_blur_amount_x = 0.0
  vim.g.neovide_floating_blur_amount_y = 0.0
  vim.g.neovide_floating_shadow = false
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_window_blurred = true

  vim.opt.guifont = 'MonaspiceKr Nerd Font Mono:h13'
end