return {
  -- disable file explorer as it has some issues with
  -- opening files in tabs
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },

  -- telescope file browser
  {
    "telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-file-browser.nvim",
        event = "VeryLazy",
        opts = {},
        config = function(_, opts)
          require("lazyvim.util").on_load("telescope.nvim", function()
            require("telescope").load_extension("file_browser")
          end)
        end,
      },
    },
    opts = {
      extensions = {
        file_browser = {
          theme = "ivy",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
        },
      },
    },
    keys = {
      { "<leader>e", "<CMD>Telescope file_browser<CR>", desc = "File Browser" },
    }
  }

}