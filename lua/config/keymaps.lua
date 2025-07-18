-- Keymaps are automatically loaded on the VeryLazy event
if vim.fn.executable("btop") == 1 then
  -- btop
  vim.keymap.set("n", "<leader>xb", function() Snacks.terminal.open({ "btop" }, { esc_esc = false, ctrl_hjkl = false }) end, { desc = "btop" })
end