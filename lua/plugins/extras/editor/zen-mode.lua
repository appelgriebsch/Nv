return {
  -- add zen-mode
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {},
    keys = {
      { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" }
    },
  },
}
