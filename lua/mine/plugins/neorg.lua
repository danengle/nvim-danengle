return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
  {
    "nvim-neorg/neorg",
    dependencies = { "luarocks.nvim", "nvim-treesitter/nvim-treesitter" },
    version = "*",
    lazy = false,
    keys = {
      { "<leader>ni", "<cmd>Neorg index<CR>", { desc = "Go to Neorg index", silent = true } },
      { "<leader>nr", "<cmd>Neorg return<CR>", { desc = "Return from Neorg", silent = true } },
    },
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/notes",
              },
              default_workspace = "notes",
            },
          },
          ["core.integrations.treesitter"] = {},
          ["core.integrations.nvim-cmp"] = {},
          -- ["core.completion"] = {
          --   config = {
          --     engine = "nvim-cmp",
          --   },
          -- },
          -- ["core.mode"] = {},
          -- ["core.queries.native"] = {},
          -- ["core.tempus"] = {},
          -- ["core.esupports.hop"] = {},
          -- ["core.ui"] = {},
          -- ["core.ui.calendar"] = {},
          -- ["core.ui.calendar.views.monthly"] = {},
          -- ["core.journal"] = {
          --   config = {
          --     journal_folder = "journal",
          --     toc_format = { "yy", "mm", "dd", "link", "title" },
          --     workspace = "default",
          --   },
          -- },
          -- ["core.pivot"] = {},
          -- ["core.itero"] = {},
          -- ["core.promo"] = {},
          -- ["core.qol.toc"] = {},
        },
      })
      vim.wo.foldlevel = 99
      vim.wo.conceallevel = 2
    end,
  },
}
