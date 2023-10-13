return {
  -- disable mini.bufremove
  { "echasnovski/mini.bufremove", enabled = false },

  -- use bdelete instead
  {
    "famiu/bufdelete.nvim",
    config = function(_, opts)
      -- close some filetypes with <q>
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "dap-terminal",
        },
        callback = function(event)
          vim.keymap.set("n", "q", "<cmd>bdelete!<cr>", { buffer = event.buf, silent = true })
        end,
      })
      -- switches to dashboard when last buffer is closed
      local dashboard_on_empty = vim.api.nvim_create_augroup("dashboard_on_empty", { clear = true })
      vim.api.nvim_create_autocmd("User", {
        pattern = "BDeletePost*",
        group = dashboard_on_empty,
        callback = function(event)
          local Util = require("lazyvim.util")
          local fallback_name = vim.api.nvim_buf_get_name(event.buf)
          local fallback_ft = vim.api.nvim_buf_get_option(event.buf, "filetype")
          local fallback_on_empty = fallback_name == "" and fallback_ft == ""
          if fallback_on_empty then
            if Util.has("neo-tree.nvim") then
              vim.cmd([[Neotree close]])
            end
            if Util.has("aerial.nvim") then
              vim.cmd([[AerialCloseAll]])
            end
            if Util.has("dashboard-nvim") then
              vim.cmd([[Dashboard]])
            end
            if Util.has("alpha-nvim") then
              vim.cmd([[Alpha]])
            end
            vim.cmd(event.buf .. "bwipeout")
          end
        end,
      })
    end,
    keys = {
      { "<leader>bd", "<CMD>Bdelete<CR>", desc = "Delete Buffer" },
      { "<leader>bD", "<CMD>Bdelete!<CR>", desc = "Delete Buffer (Force)" },
    },
  },

  -- bufferline
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
        right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
      }
    }
  },

}
