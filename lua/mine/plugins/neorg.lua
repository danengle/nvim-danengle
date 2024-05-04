return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
  {
    "nvim-neorg/neorg",
    dependencies = { "luarocks.nvim" },
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
        },
      })
      vim.wo.foldlevel = 99
      vim.wo.conceallevel = 2
    end,
  },
}
