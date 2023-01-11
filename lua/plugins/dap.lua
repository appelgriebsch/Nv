return {

  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
      {
        "theHamsta/nvim-dap-virtual-text",
        config = true
      },
    },
    config = function()
      vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })
      vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "", linehl = "", numhl = "" })
      vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "", linehl = "", numhl = "" })
      vim.fn.sign_define("DapLogPoint", { text = "", texthl = "", linehl = "", numhl = "" })
      vim.fn.sign_define("DapStopped", { text = "", texthl = "", linehl = "", numhl = "" })
      require("dap").defaults.fallback.terminal_win_cmd = "enew"
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "dap-repl",
        callback = function()
          require("dap.ext.autocompl").attach()
        end
      })
      require("which-key").register({
        ["<leader>db"] = { name = "+breakpoints" },
        ["<leader>ds"] = { name = "+steps" },
        ["<leader>dv"] = { name = "+views" },
      })
    end,
    keys = {
      { "<leader>dbc", "<CMD>lua require(\"dap\").set_breakpoint(vim.ui.input(\"Breakpoint condition: \"))<CR>",
        desc = "conditional breakpoint" },
      { "<leader>dbl", "<CMD>lua require(\"dap\").set_breakpoint(nil, nil, vim.ui.input(\"Log point message: \"))<CR>",
        desc = "logpoint" },
      { "<leader>dbr", "<CMD>lua require(\"dap.breakpoints\").clear()<CR>", desc = "remove all" },
      { "<leader>dbs", "<CMD>Telescope dap list_breakpoints<CR>", desc = "show all" },
      { "<leader>dbt", "<CMD>lua require(\"dap\").toggle_breakpoint()<CR>", desc = "toggle breakpoint" },
      { "<leader>dc", "<CMD>lua require(\"dap\").continue()<CR>", desc = "continue" },
      { "<leader>de", "<CMD>lua require(\"dap.ui.widgets\").hover()<CR>", desc = "expression", mode = { "n", "v" } },
      { "<leader>dp", "<CMD>lua require(\"dap\").pause()<CR>", desc = "pause" },
      { "<leader>dr", "<CMD>Telescope dap configurations<CR>", desc = "run" },
      { "<leader>dsb", "<CMD>lua require(\"dap\").step_back()<CR>", desc = "step back" },
      { "<leader>dsc", "<CMD>lua require(\"dap\").run_to_cursor()<CR>", desc = "step to cursor" },
      { "<leader>dsi", "<CMD>lua require(\"dap\").step_into()<CR>", desc = "step into" },
      { "<leader>dso", "<CMD>lua require(\"dap\").step_over()<CR>", desc = "step over" },
      { "<leader>dsx", "<CMD>lua require(\"dap\").step_out()<CR>", desc = "step out" },
      { "<leader>dx", "<CMD>lua require(\"dap\").terminate()<CR>", desc = "terminate" },
      { "<leader>dvf", "<CMD>lua require(\"dap.ui.widgets\").centered_float(require(\"dap.ui.widgets\").frames)<CR>",
        desc = "show frames" },
      { "<leader>dvs", "<CMD>lua require(\"dap.ui.widgets\").centered_float(require(\"dap.ui.widgets\").scopes)<CR>",
        desc = "show scopes" },
      { "<leader>dvt", "<CMD>lua require(\"dap.ui.widgets\").centered_float(require(\"dap.ui.widgets\").threads)<CR>",
        desc = "show threads" },
    }
  },

}
