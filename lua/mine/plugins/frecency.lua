return {
  "nvim-telescope/telescope-frecency.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  lazy = false,
  opts = {
    show_scores = true,
    ignore_patterns = { "*.git/*", "*/tmp/*", "term://*", "*/node_modules/*" },
  },
  config = function(_, opts)
    require("frecency.config").setup(opts)
    require("telescope").load_extension("frecency")
  end,
  keys = {
    { "<leader>fr", "<cmd>Telescope frecency workspace=CWD<CR>", desc = "Find frecent files in CWD" },
  },
}
