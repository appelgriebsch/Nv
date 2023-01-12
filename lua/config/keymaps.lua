-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

vim.keymap.set("n", "<leader>ft", function() require("lazyvim.util").float_term(nil, { cwd = require("lazyvim.util").get_root(), border = "rounded" }) end, { desc = "Terminal (root dir)" })
vim.keymap.set("n", "<leader>fT", function() require("lazyvim.util").float_term(nil, { border = "rounded" }) end, { desc = "Terminal (cwd)" })

if vim.fn.executable("gitui") == 1 then
  -- gitui instead of lazygit
  vim.keymap.set("n", "<leader>gg", function() require("lazyvim.util").float_term({ "gitui" }, { border = "rounded" }) end, { desc = "gitui (cwd)" })
  vim.keymap.set("n", "<leader>gG", function() require("lazyvim.util").float_term({ "gitui" }, { cwd = require("lazyvim.util").get_root(), border = "rounded" }) end, { desc = "gitui (root dir)" })
end

if vim.fn.executable("btop") == 1 then
  -- btop
  vim.keymap.set("n", "<leader>xb", function() require("lazyvim.util").float_term({ "btop" }, { border = "rounded" }) end, { desc = "btop" })
end
