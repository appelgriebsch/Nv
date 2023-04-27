return {

  -- extend auto completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "vuki656/package-info.nvim",
        event = { "BufRead package.json" },
        config = true,
      },
      {
        "David-Kunz/cmp-npm",
        event = { "BufRead package.json" },
        config = true,
      }
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
        { name = "npm", keyword_length = 3 },
      }))
    end
  },

  -- add rust to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "css", "html", "javascript", "jsdoc", "scss" })
    end,
  },

  -- correctly setup mason lsp extensions
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "css-lsp", "html-lsp", "stylelint-lsp", "typescript-language-server" })
    end,
  },

  -- correctly setup mason dap extensions
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "js" })
    end,
  },

  {
    "mxsdev/nvim-dap-vscode-js",
    event = "VeryLazy",
    config = function()
      local dap = require("dap")
      local dap_js = require("dap-vscode-js")
      local mason_registry = require("mason-registry")
      if mason_registry.is_installed("js-debug-adapter") then
        -- vscode-js configuration for debugging support
        local js_debug_pkg = mason_registry.get_package("js-debug-adapter")
        local js_debug_path = js_debug_pkg:get_install_path()
        dap_js.setup({
          debugger_path = js_debug_path,
          adapters = { "pwa-node", "node-terminal" }, -- which adapters to register in nvim-dap
        })
        for _, language in ipairs({ "typescript", "javascript" }) do
          dap.configurations[language] = {
            {
              type = "pwa-node",
              request = "launch",
              name = "Launch file (" .. language .. ")",
              program = "${file}",
              cwd = "${workspaceFolder}",
            },
            {
              type = "pwa-node",
              request = "attach",
              name = "Attach (" .. language .. ")",
              processId = require("dap.utils").pick_process,
              cwd = "${workspaceFolder}",
            }
          }
        end
      end
    end
  },

}
