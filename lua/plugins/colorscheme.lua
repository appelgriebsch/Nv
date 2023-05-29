return {

  -- disable catppuccin
  { "catppuccin/nvim", name = "catppuccin", enabled = false },

  -- load github nvim theme
  { "projekt0n/github-nvim-theme" },

  -- load onedarkpro nvim theme
  { "olimorris/onedarkpro.nvim" },

  -- Configure LazyVim to load color scheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        local colorscheme = os.getenv("NV_THEME") or "dark"
        local theme = ""
        if colorscheme ~= nil then
          if string.match(colorscheme, "[G|g]it[H|h]ub") ~= nil then
            theme = "github"
          else
            if string.match(colorscheme, "[O|o]ne[D|d]ark") ~= nil then
              theme = "onedark"
            end
          end
          if string.match(colorscheme, "[L|l]ight") then
            colorscheme = "light"
            vim.o.background = "light"
          else
            colorscheme = "dark"
            vim.o.background = "dark"
          end
        end
        local has_theme, nvim_theme = pcall(require, "plugins.extras.theme." .. theme)
        if has_theme then
          nvim_theme.setup(colorscheme)
        else
          require("tokyonight").load() -- fallback to tokyo night if not otherwise specified
        end
      end
    },
  },

}
