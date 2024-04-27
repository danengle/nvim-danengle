return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional - Diff integration
    "nvim-telescope/telescope.nvim", -- optional
  },
  keys = {
    { "<leader>gn", "<cmd>Neogit<CR>", desc = "Open up Neogit" },
  },
  config = true,
}
