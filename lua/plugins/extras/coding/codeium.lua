return {

  -- copilot cmp source
  {
    "nvim-cmp",
    commit = "6c84bc75c64f778e9f1dcb798ed41c7fcb93b639", -- lock update (break codeium)
    dependencies = {
      {
        "jcdickinson/codeium.nvim",
        opts = {},
        config = function(_, opts)
          require("codeium").setup(opts)
        end,
      },
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, 1, { name = "codeium", group_index = 2 })
      opts.sorting = opts.sorting or require("cmp.config.default")().sorting
    end,
  },

}
