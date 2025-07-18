return {
  -- undo mode
  {
    "telescope.nvim",
    dependencies = {
      {
        "debugloop/telescope-undo.nvim",
        event = "VeryLazy",
        opts = {},
        config = function(_, opts)
          require("lazyvim.util").on_load("telescope.nvim", function()
            require("telescope").load_extension("undo")
          end)
        end,
      },
    },
    opts = {
      extensions = {
        undo = {
          use_delta = true,
          side_by_side = true,
          layout_strategy = "vertical",
          layout_config = {
            preview_height = 0.4,
          },
        },
      },
    }
  }
}