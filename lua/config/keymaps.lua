-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
if vim.fn.executable("gitui") == 1 then
  -- gitui instead of lazygit
  vim.keymap.set("n", "<leader>gg", function() require("lazyvim.util").float_term({ "gitui" }) end, { desc = "gitui (cwd)" })
  vim.keymap.set("n", "<leader>gG", function() require("lazyvim.util").float_term({ "gitui" }, { cwd = require("lazyvim.util").get_root() }) end, { desc = "gitui (root dir)" })
end

if vim.fn.executable("btop") == 1 then
  -- btop
  vim.keymap.set("n", "<leader>xb", function() require("lazyvim.util").float_term({ "btop" }) end, { desc = "btop" })
end

if os.getenv("FLATPAK_ID") ~= nil then
  -- floating terminal
  local term_cmd = {"flatpak-spawn", "--host", "--env=TERM=xterm-256color", "zsh"}
  vim.keymap.set("n", "<leader>ft", function() require("lazyvim.util").float_term(term_cmd, { cwd = require("lazyvim.util").get_root() }) end, { desc = "Terminal (root dir)" })
  vim.keymap.set("n", "<leader>fT", function() require("lazyvim.util").float_term(term_cmd) end, { desc = "Terminal (cwd)" })
  -- gitui instead of lazygit
  local gitui_cmd = {"flatpak-spawn", "--host", "--env=TERM=xterm-256color", "gitui"}
  vim.keymap.set("n", "<leader>gg", function() require("lazyvim.util").float_term(gitui_cmd) end, { desc = "gitui (cwd)" })
  vim.keymap.set("n", "<leader>gG", function() require("lazyvim.util").float_term(gitui_cmd, { cwd = require("lazyvim.util").get_root() }) end, { desc = "gitui (root dir)" })
end
