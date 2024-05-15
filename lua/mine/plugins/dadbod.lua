return {
  {
    "tpope/vim-dadbod",
  },
  {
    "kristijanhusak/vim-dadbod-completion",
    dependencies = { "hrsh7th/nvim-cmp" },
    keys = {
      { "<leader>dt", "<cmd>DBUIToggle<cr>", desc = "Toggle DBUI" },
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup.filetype({ "sql" }, {
        sources = {
          { name = "vim-dadbod-completion" },
          { name = "buffer" },
        },
      })
    end,
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
}
