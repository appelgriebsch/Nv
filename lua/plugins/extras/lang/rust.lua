return {

  -- add rust to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "rust", "toml" })
    end,
  },

  -- correctly setup mason lsp / dap extensions
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "codelldb", "rust-analyzer", "taplo" })
    end,
  },

  -- correctly setup lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = { "simrat39/rust-tools.nvim" },
    opts = {
      -- make sure mason installs the server
      setup = {
        rust_analyzer = function(_, opts)
          require("lazyvim.util").on_attach(function(client, buffer)
            -- stylua: ignore
            if client.name == "rust_analyzer" then
              vim.keymap.set("n", "K", "<CMD>RustHoverActions<CR>", { buffer = buffer, desc = "Hover Actions" })
            end
          end)
          local mason_registry = require("mason-registry")
          -- rust tools configuration for debugging support
          local codelldb = mason_registry.get_package("codelldb")
          local extension_path = codelldb:get_install_path() .. '/extension/'
          local codelldb_path = extension_path .. 'adapter/codelldb'
          local liblldb_path = vim.fn.has "mac" == 1 and extension_path .. 'lldb/lib/liblldb.dylib' or
              extension_path .. 'lldb/lib/liblldb.so'
          local rust_tools_opts = vim.tbl_deep_extend("force", opts, {
            dap = {
              adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)
            },
            tools = {
              hover_actions = {
                auto_focus = false,
              },
              inlay_hints = {
                auto = false,
                show_parameter_hints = true,
              },
            },
            settings = {
              ["rust-analyzer"] = {
                cargo = {
                  allFeatures = true,
                  loadOutDirsFromCheck = true,
                  runBuildScripts = true,
                },
                -- Add clippy lints for Rust.
                checkOnSave = {
                  command = 'clippy',
                },
                procMacro = {
                  enable = true,
                },
              }
            }
          })
          require("rust-tools").setup(rust_tools_opts)
          return true
        end
      },
    },
  },
}
