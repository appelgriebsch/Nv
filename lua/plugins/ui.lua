return {

  -- bufferline
  {
    "akinsho/nvim-bufferline.lua",
    opts = {
      options = {
        numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
        close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
        right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
        max_name_length = 30,
        max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
        show_buffer_icons = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = true,
        separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
        color_icons = false,
        diagnostics = false,
        highlights = {
          buffer_selected = {
            gui = "none"
          },
        },
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
          {
            filetype = "Outline",
            text = "Symbols Outline",
            highlight = "TSType",
            text_align = "left"
          }
        }
      }
    }
  },

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      local icons = require("lazyvim.config").icons

      local function fg(name)
        return function()
          ---@type {foreground?:number}?
          local hl = vim.api.nvim_get_hl_by_name(name, true)
          return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
        end
      end

      local function lsp_name(msg)
        msg = msg or "Inactive"
        local buf_clients = vim.lsp.buf_get_clients()
        if next(buf_clients) == nil then
          if type(msg) == "boolean" or #msg == 0 then
            return "Inactive"
          end
          return msg
        end
        local buf_client_names = {}

        for _, client in pairs(buf_clients) do
          if client.name ~= "null-ls" then
            table.insert(buf_client_names, client.name)
          end
        end

        return table.concat(buf_client_names, ", ")
      end

      opts.sections = vim.tbl_deep_extend("force", opts.sections, {
        lualine_c = {
          {
            "diff",
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
          },
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
          { "filename", padding = { left = 1, right = 1 } },
          -- stylua: ignore
          {
            function() return require("nvim-navic").get_location() end,
            cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
          },
        },
        lualine_x = {
          {
            lsp_name,
            icon = "",
            color = { gui = "none" },
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 1 } },
          { require("lazy.status").updates, cond = require("lazy.status").has_updates, color = fg("Special") },
        },
      })
    end
  },

  -- dashboard
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      local dashboard = require("alpha.themes.dashboard")
      opts.section.buttons.val = {
        dashboard.button("p", "  > Open project", "<CMD>Telescope project display_type=full<CR>"),
        dashboard.button("e", "  > New file", "<CMD>ene <BAR> startinsert<CR>"),
        dashboard.button("f", "  > Find file", "<CMD>cd $HOME/Projects | Telescope find_files<CR>"),
        dashboard.button("l", "  > Plugins", "<CMD>Lazy<CR>"),
        dashboard.button("m", "  > LSP Servers", "<CMD>Mason<CR>"),
        dashboard.button("r", "  > Recent files", "<CMD>Telescope oldfiles<CR>"),
        dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h | Telescope file_browser<CR>"),
        dashboard.button("q", "  > Quit NVIM", "<CMD>qa<CR>"),
      }
      opts.config.opts.setup = function()
        vim.api.nvim_create_autocmd("User", {
          pattern = "AlphaReady",
          desc = "disable tabline for alpha",
          callback = function()
            vim.opt.showtabline = 0
          end,
        })
        vim.api.nvim_create_autocmd("BufUnload", {
          buffer = 0,
          desc = "enable tabline after alpha",
          callback = function()
            vim.opt.showtabline = 2
          end,
        })
      end
    end
  },

  -- scrollbar for Neovim
  {
    "dstein64/nvim-scrollview",
    event = "BufReadPre",
    config = {
      excluded_filetypes = { "alpha", "neo-tree" },
      current_only = true,
      winblend = 75,
    }
  },

}
