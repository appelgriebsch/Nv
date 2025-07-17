-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- disable some extension providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

vim.cmd[[nnoremap <ScrollWheelRight> <Nop>]]
vim.cmd[[nnoremap <ScrollWheelLeft> <Nop>]]
vim.cmd[[nnoremap <S-ScrollWheelUp> <ScrollWheelRight>]]
vim.cmd[[nnoremap <S-ScrollWheelDown> <ScrollWheelLeft>]]