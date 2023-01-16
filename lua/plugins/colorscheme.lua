return {

  -- disable tokyonight
  { "folke/tokyonight.nvim", enabled = false },

  -- disable catppuccin
  { "catppuccin/nvim", name = "catppuccin", enabled = false },

  { "projekt0n/github-nvim-theme", branch = "0.0.x" },

  -- Configure LazyVim to load github-dark color scheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        require("github-theme").setup({
          theme_style = "dark",
          dark_float = true,
          dark_sidebar = true,
          dev = true,
          comment_style = "NONE",
          keyword_style = "NONE",
          function_style = "NONE",
          variable_style = "NONE",
          overrides = function(c)
            return {
              AlphaHeader = { fg = c.blue },
              AlphaButtons = { fg = c.green },
              AlphaShortcut = { fg = c.yellow }
            }
          end
        })
      end
    },
  },

}
