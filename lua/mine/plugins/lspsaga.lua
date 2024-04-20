return {
  "nvimdev/lspsaga.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>cs", "<cmd>Lspsaga finder def+ref+imp<CR>", desc = "Show defs, refs, and imps" },
    { "<leader>ck", "<cmd>Lspsaga hover_doc<CR>", desc = "Show Lspsaga hover doc" },
  },
  opts = {
    finder = {
      left_width = 0.25,
      max_height = 0.75,
    },
  },
  config = true,
  --   function()
  --   require("lspsaga").setup({})
  -- end,
}
