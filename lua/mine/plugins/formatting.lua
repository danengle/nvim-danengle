return {
  -- {
  --   "frostplexx/mason-bridge.nvim",
  --   dependencies = {
  --     "williamboman/mason.nvim",
  --   },
  --   priority = 100,
  --   config = true,
  --   lazy = false,
  -- },
  {
    "stevearc/conform.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      -- "frostplexx/mason-bridge.nvim",
    },
    priority = 60,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require("conform")

      conform.setup({
        formatters_by_ft = {
          javascript = { "prettierd" },
          typescript = { "prettierd" },
          javascriptreact = { "prettierd" },
          typescriptreact = { "prettierd" },
          css = { "prettierd" },
          html = { "prettierd" },
          json = { "prettierd" },
          yaml = { "prettierd" },
          markdown = { "prettierd" },
          graphql = { "prettierd" },
          liquid = { "prettierd" },
          lua = { "stylua" },
        },
        format_on_save = {
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        },
      })

      vim.keymap.set({ "n", "v" }, "<leader>cf", function()
        conform.format({
          lsp_fallback = false,
          async = false,
          timeout_ms = 2000,
        })
      end, { desc = "Format file or range" })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    dependencies = {
      "williamboman/mason.nvim",
      -- "frostplexx/mason-bridge.nvim",
    },
    priority = 60,
  },
}
