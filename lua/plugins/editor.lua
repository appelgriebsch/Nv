return {
  -- disable file explorer as it has some issues with
  -- opening files in tabs
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },

  -- customize telescope
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = require('telescope.themes').get_ivy({
        prompt_prefix = " ",
        selection_caret = " ",
        layout_config = {
          height = 0.33,
        },
        mappings = {
          i = {
            ["<C-j>"] = function(...)
              return require("telescope.actions").move_selection_next(...)
            end,
            ["<C-k>"] = function(...)
              return require("telescope.actions").move_selection_previous(...)
            end,
            ["<C-p>"] = function(...)
              return require("telescope.actions.layout").toggle_preview(...)
            end
          },
          n = {
            ["j"] = function(...)
              return require("telescope.actions").move_selection_next(...)
            end,
            ["k"] = function(...)
              return require("telescope.actions").move_selection_previous(...)
            end,
            ["gg"] = function(...)
              return require("telescope.actions").move_to_top(...)
            end,
            ["G"] = function(...)
              return require("telescope.actions").move_to_bottom(...)
            end,
            ["<C-p>"] = function(...)
              return require("telescope.actions.layout").toggle_preview(...)
            end
          }
        },
      }),
    },
  },
}